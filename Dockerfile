# Stage 1: Сборка библиотеки
FROM gcc:latest as builder
# Установка рабочей директории внутри контейнера
WORKDIR /app
# Копирование исходных файлов в контейнер
COPY . .
# Сборка библиотеки
RUN g++ -Wall -shared fibonacci.cpp -o fibonacci
# Stage 2: Создание контейнера для размещения библиотеки
FROM python:3-slim
# Установка рабочей директории внутри контейнера
WORKDIR /app
# Копирование библиотеки из предыдущего образа в новый контейнер
COPY --from=builder /app/fibonacci /app/fibonacci
RUN useradd -ms /bin/bash appuser
RUN chmod 755 /app/fibonacci 
RUN chown appuser -R /app/
USER appuser
ADD main.py /app
RUN pip3 install python-dotenv
CMD [ "python3", "./main.py" ]






