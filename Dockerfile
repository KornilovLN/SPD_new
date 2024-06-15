# Используем официальный образ Ubuntu
FROM ubuntu:latest

# Устанавливаем необходимые пакеты
RUN apt-get update && \
    apt-get install -y curl gnupg2 && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y bash && \
    apt-get clean

# Устанавливаем http-server глобально
RUN npm install -g http-server

# Устанавливаем рабочий каталог внутри контейнера
WORKDIR /usr/src/app

# Копируем содержимое текущего каталога в контейнер
COPY . .

# Указываем команду для запуска сайта
CMD ["http-server", "-c-1", "."]

# Открываем порт 8080
EXPOSE 8080
