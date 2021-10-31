FROM ubuntu:20.04
FROM python:3.8
MAINTAINER anil "aeon.com"

RUN apt-get clean && apt-get update  
RUN apt-get install -y python3-pip
RUN apt-get install -y tesseract-ocr
RUN apt-get install -y libgl1-mesa-dev
WORKDIR /app
COPY ./app/requirements.txt  requirements.txt

RUN pip3 install -r requirements.txt

COPY . /app
EXPOSE 8000
ENTRYPOINT [ "python","app/app.py" ]

CMD [ "app.py","run","--host","0.0.0.0" ]
