FROM python3.6
USER root

RUN apt-get update
RUN apt-get -y install locals && localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP .UTF-8
ENV TZ JST-9
ENV TEAM xterm

COPY requirement.txt /root/
HEALTHCHECK --interval=40s --timeout=240s CMD curl -sf http://localhost/ || exit 1

RUN apt-get install -y vim less
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools

RUN pip install -r /root/requirementd.txt
