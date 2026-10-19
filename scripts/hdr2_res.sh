#!/bin/bash

# ==========================================
# Configuración de Entorno IBM Informix - IDSHDR2
# ==========================================
export INFORMIXDIR=/opt/informix
export INFORMIXSERVER=idshdr2
export PATH=$INFORMIXDIR/bin:$PATH
export ONCONFIG=onconfig.idshdr2

# Personalización del Prompt
PS1='[\u@\h] ${INFORMIXSERVER}:${PWD}> '
export PS1

# Configuración de Localización y Variables de Base de Datos
export DBMONEY=,,
export DBDATE=Y4MD-
export CLIENT_LOCALE=en_US.819
export DB_LOCALE=en_US.819
export CLIENT_LOCALE DB_LOCALE DBDATE DBMONEY

# Optimización del Kernel
export KAIOON=1

# ==========================================
# Ejecución de la Restauración Remota
# ==========================================
ontape -r -t STDIO
