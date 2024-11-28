#!/bin/bash

# Start the Python script
python3 - << 'EOF' &
from selenium import webdriver
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.common.by import By
from webdriver_manager.firefox import GeckoDriverManager
import time
import os

def setup_driver():
    firefox_options = Options()
    firefox_options.set_preference("browser.download.folderList", 2)
    firefox_options.set_preference("browser.download.manager.showWhenStarting", False)
    firefox_options.set_preference("browser.download.dir", os.getcwd())
    firefox_options.set_preference("browser.helperApps.neverAsk.saveToDisk", "application/x-debian-package")
    
    service = Service(GeckoDriverManager().install())
    driver = webdriver.Firefox(service=service, options=firefox_options)
    return driver

def download_exodus():
    driver = setup_driver()
    print("Navigating to Exodus download page...")
    driver.get('https://www.exodus.com/download')
    time.sleep(5)
    
    download_elements = driver.find_elements(By.XPATH, "//a[contains(@href, 'hashes-exodus')]")
    for elem in download_elements:
        href = elem.get_attribute("href")
        if href and 'hashes-exodus-' in href:
            version = href.split('hashes-exodus-')[1].split('.txt')[0]
            print(f"Found version: {version}")
            
            download_url = f"https://downloads.exodus.com/releases/exodus-linux-x64-{version}.deb"
            print(f"Attempting to download from: {download_url}")
            
            driver.get(download_url)
            time.sleep(30)  # Wait for download to start

if __name__ == "__main__":
    download_exodus()
EOF

# Get the Python script's PID
PYTHON_PID=$!

# Wait for the .deb file to appear and reach proper size
while true; do
    # Find the newest .deb file
    DEB_FILE=$(ls -t exodus-linux-x64-*.deb 2>/dev/null | head -n1)
    
    if [ ! -z "$DEB_FILE" ]; then
        # Check if file size is greater than 1MB (1048576 bytes)
        SIZE=$(stat -f%z "$DEB_FILE" 2>/dev/null || stat -c%s "$DEB_FILE" 2>/dev/null)
        if [ ! -z "$SIZE" ] && [ $SIZE -gt 1048576 ]; then
            echo "Download completed: $DEB_FILE"
            # Kill Firefox and Python processes
            pkill -f firefox
            kill $PYTHON_PID
            exit 0
        fi
    fi
    
    sleep 1
done
