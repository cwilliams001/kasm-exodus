FROM kasmweb/ubuntu-jammy-desktop:1.16.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME

######### Customize Container Here ###########

ARG EXODUS_PACKAGE

COPY ${EXODUS_PACKAGE} /home/kasm-default-profile

# Unzip the downloaded file and setup Exodus Wallet
RUN dpkg -i ${EXODUS_PACKAGE} \
    && cp /usr/share/applications/exodus.desktop $HOME/Desktop/ \
    && chmod +x $HOME/Desktop/exodus.desktop \
    && chown 1000:1000 $HOME/Desktop/exodus.desktop
RUN echo "/usr/bin/desktop_ready && /usr/bin/exodus" > $STARTUPDIR/custom_startup.sh \
    && chmod +x $STARTUPDIR/custom_startup.sh
# Clean up
RUN rm ${EXODUS_PACKAGE}

######### End Customizations ###########

RUN chown -R 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000
