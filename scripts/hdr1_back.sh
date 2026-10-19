#!/bin/bash

# ==========================================
# Configuración de Entorno IBM Informix - HDR1
# ==========================================
export INFORMIXDIR=/opt/informix
export INFORMIXSERVER=idshdr1
export PATH=$INFORMIXDIR/bin:$PATH
export ONCONFIG=onconfig.idshdr1

# Personalización del Prompt
PS1="[\u@\h] \${INFORMIXSERVER}:\${PWD}> "
export PS1

# Configuración de Localización y Moneda
export DBMONEY=,,
export DBDATE=Y4MD-
export CLIENT_LOCALE=en_US.819
export DB_LOCALE=en_US.819

# Optimización de E/S del Kernel
export KAIOON=1

# ==========================================
# Ejecución de Backup y Transmisión Remota
# ==========================================
# Realiza una copia de seguridad completa (-s -L 0) utilizando entrada/salida estándar (-t STDIO)
# y la transmite mediante SSH al nodo secundario para su restauración automatizada.
ontape -s -L 0 -t STDIO | ssh idshdr2 /home/informix/HDR/hdr2_res.sh

