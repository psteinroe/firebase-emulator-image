FROM node:lts-alpine

COPY firebase.json ./firebase.json

RUN yarn global add firebase-tools@9.16.0 && firebase emulators:exec 'echo download' --project 'test-project' && firebase -V

# UI
EXPOSE 4000

# Auth
EXPOSE 9099

ENV projectId projectId

CMD ["sh", "-c", "firebase emulators:start --project test-project"]
