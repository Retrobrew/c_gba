FROM devkitpro/devkitarm:latest
RUN mkdir -p /data
COPY make.sh /
RUN chmod +x make.sh
CMD ./make.sh 