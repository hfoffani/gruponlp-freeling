
Uno de Docker
-------------

    docker pull malev/freeling
    export FREELINGSHARE=/usr/local/share/freeling

no funciona como quiero.


Archivo de Configuracion
------------------------
https://raw.githubusercontent.com/TALP-UPC/FreeLing/master/data/config/es.cfg


    docker run malev/freeling analyzer -f $FREELINGSHARE/config/es.cfg

    docker run -it --rm -p 50005:50005 malev/freeling analyzer -f $FREELINGSHARE/config/en.cfg --server --port 50005 --inpf plain --outf morfo 



Server
------

    wget https://github.com/hfoffani/gruponlp-freeling/releases/download/v0.1/flserver.tgz
    tar xvf flserver.tgz


Freeling
--------

    install-freeling.sh

Websockets
----------

    install-wsfreeling.sh



FreeLang client en Python
-----------

https://github.com/proycon/pynlpl



Pendientes
---------

. script de apagado
. solo localhost en servidor
    no se puede. el FL escucha en todos las IPs.



Mas Pendientes
---------

. seguridad
. escalabilidad
. utf-8
. licencias
. reducir tamaño:
    . quitar idiomas
    . ¿instalar via .deb?


