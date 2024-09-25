FROM node:7-onbuild

RUN mkdir /workdir/
WORKDIR /workdir/

COPY package.json .
COPY rollup.config.js .
COPY ./src ./src/

RUN npm install
RUN npm run bundle



FROM maven:3.8-openjdk-8 AS build

COPY --from=node_modules /workdir .

COPY ./.git ./.git/
COPY pom.xml .
COPY ./local-repo ./local-repo/
COPY checkstyle-codedefenders.xml .

RUN mvn test # or something else or call mvn test in the jenkins step
