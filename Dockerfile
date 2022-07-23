FROM devkitpro/devkitarm:latest
RUN apt update && apt install -y bubblewrap build-essential binutils-arm-none-eabi libpng-dev
RUN apt-get clean autoclean && apt-get autoremove --yes && rm -rf /var/lib/{apt,dpkg,cache,log}/
RUN mkdir -p /data
COPY make.sh /
RUN chmod +x make.sh
CMD bwrap --unshare-all --share-net --ro-bind / / --dev-bind /data /data ./make.sh 
