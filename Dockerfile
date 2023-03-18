FROM --platform=i386 i386/debian:bullseye
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y build-essential make
WORKDIR /src
COPY . /src/
RUN make ARCH="-m32" && cp -vf /src/build/bin-i386/studiomdl /usr/local/bin
WORKDIR /data
ENTRYPOINT [ "/usr/local/bin/studiomdl" ]