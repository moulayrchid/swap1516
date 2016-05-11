
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

Ejecutamos el scriptAB.sh en la máquina local:[VER SCRIPT](https://github.com/moulayrchid/swap1516/blob/master/practica4/scriptAB.sh)

![imagen2](https://github.com/moulayrchid/swap1516/blob/master/practica4/anfitriona.png)


Despues de obtener los archivos seleccionamos los datos que nos interesan creando un script.(ver carpeta de practica 4)

**De toda la información que nos ofrece esta herramienta proponemos recoger al menos las métricas **“Time taken for tests”**,**“Filed requests”** y **“Requests per second”**

**pasamos los datos a una hoja de calculo y hacemos unas comparaciones entre las 3 configuraciones de la granja web ademas tomando como referencia la media y la desviscion tipoca:**

 VER  [hoja de calculo](https://github.com/moulayrchid/swap1516/blob/master/practica4/Moulay-calculo.ods)

![imagen3](https://github.com/moulayrchid/swap1516/blob/master/practica4/IMAGEN3.png)

![imagen4](https://github.com/moulayrchid/swap1516/blob/master/practica4/IMAGEN4.png)

En las gráficas vemos que tiempo de cada test más rapido es de la maquina 1 y despues maquina 2 y el siguinte haproxy y el ultimo es Nginx  

pero para peticiónes por segundo vemos que la máquina más rapida es Nginx despues Haproxy despues Máquina2 y ultima ea Máquina1  

para tiempo de test y peticiónes por segundo la mas rapida es la Máquina1


# 3. Comprobar el rendimiento con Siege

   Para la Máquina1 servidora se ha ejecutado siege -b -t60s http://172.16.76.128/prueba.php

![imagen5](https://github.com/moulayrchid/swap1516/blob/master/practica4/im_maquina1.png)

![imagen6](https://github.com/moulayrchid/swap1516/blob/master/practica4/maquina1-siguiente.png)

   Para la Máquina2 servidora se ha ejecutado siege -b -t60s http://172.16.76.130/prueba.php
	
![imagen7](https://github.com/moulayrchid/swap1516/blob/master/practica4/maq-2.png)

   Para la Máquina balanceadora haproxy a se ha ejecutado siege -b -t60s http://172.16.76.129/prueba.php

![imagen8](https://github.com/moulayrchid/swap1516/blob/master/practica4/im-bala-hapro.png)

   Para la Máquina balanceadora Nginx a se ha ejecutado siege -b -t60s http://172.16.76.129/prueba.php

![imagen9](https://github.com/moulayrchid/swap1516/blob/master/practica4/nginx.png)
















