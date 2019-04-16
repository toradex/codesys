FROM arm32v7/ubuntu:18.04

# run with
# docker run --name codesys --network host -it --privileged matheuscastello/codesys

# cross
COPY qemu-arm-static /usr/bin

# install deps
RUN apt-get -y update && apt-get install -y  --no-install-recommends \
	net-tools \
	&& apt-mark hold dash && apt-get -y upgrade && apt-mark unhold dash \
	&& apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

# copy runtime
COPY Configuration/ /runtime/Configuration/
COPY Platforms /runtime/Platforms/

WORKDIR /runtime/Platforms/Linux/Bin/
RUN chmod +x codesyscontrol && \
	chmod +x entrypoint.sh

# run
CMD ["./entrypoint.sh"]
