#!/bin/bash
# Author: MorningSong

Date=$(date -d $(date -d "-30 day" +%Y%m%d) +%s)
MySQL_User="your_mysql_user"
MySQL_Passwd="your_mysql_pass"
MySQL_Path="/usr/local/mysql/bin/mysql"
Zabbix_Tables=(history history_uint)

for table in ${Zabbix_Tables[@]}
do
    echo "zabbix.table: $table"
    MySQL_DataID=$($MySQL_Path -u$MySQL_User -p$MySQL_Passwd -e "select max(id),min(id) from zabbix.$table where clock < $Date;")
    MySQL_Table_MaxID=$(echo $MySQL_DataID | awk '{ print $3}')
    MySQL_Table_MinID=$(echo $MySQL_DataID | awk '{ print $4}')
    if  [[ "$MySQL_Table_MaxID" != "NULL" ]];then
        while :
        do
            i=$(($i+10000))
            echo "delete data: id <$i"
            if (( "$i" < "$MySQL_Table_MaxID" ));then
                Delete_MaxID="$i"
                $MySQL_Path -u$MySQL_User -p$MySQL_Passwd -e "Delete from zabbix.$table where id < $Delete_MaxID;"
            else
                Delete_MaxID="$MySQL_Table_MaxID"
                $MySQL_Path -u$MySQL_User -p$MySQL_Passwd -e "Delete from zabbix.$table where id < $Delete_MaxID;"
                break;
            fi
        done
        #"$MySQL_Path -u$MySQL_User -p$MySQL_Passwd -e \"optimize table $table;\""
    fi
done

