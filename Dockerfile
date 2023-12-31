FROM mono:latest
RUN apt-get update && apt-get install unzip
WORKDIR /opt/terraria

RUN curl -O https://terraria.org/api/download/pc-dedicated-server/terraria-server-1449.zip
RUN unzip terraria-server-1449.zip
RUN rm terraria-server-1449.zip

WORKDIR 1449/Linux
RUN rm System*.dll* Mono*.dll* monoconfig mscorlib.dll
ENTRYPOINT ["mono", "--server", "--gc=sgen", "-O=all", "TerrariaServer.exe"]
