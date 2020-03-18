FROM node:10.17

COPY . /app/
WORKDIR /app

RUN npm install --registry=http://registry.npm.taobao.org

ENTRYPOINT npm run preview
