
# Práctica 4. Comprobar el rendimiento de servidores web

## 1 Estructura de  maquinas:
Nombre de la maquina | Dirección IP
-----------| -------------
Maquina1 |172.16.76.128
Maquina2 |172.16.76.130
Mquina3-Balanceador |172.16.76.129

## 2. Comprobar el rendimiento de servidores web con Apache Benchmark

Crea una página HTML sencilla (o un script PHP) y la colocamos la colocamos en el directorio
correspondiente al espacio web de los servidores finales (normalmente /var/www/ o
/var/www/html/)

En la Maquina 1 y la 2 y  la balanceadora hemos creado el fichero prueba.php


![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica4/prueba.php_maquina%20_balanceadora.png)


creamos un scriptbash.sh y guardamos los datos en estos ficheros: 
  pruebaAbMaquina1.txt  
  pruebaAbMaquina2.txt  
  pruebaAbBalanceadorNginx.txt  
  pruebaAbBalanceadorHaproxy.txt  

Ejecutamos el scriptbah.sh en la máquina local

![imagen2](https://github.com/moulayrchid/swap1516/blob/master/practica4/anfitriona.png)





















