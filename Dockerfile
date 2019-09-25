FROM arm32v7/ubuntu:18.04

# install deps
RUN apt-get -y update && apt-get install -y --no-install-recommends \
	net-tools \
	&& apt-mark hold dash && apt-get -y upgrade && apt-mark unhold dash \
	&& apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/*

# copy runtime and configuration
WORKDIR /runtime

COPY ["./codesys-runtime/*", "./entrypoint.sh", "CODESYSControl.cfg", "./"]
RUN mv codesyscontrol.encrypted codesyscontrol && \
	chmod +x codesyscontrol && \
	chmod +x entrypoint.sh

# expose the ports
EXPOSE 11740
EXPOSE 1217
EXPOSE 8080
EXPOSE 443
EXPOSE 4840

# run
CMD ["./entrypoint.sh"]