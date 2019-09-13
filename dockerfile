FROM jupyter/scipy-notebook
ARG TEST_ONLY_BUILD

ENV LC_ALL=zh_TW.utf8
ENV LANG=zh_TW.utf8
ENV LANGUAGE=zh_TW.utf8

USER root

RUN apt-get update && \
apt-get install -y --no-install-recommends \
language-pack-zh-han* \
python-pip \
gcc curl \
sqlite3

#安裝 ta-lib
RUN wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz && \
tar xvfz ta-lib-0.4.0-src.tar.gz && \
rm -rf ta-lib-*.tar.gz && \
cd ta-lib && \
./configure --prefix=/usr &&\
make && \
make install && \
pip install TA-Lib && \
cd ../ \
rm -rf ~/ta-lib*

#pip install package
COPY requirements.txt .
RUN sudo pip install --upgrade pip && \
pip install -r requirements.txt

# 安裝 Finlab2
COPY setup-ubuntu.sh .
RUN sh setup-ubuntu.sh

#conda install package
COPY conda.sh .
# RUN conda install --quiet --yes --file conda.txt
RUN sh conda.sh

# 字型設定
COPY ./ttf/* /opt/conda/lib/python3.6/site-packages/matplotlib/mpl-data/fonts/ttf/
COPY ./matplotlibrc /opt/conda/lib/python3.6/site-packages/matplotlib/mpl-data/matplotlibrc
RUN rm -rf /root/.cache/matplotlib/* \
rm -rf /home/jovyan/.cache/matplotlib/fontList.json

# CHECK
RUN curl -L "https://drive.google.com/uc?export=download&id=1GQzRpMN_RR1v9kXWOXn5BXMHKfyk0ET4" > check.py

USER $NB_UID
# 產生設定檔
RUN jupyter notebook --generate-config -y
