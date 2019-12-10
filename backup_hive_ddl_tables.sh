#!/bin/bash
rm -f tableNames.txt
rm -f dbNames.txt
rm -f ./hive/HiveTablesDDL.hql
rm -rf ./hive

mkdir hive
hive -e "show databases;" > dbNames.txt  

while read db
do
	echo -e "$db"
	db_output="$db.db"
	mkdir ./hive/$db_output

	hive -e "SHOW TABLES IN $db;" > tableNames.txt  
	wait
	while read table
	do
		echo "$db.$table"
	   	create_table=$(hive -e "SHOW CREATE TABLE $db.$table ;")
		echo $create_table > ./hive/$db_output/$table.hql
		echo $create_table >> ./hive/HiveTablesDDL.hql
		echo ";" >> ./hive/HiveTablesDDL.hql
	done < tableNames.txt
done < dbNames.txt

rm -f tableNames.txt
rm -f dbNames.txt