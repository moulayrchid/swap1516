
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















