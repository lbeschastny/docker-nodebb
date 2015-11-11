FROM node:0.10

# Install deps
RUN apt-get install -y imagemagick git

# Install nodebb
RUN cd /opt && git clone -b v0.8.x https://github.com/NodeBB/NodeBB nodebb
RUN cd /opt/nodebb \
  && npm install mmmagic lwip \
  && npm install redis@~0.10.1 connect-redis@~2.0.0 \
  && npm install --production
RUN mkdir -p /opt/nodebb/uploads

# Create a mountable volume
VOLUME /opt/nodebb

# Define working directory.
WORKDIR /opt/nodebb

# Expose ports
EXPOSE 80
EXPOSE 443
EXPOSE 4567

# Define default command.
CMD [ "node", "app.js" ]
