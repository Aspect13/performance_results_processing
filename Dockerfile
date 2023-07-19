FROM r-base:4.3.1
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update
# RUN apt-get install -y --no-install-recommends git libcurl4-openssl-dev libssl-dev libxml2-dev build-essential libpq-dev python3 python3-pip python3-setuptools python3-dev
RUN apt-get install -y --no-install-recommends git libcurl4-openssl-dev libssl-dev libxml2-dev build-essential libpq-dev
WORKDIR /app

ADD requirements.r .
# installing r libraries
RUN Rscript requirements.r

COPY results_processor.R .




#ENV PYTHONPATH "${PYTHONPATH}:/app"


#FROM python:3.11-alpine
#RUN apk update
#RUN apk upgrade
#ENV PYTHONUNBUFFERED=1
#WORKDIR /app
#ADD requirements.txt .
#RUN python -m pip install --upgrade pip
#
## installing python libraries
## RUN pip3 install --break-system-packages -r requirements.txt
#RUN pip install -r requirements.txt
#
#COPY results_collector.py .
#COPY reporter.py .
#COPY data_manager.py .

COPY start.sh /


ENTRYPOINT ["/start.sh"]