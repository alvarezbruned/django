# My Site
# Version: 1.0
FROM python:3.4
# Install Python and Package Libraries
RUN apt-get update && apt-get upgrade -y && apt-get autoremove && apt-get autoclean
RUN pip install --upgrade pip
RUN apt-get install -y \
    libffi-dev \
    libssl-dev \
    default-libmysqlclient-dev \
    #libmysqlclient-dev \
    libxml2-dev \
    libxslt-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zlib1g-dev \
    net-tools \
    vim
# Project Files and Settings
ARG PROJECT=myproject

RUN echo "Django==1.5.2" >> /root/requirements.txt
RUN echo "gunicorn==19.6.0" >> /root/requirements.txt

RUN pip3 install psycopg2
RUN pip install -r /root/requirements.txt
RUN pip3 install psycopg2-binary
RUN django-admin.py startproject ${PROJECT}
WORKDIR /${PROJECT}
COPY entry.sh /root
RUN chmod +x /root/entry.sh
# Server
 EXPOSE 8000
 STOPSIGNAL SIGINT
ENTRYPOINT ["/root/entry.sh"]
