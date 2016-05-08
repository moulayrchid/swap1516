#! /bin/bash

#echo "Práctica 4 SWAP" > pruebaAbMaquina1.txt
#echo "Práctica 4 SWAP" > pruebaAbMaquina2.txt
#echo "Práctica 4 SWAP" > pruebaAbBalanceadorNginx.txt
#echo "Práctica 4 SWAP" > pruebaAbBalanceadorHaproxy.txt



for a in  $( seq 30 ); do
	echo "########################    Prueba $a en la maquina1    ######################## " >> pruebaAbMaquina1.txt
	`ab -n 10000 -c 10 http://172.16.76.128/prueba.php >> pruebaAbMaquina1.txt`
done


for a in  $( seq 30 ); do
	echo "########################    Prueba $a en la maquina2    ######################## " >> pruebaAbMaquina2.txt
	`ab -n 10000 -c 10 http://172.16.76.130/prueba.php >> pruebaAbMaquina2.txt`
done

# nos conectamos al guest desactivamos haproxy y activamos nginx
ssh root@172.16.76.129 'sudo service nginx start'


for a in  $( seq 30 ); do
	echo "########################    Prueba $a en el balanceador con nginx  ######################## " >> pruebaAbBalanceadorNginx.txt
	`ab -n 10000 -c 10 http://172.16.76.129/prueba.php >> pruebaAbBalanceadorNginx.txt`
done

#desactivamos nginx y activamos haproxy
ssh root@172.16.76.129 'sudo service nginx stop'
ssh root@172.16.76.129 'sudo /usr/sbin/haproxy -f /etc/haproxy/haproxy.cfg'



for a in  $( seq 30 ); do

	echo "########################    Prueba $a en el balanceador con haproxy    ######################## " >> pruebaAbBalanceadorHaproxy.txt
	`ab -n 10000 -c 10 http://172.16.76.129/prueba.php >> pruebaAbBalanceadorHaproxy.txt`
done
#salimos del guest
`exit`



