FROM node:10

WORKDIR /usr/src/app

# Copy NodeCG (just the files we need)
RUN mkdir cfg && mkdir bundles && mkdir logs && mkdir db
COPY . /usr/src/app/

# Install dependencies
RUN npm install --production

# Install Bundles
# For Example let's install Ewan's Bundle.
RUN cd bundles
RUN git clone https://github.com/EwanLyon/tutorial-bundle.git

# The command to run
# EXPOSE 9090
CMD ["node", "index.js"]
