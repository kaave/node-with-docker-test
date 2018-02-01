# FROM node:8.9.4
FROM node:8.9.4-alpine

RUN adduser -S app \
    && addgroup app \
    && echo "app ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo 'app:app' | chpasswd
# RUN useradd --user-group --create-home --shell /bin/false app

ENV HOME=/home/app

COPY package.json yarn.lock $HOME/chat/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/chat

RUN yarn

CMD ["yarn", "start"]
