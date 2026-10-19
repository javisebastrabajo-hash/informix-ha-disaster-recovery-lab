# informix-ha-disaster-recovery-lab
Laboratorio de Alta Disponibilidad (HDR) y Recuperación ante Desastres (RSS) con IBM Informix sobre entornos Linux/VirtualBox. (Proyecto de Fin de Grado - Calificación: 10/10).


Diseño e Implementación de una Arquitectura de Alta Disponibilidad y Recuperación ante Desastres con IBM Informix en Entornos Distribuidos (Linux/VirtualBox)
1. Resumen Ejecutivo (Executive Summary)
    • Contexto: Proyecto de Fin de Grado (Calificación: 10/10).
    • Objetivo: Diseñar, desplegar y validar desde cero un entorno de bases de datos de misión crítica tolerante a fallos, simulando escenarios de producción reales del sector empresarial e institucional.
    • Tecnologías clave: IBM Informix (v12.10), Bash Scripting, Redes Linux (Ubuntu Server), SSH Keygen, VirtualBox, Arquitectura HDR (High Data Replication) y RSS (Remote Standalone Secondary).
2. Arquitectura de la Solución
El laboratorio se estructuró sobre un entorno virtualizado de 3 nodos interconectados en red:
    • Nodo Primario (idshdr1): Servidor principal encargado de gestionar las operaciones transaccionales (OLTP) y analíticas (OLAP), permitiendo modificaciones de datos y DDL.
    • Nodo Secundario HDR (idshdr2): Servidor espejo en modo de alta disponibilidad dentro de la misma red local, operando en modo de solo lectura y sincronizado en tiempo real mediante el consumo de registros lógicos (logical logs). 
    • Nodo RSS (idsrss): Tercer nodo configurado como secundario remoto e independiente, diseñado conceptualmente para escenarios de recuperación ante desastres (Disaster Recovery) en ubicaciones geográficas distintas. 
3. Retos Técnicos y Fases de Implementación
    • Aprovisionamiento y Hardening de Sistemas: Configuración de usuarios y permisos específicos (informix), creación de estructuras de almacenamiento dedicadas mediante dbspaces y chunks críticos (rootdbs, physdbs, logdbs, datosdbs, tmpdbs).
    • Automatización con Bash Scripting: Desarrollo de scripts personalizados para la gestión de copias de seguridad físicas (ontape), respaldos incrementales y restauración remota automatizada mediante túneles seguros y claves RSA.
    • Configuración de Red y Conectividad: Establecimiento de relaciones de confianza (hosts.equiv), definición de parámetros de red avanzados en sqlhosts y ajuste de variables de entorno críticas (INFORMIXDIR, ONCONFIG, DBMONEY, KAIOON).  

4. Pruebas de Concepto y Validación de Failover
Para demostrar la robustez de la arquitectura, se ejecutó una batería de pruebas de estrés y simulación de fallos:
    1. Transacción en Primario: Ejecución de actualizaciones y consultas cruzadas entre instancias distribuidas.
    2. Simulación de Caída Abrupta: Cierre forzoso de la instancia primaria (onmode -ky) para evaluar el comportamiento ante interrupciones críticas. 
    3. Promoción de Nodo (Failover): Promoción exitosa del nodo secundario HDR a primario (onmode -d make primary), validando que la última transacción realizada se recuperó íntegramente sin pérdida de datos. 
    4. Respaldo Remoto con RSS: Verificación del rol del servidor RSS como salvaguarda ante desastres globales capaces de comprometer la infraestructura principal. 
5. Conclusiones y Competencias Demostradas
Este proyecto validó con éxito que la arquitectura implementada es capaz de garantizar la continuidad de negocio (Business Continuity) y la integridad transaccional con un impacto mínimo ante caídas imprevistas.
    • Demuestra capacidad avanzada en administración de bases de datos relacionales complejas, gestión de sistemas operativos bajo consola y resolución de incidencias de nivel crítico (N2/N3), alineándose directamente con entornos de producción empresariales y de la administración pública.
