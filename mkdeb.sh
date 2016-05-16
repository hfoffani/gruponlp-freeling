mkdir -p deb/usr/local/lib
mkdir -p deb/usr/local/bin
mkdir -p deb/usr/local/share/freeling

cp /usr/local/lib/lib* deb/usr/local/lib/
cp /usr/local/bin/* deb/usr/local/bin/

rm deb/usr/local/lib/libfreeling.so
rm deb/usr/local/lib/libfoma.so
rm deb/usr/local/lib/libtreeler.so


objcopy -S deb/usr/local/bin/analyzer
objcopy -S deb/usr/local/bin/analyzer_client
objcopy -S deb/usr/local/bin/dicc2phon
objcopy -S deb/usr/local/bin/threaded_analyzer
objcopy -S deb/usr/local/bin/treeler
objcopy -S deb/usr/local/lib/libfoma-0.9.18.so
objcopy -S deb/usr/local/lib/libfreeling-4.0-beta2.so
objcopy -S deb/usr/local/lib/libtreeler-0.4.so


cd deb/usr/local/lib
chmod 644 *.so
ln -s libfreeling-4.0-beta2.so libfreeling.so
ln -s libfoma-0.9.18.so libfoma.so
ln -s libtreeler-0.4.so libtreeler.so
cd ../../../..

cp -r /usr/local/share/freeling/* deb/usr/local/share/freeling/
find deb/usr/local/share/freeling/ -type f | xargs chmod 644

mkdir deb/DEBIAN
find deb -type d | xargs chmod 755
cp control deb/DEBIAN/
dpkg-deb --build deb

mv deb.deb freeling4.deb
