#!/bin/bash

read -p "Введите путь к каталогу: " DIR

if [ ! -d "$DIR" ]; then
    echo "Ошибка: указанный каталог не существует."
    exit 1
fi

read -p "Введите возраст файлов в днях: " DAYS

if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: возраст должен быть числом."
    exit 1
fi

FILES=$(find "$DIR" -type f -mtime +"$DAYS")

if [ -z "$FILES" ]; then
    echo "Файлы старше $DAYS дней не найдены."
    exit 0
fi

echo "Найдены следующие файлы:"
echo "$FILES"
echo

read -p "Удалить эти файлы? (да/нет): " CONFIRM

if [[ "$CONFIRM" == "да" ]]; then
    
    find "$DIR" -type f -mtime +"$DAYS" -delete
    echo "Файлы удалены."
else
    echo "Удаление отменено."
fi
