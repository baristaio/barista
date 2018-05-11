### Docker builder
FROM alpine/git as base_clone
WORKDIR /opt
RUN git clone https://f892d5a601e944749f4f3d88482bb96a5d2f8b01@github.com/baristaio/espresso.git



FROM node:8-alpine as builder

MAINTAINER Vadim Ri <vadim@barista.io>

# Create app directory
WORKDIR /app
RUN chown -R node:node /app

USER node
COPY --from=base_clone /opt/espresso /opt
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package.json /app

RUN npm install --production

#RUN npm run build


# Bundle app source
COPY /dist /app
EXPOSE 3000
CMD [ "node", "index.js" ]


