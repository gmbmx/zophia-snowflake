FROM prefecthq/prefect:2.7.10-python3.10

COPY requirements.txt /opt/app/requirements.txt
COPY setup.py /opt/app/setup.py
ADD mypackage.egg-info /opt/app
ADD /src/my_package /opt/app
WORKDIR /opt/app

RUN apt update && \
    apt install -y vim && \
    pip install -r requirements.txt \
    pip install . 
