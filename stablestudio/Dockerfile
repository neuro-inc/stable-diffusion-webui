ARG GIT_TAG=${GIT_TAG:-main}

FROM node:18-alpine AS app

ARG GIT_TAG
RUN apk add --no-cache bash coreutils git
WORKDIR /app

RUN git clone --depth 1 --branch ${GIT_TAG} https://github.com/Stability-AI/StableStudio.git .

RUN yarn config set enableTelemetry 0

RUN yarn

EXPOSE 3000

CMD ["yarn",  "dev:use-webui-plugin", "--host", "0.0.0.0"]