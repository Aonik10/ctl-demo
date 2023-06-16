FROM node:lts-buster-slim as nodebuild

RUN mkdir /front

WORKDIR /front

COPY front-end/ctl-demo-front .

RUN npm ci

RUN npm run build

FROM python:3-slim-buster

RUN mkdir /app

WORKDIR /app

COPY backend/requirements.txt .

RUN pip install -r requirements.txt

COPY backend .

COPY --from=nodebuild /front/dist ./static

CMD ["uvicorn", "sql_app.main:app", "--host=0.0.0.0", "--port=80"]