
# Práctica 6. Discos en RAID

## 1. Objetivos de la práctica**

• Configurar dos discos en RAID 1. Los discos se añadirán a un sistema ya
instalado y funcionando, de forma que en total tendremos tres discos (el
sistema operativo estará ya instalado en /dev/sda y añadiremos dos discos
más, que serán el /dev/sdb y el /dev/sdc, para configurar el dispositivo de
almacenamiento RAID en estos dos discos nuevos de igual tamaño).  
• Hacer pruebas de retirar y añadir un disco “en caliente”, y comprobar que el
RAID sigue funcionando correctamente.  

## 1.1 Estructura de La Máquina1:

numero de la maquina|Nombre de la maquina | Dirección IP
-----------|------------ | -------------
Maquina1 | Ubuntuserver | 172.16.76.128

Con la maquina vvirtual apagada le agregamos 2 discos duros que nos serviran para crear una configuracion de RAID1:  

Apagamos la máquina y seguimos los pasos siguientes

lsb_release -a
UBUNTU 14.O4.4

**1 edit virtual maching settings**  
**2 ADD**  
**3 HARD DISK** **MÁS NEXT**  
**4 marcamos SCSI Y NEXT**  
**5 ceate a new virtual disk y next**  
**6 split virtual disk into multiple files y next**  
**7 nombre y finish**

![imagen1](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen1.png)

## 2. Configuración del RAID por sofware

Ahora arrancamos la máquina1 y entramos para instalar el software necesario para
configurar el RAID:

*sudo apt-get install mdadm* 

buscar información con el comando  

*sudo fdisk -l* 

![imagen2](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen2.png)

**los discos que hemos creado recientemente son: /dev/sdb /dev/sdc**  

 creamos el RAID1 (/dev/md0) con los 2 discos anteriores, para ello ejecutamos el comando:

*sudo mdadm -C /dev/md0 --level=raid1 --raid-devices=2 /dev/sdb /dev/sdc*  

![imagen3](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen3.png)

![imagen4](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen4.png)

Damos formato al nuevo dispositivo RAID con:  

**sudo mkfs /dev/md0**  

Ahora ya podemos crear el directorio en el que se montará la unidad del RAID:  
**sudo mkdir /dat**  
**sudo mount /dev/md0 /dat**  

Podemos comprobar que el proceso se ha realizado adecuadamente, y también los parámetros con los que Linux ha conseguido montarlo usando la orden:
**sudo mount**  

Para comprobar el estado del RAID, ejecutaremos:
**sudo mdadm --detail /dev/md0**  

![imagen5](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen5.png)

Para probar el automontaje y forzar un fallo en el array y ver que podemos seguir utilizando los datos, creamos un fichero MOULAYMOULAY en /dat

![imagen6](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen6.png)

Para finalizar el proceso, conviene configurar el sistema para que monte el dispositivo
RAID creado al arrancar el sistema. Para ello debemos editar el archivo /etc/fstab y
añadir la línea correspondiente para montar automáticamente dicho dispositivo.
Conviene utilizar el identificador único de cada dispositivo de almacenamiento en lugar
de simplemente el nombre del dispositivo (aunque ambas opciones son válidas). Para
obtener los UUID de todos los dispositivos de almacenamiento que tenemos, debemos
ejecutar la orden:

**ls -l /dev/disk/by-uuid/**  

![imagen7](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen7.png)

Una vez tengamos el UUID de la partición del array lo copiamos y lo añadimos en el fstab.

**UUID=f47ec60c-60a3-4d81-a3e1-271731f11bf1 /dat ext4 defaults 0 0**  

![imagen8](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen8.png)

![imagen9](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen9.png)

Así cada vez que arranquemos el sistema se montará el array automáticamente.

## Simulando un fallo en una unidad

 podemos simular un fallo en una unidad con mdadm.

**mdadm --manage --set-faulty /dev/md/ubuntu-Maquina1:0 /dev/sdc**  

![imagen10](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen10.png)

También podemos retirar “en caliente” el disco que está marcado como que ha fallado:

**sudo mdadm --manage --remove /dev/md/ubuntu-Maquina1:0 /dev/sdc**  

Y comprobamos que después de haber quitado dicho disco del array podemos seguir accediendo a /dat.

**ls -l /dat**


![imagen11](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen11.png)

Como vemos aún podemos acceder al fichero MOULAYMOULAY que habíamos creado.

Después de arreglar el disco roto, o sustituirlo, lo volvemos a añadir al array.

**sudo mdadm --manage --add /dev/md/ubuntu-Maquina1:0 /dev/sdc**  

Y comprobamos que todo sigue funcionando.

![imagen12](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen12.png)

![imagen13](https://github.com/moulayrchid/SWAP1516/blob/master/practica6/imagen13.png)










