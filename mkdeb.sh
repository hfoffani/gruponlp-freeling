mkdir -p deb/usr/local/lib
mkdir -p deb/usr/local/bin
mkdir -p deb/usr/local/share/freeling

cp /usr/local/lib/lib* deb/usr/local/lib/

cd deb/usr/local/lib
rm libfreeling.so
rm libfoma.so
rm libtreeler.so
chmod 644 *.so
ln -s libfreeling-4.0-beta2.so libfreeling.so
ln -s libfoma-0.9.18.so libfoma.so
ln -s libtreeler-0.4.so libtreeler.so
cd ../../../..

cp -r /usr/local/share/freeling/* deb/usr/local/share/freeling/
find deb/usr/local/share/freeling/ -type f | xargs chmod 644

cp /usr/local/bin/* deb/usr/local/bin/

mkdir deb/DEBIAN
find deb -type d | xargs chmod 755
cp control deb/DEBIAN/
dpkg-deb --build deb

mv deb.deb freeling4.deb
