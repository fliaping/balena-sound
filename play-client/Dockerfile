FROM balenalib/raspberrypi3-debian:buster

WORKDIR /usr/src

RUN install_packages \
    ffmpeg \
    alsa-utils --no-install-recommends

COPY sub_command/* /usr/src/
COPY start.sh /usr/src/
RUN chmod +x /usr/src/start.sh

CMD [ "/bin/bash", "/usr/src/start.sh" ]