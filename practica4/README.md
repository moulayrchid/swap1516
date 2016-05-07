
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

En la Maquina 1 y la 2 la balanceadora hemos creado el fichero prueba.php

<?php
$tiempo_inicio = microtime(true);
for ($i=0; $i<3000000; $i++){
 $a = $i * $i;
 $b = $a - $i;
 $c = $a / $b;
 $d = 1 / $c;
}
$tiempo_fin = microtime(true);
echo "Tiempo empleado: " . round($tiempo_fin - $tiempo_inicio, 4) ;
?>

![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica3/nueva)


Tambien para automatizar un poco las pruebas creamos un script bash para hacer una bateria de 30 pruebas y que los guarde en 3 archivos pruebaAbM1.txt pruebaAbBalanceadorNginx.txt pruebaAbBalanceadorHaproxy.txt

