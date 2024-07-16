FROM python:3.11.2-slim
LABEL maintainer="Enteroa <enteroa@kakao.com>"
ENV GECKO="geckodriver-v0.34.0-linux-aarch64.tar.gz"
ARG NaverID
ARG NaverPW
RUN apt update && apt install -y wget git firefox-esr && \
    cd /usr/local/bin && wget https://github.com/mozilla/geckodriver/releases/download/v0.34.0/$GECKO && \
    rm -f $GECKO && chmod +x geckodriver && \
    pip install --upgrade pip beautifulsoup4 bs4 certifi charset-normalizer idna selenium requests soupsieve urllib3 && \
    cd /opt && git clone https://github.com/CjHayato/ncc.git && cd /opt/ncc && \
    pip cache purge && apt clean all

WORKDIR /opt/ncc
ENTRYPOINT ["/bin/sh", "-c" , "python3 /opt/ncc/run_firefox.py"]
