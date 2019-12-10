# Backup Hive DDL tables

Script para extraer las definiciones de tablas que constan en Hive.

# Version

1.0

### Known issues

- No exporta las definiciones de tablas de Kudu.
- El programa cliente "hive" utilizado consta como "deprecated". Se utiliza en este script por ser el cliente para acceder a "Hive" instalado en clusters de AWS. Se puede adaptar la estructura de este script para crear la misma funcionalidad con otros clientes de Hive.

### Running

sh backup_hive_ddl_tables.sh

### Output

La salida del programa estará en el mismo directorio de ejecución de este y será un directorio llamado "hive", que contendrá a su vez subdirectorios con el nombre de las bases de datos que contiene hive   terminadas con la extensión ".db". Dentro de cada uno de estos subdirectorios habrá un fichero con el nombre de cada una de las tablas que contiene y con extension ".hql" .

Al mismo nivel que las bases de datos se crea el fichero llamado:
HiveTablesDDL.hql

Este contiene todas las sentencias de creación de tablas. Puede ser utilizado para recrear la estructura  de tablas que contiene Hive.

Ejemplo:

``` bash

├── backup_hive_ddl_tables.sh
├── hive
│   ├── analytics.db
│   │   └── alpc_lp_test.hql
│   ├── apc.db
│   │   ├── creditos.hql
│   │   ├── cupon_format.hql
│   │   ├── cupon.hql
│   │   ├── dl_nombre.hql
│   ├── cu1ofp.db
│   │   ├── ds1boec.hql
│   │   ├── ds1_cc_oec.hql
│   │   ├── ds1_oec_cn.hql
│   │   ├── ds2boec.hql
│   │   ├── ds2_oec_ng.hql
│   └── HiveTablesDDL.hql

```

### Dependencies

hive
