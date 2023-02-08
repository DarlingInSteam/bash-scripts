echo "Введите путь до файла(лога)"
read path_to_log

file_name=("")
filtered_names=("")
current_sh=""

count_sh=0
count_lines=0

while IFS= read -r p; do
    IFC='-' read -a strarr <<< $p 
	((count_lines+=1))

    file_name+=(${strarr[0]})

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
echo ${file_name[@]}
#filtered_names=$($file_name | uniq)
filtered_names=($(for name in ${file_name[@]}; do
    echo $name
done | uniq))
count_names=${#filtered_names[@]}

echo "Количество уникальных файлов"
echo $count_names
echo "Количество изменений хэшей"
echo $count_sh