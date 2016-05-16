

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

- script de apagado
- solo localhost en servidor
    + no se puede. el FL escucha en todos las IPs.



Mas Pendientes
---------

- seguridad
- escalabilidad
- utf-8
- licencias
- reducir tamaño:
    + quitar idiomas
    + ¿instalar via .deb?



Docker
------

No funciona como entiendo que debería.

    docker pull malev/freeling


Los archivos de configuración están en:
https://raw.githubusercontent.com/TALP-UPC/FreeLing/master/data/config/es.cfg

Ejecutarlo como:

    export FREELINGSHARE=/usr/local/share/freeling
    docker run malev/freeling analyzer -f $FREELINGSHARE/config/es.cfg

o también:

    export FREELINGSHARE=/usr/local/share/freeling
    docker run -it --rm -p 50005:50005 malev/freeling analyzer -f $FREELINGSHARE/config/en.cfg --server --port 50005 --inpf plain --outf morfo



Hacer un package en Debian:

- sudo apt-get install lintian
- sh mkdeb.sh
- ignorar errores del lintian referidos a /usr/local

Falta:

¿Desde /usr/local/bin se pueden ejecutar los programas del docker?

- arreglar resto de errores del lintian

