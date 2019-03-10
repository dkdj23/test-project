FROM node:10.15-alpine


RUN mkdir -p /root/app
COPY package.json /root/app
COPY yarn.lock /root/app
COPY ./pages /root/app/pages


WORKDIR /root/app
ENV NODE_ENV=production
RUN yarn && yarn build && rm -rf ./pages

CMD ["sh","-c","yarn start --port $PORT"]
