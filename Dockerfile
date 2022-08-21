FROM debian
MAINTAINER Luca Patera <lucapatera@outlook.it>

# create app dir
RUN mkdir /app
WORKDIR /app

# install dependencies
RUN apt-get update && apt-get install -y  \
    software-properties-common  \
    apt-utils  \
    zlib1g-dev  \
    libncurses5-dev  \
    libgdbm-dev  \
    libnss3-dev  \
    libssl-dev  \
    libsqlite3-dev  \
    libreadline-dev  \
    libffi-dev  \
    libbz2-dev  \
    libcairo2-dev \
    python3 \
    python3-pip

# install lottie
RUN pip3 install lottie lottie[all]

# run binary as image
ENTRYPOINT ["lottie_convert.py"]