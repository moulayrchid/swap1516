#!/bin/bash
# sustituir XXXXXXX por el pasword de mysql

EXPECTED_ARGS=3
E_BADARGS=65
MYSQL=`which mysql`
 
Q1="CREATE DATABASE IF NOT EXISTS $1;"
Q2="GRANT ALL ON *.* TO '$2'@'localhost' IDENTIFIED BY '$3';"
Q3="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}"
 
if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: $0 dbname dbuser dbpass"
  exit $E_BADARGS
fi
# creamos la base de datos en la maquina actual
$MYSQL -uroot -p1911 -e "$SQL"
#conectamos con la maquina 1 y bloqueamos  las tablas
ssh root@172.16.76.128 'mysql -uroot -p1911 -e "FLUSH TABLES WITH READ LOCK;" '
# hacemos la copia de seguridad 
ssh root@172.16.76.128 'mysqldump contactos -u root -p1911 > /root/contactos.sql'
# desbloqueamos las tablas
ssh root@172.16.76.128 'mysql -uroot -p1911 -e "UNLOCK TABLES;"'
#copiamos la bd en la maquina2
scp root@172.16.76.128:/root/contactos.sql /root/
#abrimos bd local y restauramos los datos contenidos en contactos.sql
mysql -uroot -p1911 contactos < /root/contactos.sql
