### Docker builder

FROM node:8-alpine

MAINTAINER Vadim Ri <vadim@barista.io>

# Create app directory
WORKDIR /app
RUN chown -R node:node /app

USER node

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


