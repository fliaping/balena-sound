FROM linuxserver/ffmpeg:latest

WORKDIR /usr/src

COPY sub_command/* /usr/src/
COPY start.sh /usr/src/
RUN chmod +x /usr/src/start.sh

CMD [ "/bin/bash", "/usr/src/start.sh" ]