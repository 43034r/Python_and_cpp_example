# Stage 1: Сборка библиотеки
FROM gcc:latest as builder
# Установка рабочей директории внутри контейнера
WORKDIR /app
# Копирование исходных файлов в контейнер
COPY . .
# Сборка библиотеки
RUN g++ fibonacci.cpp 
# Stage 2: Создание контейнера для размещения библиотеки
FROM python:3-slim
# Установка рабочей директории внутри контейнера
WORKDIR /app
# Копирование библиотеки из предыдущего образа в новый контейнер
COPY --from=builder /app/fibonacci.cpp /app/fibonacci.cpp
RUN useradd -ms /bin/bash appuser
USER appuser
ADD main.py /app
RUN pip3 install python-dotenv
CMD [ "python3", "./app/main.py" ]






