FROM ubuntu:latest
MAINTAINER your_name "haewan26@gmail.com"

# Run the following commands as super user (root):
USER root
RUN apt-get update -y
RUN apt-get install -y python3-pip build-essential python-dev python-setuptools

# Create a user that does not have root privileges
ARG username=ml

RUN useradd --create-home --home-dir /home/${username} ${username} 

ENV HOME /home/${username}
RUN rm -rf /home/${username}/logs && rm -rf /home/${username}/apps
RUN mkdir -p /home/${username}/logs && mkdir -p /home/${username}/apps

# Switch to our newly created user
USER ${username}

# Deploy Applicaiton
COPY .*  /home/${username}/apps/*

# Our working directory will be in our home directory where we have permissions
WORKDIR /home/${username}

#python lib install 
RUN pip3 install -r /home/${username}/apps/requirements.txt

#Python RUN
ENTRYPOINT ["python"]
CMD ["main.py"]
