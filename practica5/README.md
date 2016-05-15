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























