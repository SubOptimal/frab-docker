FROM debian:stretch

RUN apt-get update && \
	apt-get install --no-install-recommends --yes sqlite3 nodejs imagemagick ruby rails && \
	apt-get clean && \
	adduser --disabled-password --gecos "" frab

ADD frab-home.tar.xz /home/frab/

EXPOSE 3000
