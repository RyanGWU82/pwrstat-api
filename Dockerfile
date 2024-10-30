FROM python:3-bullseye
MAINTAINER Daniel Winks

VOLUME /src
RUN curl -O https://dl4jz3rbrsfum.cloudfront.net/software/PPL_64bit_v1.4.1.deb && \
    dpkg -i PPL_64bit_v1.4.1.deb && \
    rm -f PPL_64bit_v1.4.1.deb
COPY pwrstat-api.py requirements.txt PPL-*-64bit.deb init.sh /src/
WORKDIR /src
RUN chmod +x /src/init.sh
RUN chmod +x /src/pwrstat-api.py
RUN pip install --trusted-host pypi.python.org -r requirements.txt
ENTRYPOINT "/src/init.sh"
