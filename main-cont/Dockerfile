FROM python:3-slim
# Установка рабочей директории внутри контейнера
WORKDIR /app
# Копирование библиотеки из предыдущего образа в новый контейнер
RUN useradd -ms /bin/bash appuser
RUN chown appuser -R /app/
USER appuser
ADD ../main.py /app
RUN pip3 install python-dotenv
CMD [ "python3", "./main.py" ]






