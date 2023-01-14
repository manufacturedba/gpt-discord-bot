FROM python:3 as base

WORKDIR /usr/src/app

ARG BRANCH=master

ENV OPENAI_API_KEY=
ENV DISCORD_BOT_TOKEN=
ENV DISCORD_CLIENT_ID=
ENV ALLOWED_SERVER_IDS=
ENV SERVER_TO_MODERATION_CHANNEL=

## Get GPT Discord Bot
RUN curl -sLf https://github.com/manufacturedba/gpt-discord-bot/archive/${BRANCH}.tar.gz | tar -xz --strip-components=1

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "-m", "src.main" ]