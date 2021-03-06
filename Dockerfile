FROM node:10

WORKDIR /usr/src/app

# Copy NodeCG (just the files we need)
RUN mkdir cfg && mkdir bundles && mkdir logs && mkdir db && mkdir assets
COPY . /usr/src/app/
RUN ls -la /usr/src/app/

# Install dependencies
RUN npm install --production

# Install Bundles
# For Example let's install Ewan's Bundle.
WORKDIR /usr/src/app/bundles
RUN git clone https://github.com/EwanLyon/tutorial-bundle.git /usr/src/app/bundles/
RUN npm install

# The command to run
# EXPOSE 9090
CMD ["node", "index.js"]
