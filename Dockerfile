
FROM node:8
ENV APP_NAME minesweeper
ENV APP_DIR /$APP_NAME
RUN npm i -g yarn
RUN chmod a+rwx  /usr/local/lib/node_modules/yarn/bin/yarn*
RUN chmod a+rwx  /usr/local/bin/yarn
RUN yarn global add @angular/cli
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
COPY ./package.json $APP_DIR
COPY ./yarn.lock $APP_DIR
RUN yarn install --production=false 
COPY . $APP_DIR
RUN ng set --global packageManager=yarn
EXPOSE 4200
CMD ng serve --host 0.0.0.0
