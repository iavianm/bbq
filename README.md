# README
**Гоу на шашлыки!**

Учебное приложение — организатор событий на rails 6.14 и Ruby 3.0.2

Предназначено для освоения работы с загрузкой файлов, аутентификацией, авторизацией, 
гемами devise, carrierwave, фреймворком bootstrap, очередями worker resque, redis, MAILJET.

Учит также основам работы с локализацией и YML файлами.

При желании может быть взято за основу для полезного и серьезного проекта.

**Демо**

https://bbqiavianm.ru/

**Copyright**

«Хороший программист» 2021 - 2022 
http://goodprogrammer.ru


**Установка**

1. Скопировать проект;
2. Установить и настроить базу данных (в проекте по умолчанию используется PostgreSQL);
3. Установить Redis, NodeJS, Yarn;

**Настройка**

1. Установка зависимостей командой: 
`bundle install`
2. Выполните команды:
`rails db:create db:migrate`
3. Создать в корне вашего проекта файл .env
И пропишите переменные окружения в .env файле:
`YANDEX_MAP_API_KEY="Ваш апи ключ"
MAILJET_API_KEY="Ваш апи ключ"
MAILJET_SECRET_KEY="Ваш апи ключ"
MAILJET_SENDER="Ваша почта отправки"
ACTION_MAILER_HOST="Ваш домен"
FACEBOOK_APP_ID="Ваш апи id"
FACEBOOK_SECRET_ID="Ваш апи ключ"
VK_APP_ID="Ваш апи id"
VK_SECRET_ID="Ваш апи ключ"`

