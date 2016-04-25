
# Práctica 3. Balanceo de carga

## 1. Objetivos de la práctica

En esta práctica configuraremos una red entre varias máquinas de forma que  
tengamos un balanceador que reparta la carga entre varios servidores finales.  
El problema a solucionar es la sobrecarga de los servidores. Se puede balancear  
cualquier protocolo, pero dado que esta asignatura se centra en las tecnologías web,  
balancearemos los servidores HTTP que tenemos configurados.  
De esta forma conseguiremos una infraestructura redundante y de alta disponibilidad  

## 2. Alternativas para realizar balanceo de carga

La forma más elemental de balancear la carga entre varios servidores es utilizando el
*DNS* (como se estudió en la teoría). Este tipo de balanceo tiene la ventaja de su
simplicidad y eficiencia. Lo único que se necesitan son varios servidores con distintas
*IP*, por lo que es barato, simple y fácil de mantener.

## 2.1 Estructura de  maquinas:
Nombre de la maquina | Dirección IP
-----------| -------------
Maquina1 |172.16.76.128
Maquina2 |172.16.76.130
Mquina3-Balanceador |172.16.76.129

en esta maquina vemos como Apache no esta en ejecución

![imagen1](https://github.com/moulayrchid/swap1516/blob/master/practica3/nueva)

## 3. El servidor web nginx

## 3.1. Instalar nginx en Ubuntu Server 

El proceso de instalación en Ubuntu se basa en el uso de apt-get. Lo primero que  
debemos hacer es importar la clave del repositorio de software:  

![imagen2](https://github.com/moulayrchid/swap1516/blob/master/practica3/imagen2.png)

Agrego el repositorio al archivo sourcelist de apt

![imagen3]()

Instalo nginx

![imagen4]()




















