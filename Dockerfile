from ubuntu as build

RUN apt-get update
RUN apt-get install build-essential autoconf automake -y

COPY snapraid/. /src/snapraid/.
WORKDIR /src/snapraid
RUN chmod 777 ./configure
RUN ./configure
RUN make
RUN make check
RUN make install

from ubuntu as final
COPY --from=build /usr/local/bin/snapraid /usr/local/bin/snapraid
ENTRYPOINT ["snapraid"]