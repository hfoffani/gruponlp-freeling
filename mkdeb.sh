mkdir -p deb/usr/local/lib
mkdir -p deb/usr/local/bin
mkdir -p deb/usr/local/share/freeling

cp /usr/local/lib/lib* deb/usr/local/lib/
cp -r /usr/local/share/freeling/* deb/usr/local/share/freeling/

cp /usr/local/bin/* deb/usr/local/bin/
mkdir deb/DEBIAN
find deb -type d | xargs chmod 755
cp control deb/DEBIAN/
fakeroot dpkg-deb --build deb

mv deb.deb freeling4.deb
