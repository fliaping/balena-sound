FROM balenalib/raspberrypi3-debian:buster

WORKDIR /usr/src

RUN install_packages \
    sox \
    python3

COPY sub_command/* /usr/src/
COPY start.sh /usr/src/
RUN chmod +x /usr/src/start.sh

ENTRYPOINT [ "/bin/bash" ]
CMD [ "/usr/src/start.sh" ]