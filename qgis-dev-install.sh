#!/usr/bin/env bash

#1. Make this dir to a virtual environment and activate it
virtualenv --always-copy -p /Library/Frameworks/Python.framework/Versions/2.7/bin/python .
source bin/activate

#2. Install SIP
wget http://sourceforge.net/projects/pyqt/files/sip/sip-4.17/sip-4.17.zip
unzip sip-4.17.zip
cd sip-4.17
python configure.py --incdir=../include/python2.7
make
make install
cd ..

#5. Now get PyQT4 from Sourceforge, untar, config and install

    wget http://sourceforge.net/projects/pyqt/files/PyQt4//PyQt-4.11.4/PyQt-x11-gpl-4.11.4.tar.gz
    tar -xzvf PyQt-x11-gpl-4.11.4.tar.gz
    cd PyQt-x11-gpl-4.11.4
    python configure-ng.py
    make
    make install

# 6. Instal Qscintilla

wget http://sourceforge.net/projects/pyqt/files/QScintilla2/QScintilla-2.9.1/QScintilla-gpl-2.9.1.tar.gz
tar -xvf QScintilla-gpl-2.9.1.tar.gz
cd QScintilla-gpl-2.9.1
cd Qt4Qt5
qmake qscintilla.pro
make
make install
cd ..
cd Python
python configure.py
make
make install
cd ../..

# 7. Now symlink to the qgis libs

cd lib/python2.7/site-packages/
ln -s /Applications/QGIS.app/Contents/Resources/python/qgis

# 8. Check whether it works.

python -c "from PyQt4.QtCore import pyqtSlot, QCoreApplication"
python -c "from qgis.gui import QgsMessageBar"

# If no exception is thrown you have made it.

# 9. Now final cleanups

rm -rf PyQt-x11-gpl-4.11.4
rm PyQt-x11-gpl-4.11.4.tar.gz
rm -rf sip-4.17
rm sip-4.17.zip
rm QScintilla-gpl-2.9.1.tar.gz
rm -rf QScintilla-gpl-2.9.1


