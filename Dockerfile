FROM debian
MAINTAINER Luca Patera <lucapatera@outlook.it>

# create app dir
RUN mkdir /app
WORKDIR /app

# install dependencies
RUN apt-get update
RUN apt-get install -y software-properties-common build-essential apt-utils curl wget git
RUN apt-get install -y zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev libbz2-dev libcairo2-dev

# download python3
RUN wget https://www.python.org/ftp/python/3.10.6/Python-3.10.6.tgz
RUN tar -xf Python-3.10.6.tgz
RUN rm Python-3.10.6.tgz

# install python3
WORKDIR /app/Python-3.10.6
RUN ./configure --enable-optimizations
RUN make -j 4
RUN make altinstall

# validate python3 version
WORKDIR /app
RUN python3.10 --version
RUN pip3.10 --version

# install lottie
RUN pip3.10 install lottie
RUN pip3.10 install lottie[images]
RUN pip3.10 install lottie[PNG]
RUN pip3.10 install lottie[PDF]
RUN pip3.10 install lottie[GIF]
RUN pip3.10 install lottie[video]

# run binary as image
ENTRYPOINT ["lottie_convert.py"]