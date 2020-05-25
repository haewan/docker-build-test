FROM centos:6.6

# Run the following commands as super user (root):
USER root

# Create a user that does not have root privileges 
ARG username=ml
RUN userdel builder && useradd --create-home --home-dir /home/${username} ${username}
ENV HOME /home/${username}
RUN rm -rf /home/${username}/logs && rm -rf /home/${username}/apps
RUN mkdir -p /home/${username}/logs && mkdir -p /home/${username}/apps

# Switch to our newly created user
USER ${username}

COPY ./*  /home/${username}/apps

# Our working directory will be in our home directory where we have permissions
WORKDIR /home/${username}
