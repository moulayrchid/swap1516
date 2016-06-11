
# Práctica 2. Clonar la información de un sitio web

 1 Objetivos de la práctica  
 Los objetivos concretos de esta segunda práctica son:  
 aprender a copiar archivos mediante ssh**  
 clonar contenido entre máquinas**  
 configurar el ssh para acceder a máquinas remotas sin contraseña**  
 establecer tareas en cron**  

# 2 Crear un tar con ficheros locales en un equipo remoto

## Estructura de  maquinas:
Nombre de la maquina | Dirección IP
-----------| -------------
Maquina1 |172.16.76.128
Maquina2 |172.16.76.130

`tar czf - directorio | ssh equipodestino 'cat > ~/tar.tgz'

![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica2/pract1-imagen1.png)
![imagen2](https://github.com/moulayrchid/swap1516/blob/master/practica2/rseult.png)

# 3 Instalar la herramienta rsync

 rsync ya venia instalado en la distribución pero si tuviera que instalarlo solo tendria que ejecutar el comando:
`sudo apt-get install rsync`

## Para clonar la carpeta /var/www/ de la maquina 1 en la maquina 2 ejecuto el comando:

rsync -avz -e ssh root@172.16.76.128:/var/www/ /var/www/

**pero antes de eso muestro imagen de contenido de máquina 1 y máquina 2 antes de ejecutar comando y despues muestro resultado de máquina 2**

![imagen3](https://github.com/moulayrchid/swap1516/blob/master/practica2/maquina1.html.png)
![imagen4](https://github.com/moulayrchid/swap1516/blob/master/practica2/maquina2.html.png)
![imagen4](https://github.com/moulayrchid/swap1516/blob/master/practica2/ejecucion-comando.png)


# 4 Acceso sin contraseña para ssh

Lo primero es generar la clave del tipo dsa en la máquina 2 con ssh-keygen, Después comprobamos si la clave generada tiene los permisos de forma correcta, en mi caso no hace falta cambiarlos, Una forma segura de copiar la clave en la máquina 1 es usando el comando:

shh-copy-id -i .ssh/_dsa.pub root@172.16.76.128

![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica2/ssh1)

Para comprobar si todo ha ido bien solicito entrar a la maquina 1 via ssh sin proporcionar clave:

![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica2/ssh2)

Como se puede apreciar en la foto he tenido acceso a la máquina1 desde la máquina2 y no se me ha solicitado ninguna clave

#  5. Programar tareas con crontab

Para realiza una copia de seguridada de la carpeta /var/www/ de la máquina 1 en la máquina 2 hay que editar el archivo /etc/contab añadiendo la linea :

*/1 * * * * root rsync -avz -e ssh root@172.16.76.128:/var/www/ /var/www/

![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica2/editarcrontab.png)

también podemos  crear un script(backup.sh) como :

#! /bin/bash

rsync -avz -e ssh root@172.16.76.128:/var/www/ /var/www/

Darle permisos de ejecucion chmod +x backup.sh

Editar el crontab como sigue:

00-59 * * * * root cd / && ./backup.sh















