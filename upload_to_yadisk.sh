#!/bin/bash


FILENAME="test.txt"

FILEPATH="C:/Users/prove/Desktop/lab-1/$FILENAME"

TOKEN='y0__xDJo5itBhjcgz4gp__KvRYw2PiB_geDtrRZh7T_D8wTRYZM-ZD6605o1g'

echo "Начинаю отправку файла: $FILENAME"


echo "Запрашиваю ссылку для загрузки..."
RESPONSE=$(curl -s -H "Authorization: OAuth $TOKEN" "https://cloud-api.yandex.net/v1/disk/resources/upload/?path=app:/$FILENAME&overwrite=true")


UPLOAD_URL=$(echo $RESPONSE | grep -o '"href":"[^"]*' | grep -o 'http[^"]*')


echo "Отправляю файл..."
curl -T "$FILEPATH" "$UPLOAD_URL"

echo ""
echo "Готово! Файл отправлен."