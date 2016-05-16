# Práctica 5. Replicación de bases de datos MySQL

##1. Objetivos de la práctica

Los objetivos concretos de esta práctica son:  
• Copiar archivos de copia de seguridad mediante ssh.  
• Clonar manualmente BD entre máquinas.  
• Configurar la estructura maestro-esclavo entre dos máquinas para realizar el
clonado automático de la información.

## 2 Estructura de  maquinas:

Nombre de la maquina | Dirección IP
-----------| -------------
Maquina1 |172.16.76.128
Maquina2 |172.16.76.130
Mquina3-Balanceador |172.16.76.129

## 3. Crear una BD e insertar datos

 crearmos una BD en MySQL e insertamos algunos datos

![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen1.png)

![imagen2](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen2.png)


# 4. Replicar una BD MySQL con mysqldump
 tenemos que tener en cuenta que los datos pueden estar actualizándose constantemente en el servidor de BD principal. En este caso,
antes de hacer la copia de seguridad en el archivo .SQL debemos evitar que se acceda a la BD para cambiar nada.

mysql -u root –p  
mysql> FLUSH TABLES WITH READ LOCK;  
mysql> quit  

![imagen3](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen3.png)

Ahora ya sí podemos hacer el mysqldump para guardar los datos. En el servidor principal (maquina1) hacemos:  

mysqldump ejemplodb -u root -p > /root/ejemplodb.sql

Como habíamos bloqueado las tablas, debemos desbloquearlas (quitar el “LOCK”):  

mysql -u root –p  
mysql> UNLOCK TABLES;  
mysql> quit  

![imagen4](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen4.png)

Ya podemos ir a la máquina esclavo (maquina2, secundaria) para copiar el archivo
.SQL con todos los datos salvados desde la máquina principal (maquina1):  
sudo su
scp root@176.16.76.128:/root/contactosdb.sql /root/

![imagen5](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen5.png)

Con el archivo de copia de seguridad en el esclavo ya podemos importar la BD completa en el MySQL. Para ello, en un primer paso creamos la BD:  

mysql -u root –p  
mysql> CREATE DATABASE ‘ejemplodb’;  
mysql> quit  

![imagen6](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen6.png)

Ahora restauramos los datos contenidos en la BD (se crearán las tablas en el proceso):  

mysql -u root -p contactosdb < /root/contactosdb.sql

![imagen7](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen7.png)


# 5. Replicación de BD mediante una configuración maestro-esclavo

Maquina1 |172.16.76.128 | Maestra  
Maquina2 |172.16.76.130 | esclavo  

En la maquina1 configuramos el fichero  

cd /etc/mysql

sudo nano my.cnf

Se comenta la linea bind-address 127.0.0.1  
 la linea log_error=/var/log/mysql/error.log se deja igual  
 el identificador de servicio se deja con valor a 1 server-id=1  
Se reinicia el servicio mediante el comando /etc/init.d/mysql restart  

![imagen8-1](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen8-1.png)
![imagen8-2](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen8-2.png)
![imagen8-3](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen8-3.png)

En la maquina2 de replicación se realiza exactamente lo mismo con el fichero /etc/mysql/my.cnf cambiando de que server-id=2

![imagen9](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen9.png)

Reiniciamos el servicio en el esclavo:  
/etc/init.d/mysql restart  

![imagen10](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen10.png)


Podemos volver al maestro (Maquina1)para crear un usuario y darle permisos de acceso para la replicación.

Entramos en mysql y ejecutamos las siguientes sentencias:  
mysql -uroot -p  
mysql> CREATE USER esclavo IDENTIFIED BY 'esclavo';  
mysql> GRANT REPLICATION SLAVE ON *.* TO 'esclavo'@'%'  
IDENTIFIED BY 'esclavo';  
mysql> FLUSH PRIVILEGES;  
mysql> FLUSH TABLES;  
mysql> FLUSH TABLES WITH READ LOCK;  

![imagen11](https://github.com/moulayrchid/swap1516/blob/master/practica5/imagen11.png)















