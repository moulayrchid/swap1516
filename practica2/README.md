
## Práctica 2. Clonar la información de un sitio web

# 1 Objetivos de la práctica
Los objetivos concretos de esta segunda práctica son:
**aprender a copiar archivos mediante ssh**
**clonar contenido entre máquinas**
**configurar el ssh para acceder a máquinas remotas sin contraseña**
**establecer tareas en cron**

# 2 Crear un tar con ficheros locales en un equipo remoto

# Estructura de  maquinas:
numero de la maquina|Nombre de la maquina | Dirección IP
-----------|------------ | -------------
Maquina1 | Ubuntuserver | 172.16.76.128
Maquina2 | Ubuntuserver2 | 172.16.76.130

`tar czf - directorio | ssh equipodestino 'cat > ~/tar.tgz'

![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica2/pract1-imagen1.png)
![imagen2](https://github.com/moulayrchid/swap1516/blob/master/practica2/rseult.png)

# 3 Instalar la herramienta rsync

 rsync ya venia instalado en la distribución pero si tuviera que instalarlo solo tendria que ejecutar el comando:
`sudo apt-get install rsync`

# Para clonar la carpeta /var/www/ de la maquina 1 en la maquina 2 ejecuto el comando:

rsync -avz -e ssh root@172.16.76.128:/var/www/ /var/www/

**pero antes de eso muestro imagen de contenido de maquina 1 y maquina 2 antes de ejecutar comando y despues muestro resultado de maquina 2**

![imagen3](https://github.com/moulayrchid/swap1516/blob/master/practica2/maquina1.html.png)
![imagen4](https://github.com/moulayrchid/swap1516/blob/master/practica2/maquina2.html.png)
![imagen4](https://github.com/moulayrchid/swap1516/blob/master/practica2/ejecucion-comando.png)












