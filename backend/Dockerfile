FROM python:3-slim-buster

RUN mkdir /app

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ["uvicorn", "sql_app.main:app", "--host=0.0.0.0", "--port=80"]