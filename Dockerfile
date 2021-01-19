FROM python:3.7

MAINTAINER hexanyn, hexanyn@gmail.com

WORKDIR /data

RUN apt update
RUN apt install -y xvfb x11vnc wget
RUN pip3 install pynput
RUN wget 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb'
RUN dpkg -i google-chrome-stable_current_amd64.deb || apt install -y --fix-broken
RUN	apt autoclean;\
	apt clean;\
	apt autoremove;\
	rm -f *.deb

COPY start.sh .
EXPOSE 5900

ENTRYPOINT ["./start.sh"]
