FROM python:3.8-slim

WORKDIR /app


COPY . /app


RUN sudo apt-get update \
    && sudo apt-get upgrade \
    && sudo apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*


COPY requirements.txt /app


RUN pip install mysqlclient 

RUN pip install --no-cache-dir -r requirements.txt 

COPY . .

CMD ["python", "app.py"]

