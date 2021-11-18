from ubuntu as build

RUN apt-get update
RUN apt-get install build-essential -y

COPY snapraid/. /src/snapraid/.
WORKDIR /src/snapraid
RUN ./configure
RUN make
RUN make check
RUN make install

from ubuntu as final
COPY --from=build /usr/local/bin/snapraid /usr/local/bin/snapraid
ENTRYPOINT ["snapraid"]