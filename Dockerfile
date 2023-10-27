FROM mono:latest
WORKDIR /opt/terraria

RUN curl -O https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip
RUN unzip terraria-server-1449.zip
RUN rm terraria-server-1449.zip

WORKDIR 1449/Linux
ENTRYPOINT ["mono", "--server", "--gc=sgen", "-O=all", "TerrariaServer.exe"]
