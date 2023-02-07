echo "Введите путь до файла(лога)"
read path_to_log

current_file_name=""
current_sh=""
count_name=0
count_sh=0
count_lines=0

while IFS= read -r p; do
    IFC='-' read -a strarr <<< $p 
	((count_lines+=1))
    
    if (($count_name==0)); then 
    current_file_name=${strarr[0]}
    ((count_name+=1))
    elif [[ $current_file_name != ${strarr[0]} ]]; then
    current_file_name=${strarr[0]}
    ((count_name+=1))
    fi

    if [[ "NULL" == ${strarr[7]} ]]; then
    continue
    elif (($count_sh==0)); then
    current_sh=${strarr[7]}
    ((count_sh+=1))
    elif [[ $current_sh != ${strarr[7]} ]]; then
    current_sh=${strarr[7]}
    ((count_sh+=1))
    fi

done < $path_to_log

echo "Количество записей:"
echo $count_lines
echo "Количество уникальных файлов"
echo $count_name
echo "Количество изменений хэшей"
echo $count_sh