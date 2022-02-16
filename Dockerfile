FROM node:10

WORKDIR /usr/src/app

# Copy NodeCG (just the files we need)
RUN mkdir cfg && mkdir bundles && mkdir logs && mkdir db && mkdir assets
COPY . /usr/src/app/
RUN ls -la /usr/src/app/

# Install dependencies
RUN npm install --production

# Install Bundles
# Setting working directory for bundles
WORKDIR /usr/src/app/bundles
# Cloning Report to bundles Folder
RUN git clone https://github.com/EwanLyon/tutorial-bundle.git /usr/src/app/bundles/tutorial-bundle
# Changing Working Directory back to app
WORKDIR /usr/src/app

# The command to run
# EXPOSE 9090
CMD ["node", "index.js"]