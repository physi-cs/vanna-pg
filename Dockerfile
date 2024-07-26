FROM python:3.8

COPY . /app

WORKDIR /app

RUN pip3 install -r requirements.txt -i https://pypi.mirrors.ustc.edu.cn/simple/ && rm -rf `pip3 cache dir`

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list.d/debian.sources

RUN apt-get update && apt-get -y install vim

EXPOSE 5000

# CMD ["python","-u", "chat_db.py"]