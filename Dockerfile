# Используем официальный образ Python 3.11
FROM python:3.11-slim

# Отключаем буферизацию вывода Python
ENV PYTHONUNBUFFERED=1

# Устанавливаем рабочую директорию
WORKDIR /code

# Копируем файл зависимостей
COPY requirements.txt /code/

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем исходный код приложения
COPY . /code/

VOLUME ["/code/db"]

# Указываем порт, который будет использовать приложение
EXPOSE 8000

# Команда для запуска приложения
CMD ["sh", "-c", "sh init.sh && python3 manage.py runserver 0.0.0.0:8000"]