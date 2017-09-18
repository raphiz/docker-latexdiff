FROM alpine:3.6

ARG UID=1000
ARG GID=1000
ARG MOUNTDIR=/latexdiff

RUN apk add --no-cache perl perl-algorithm-diff git
RUN git clone https://github.com/ftilmann/latexdiff.git /opt/latexdiff
RUN cd /opt/latexdiff && git checkout 1.2.1

VOLUME [ "${MOUNTDIR}" ]
WORKDIR ${MOUNTDIR}

RUN addgroup -g ${GID} latexdiff
RUN adduser -D -h /home/latexdiff -u ${UID} -G latexdiff latexdiff
USER latexdiff

ENTRYPOINT [ "/opt/latexdiff/latexdiff" ]


