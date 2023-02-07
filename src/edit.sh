#!/bin/bash
echo "Введите путь до файла, который хотите изменить"
read file_for_edit
echo "Введите строку из файла, которую хотите заменить(В виде текста)"
read string_for_replace
echo "Введите строку, на которую хотите изменить(В виде текста)"
read string_input

sed -i "" s/$string_for_replace/$string_input/g $file_for_edit

buf=($(shasum -a 256 $file_for_edit))

echo "$file_for_edit - $(stat -f%z $file_for_edit) - $(date -r $file_for_edit +"%Y-%m-%d %H:%M") - $buf - sha256" >> files.log
