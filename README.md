
docker pull malev/freeling

export FREELINGSHARE=/usr/local/share/freeling


Archivo de Configuracion
------------------------
https://raw.githubusercontent.com/TALP-UPC/FreeLing/master/data/config/es.cfg


docker run malev/freeling analyzer -f $FREELINGSHARE/config/es.cfg

docker run -it --rm -p 50005:50005 malev/freeling analyzer -f $FREELINGSHARE/config/en.cfg --server --port 50005 --inpf plain --outf morfo 



Websockets
----------

pip install git+https://github.com/dpallot/simple-websocket-server.git
o usar sudo pip install ...etc..



Demo Websockets
---------------

levantar el linux.
anotar la ip.
    /sbin/ifconfig
levantar el FL deamon:
    analyze -f es.cfg --server --port 50005 --output json --flush &
anotar el pid para matarlo via:
    analyze stop nnn

levantar el websocket server
    python fl.py --server




FreeLang client en Python
-----------

https://github.com/proycon/pynlpl


Pendientes
---------
seguridad
utf-8
formato salida
licencias



