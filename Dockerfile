FROM localhost:6000/ml-engine:latest
MAINTAINER "haewan26@gmail.com"

# Run the following commands as super user (root):
USER root
#RUN apt-get update -y
#RUN apt-get install -y python3-pip build-essential python-dev python-setuptools

# Create a user that does not have root privileges
#ARG username=ml
#RUN useradd --create-home --home-dir /home/${username} ${username} 

ENV HOME /root
RUN rm -rf /root/logs && rm -rf /root/apps
RUN mkdir -p /root/logs && mkdir -p /root/apps

# Deploy Applicaiton
COPY . /root/

# Our working directory will be in our home directory where we have permissions
WORKDIR /root

#python lib install 
#RUN pip3 install -r /home/${username}/apps/requirements.txt

#EXPOSE 5000

#Python RUN
#ENTRYPOINT ["python3"]
#CMD ["main.py"]
