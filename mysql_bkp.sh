#!/bin/bash

#################### SCRIPT PARA BACKUP MYSQL ####################
# Irwing da Silva Ovando <mobcubestudio@gmail.com>               #
# Created Ago, 2022                                              #
# Update Ago, 2022                                               #

# Definindo parametros do MySQL
echo "  -- Definindo parametros do MySQL ..."
DB_NAME=''
DB_USER=''
DB_PASS=''
DB_PARAM='-B --add-drop-table --add-locks --extended-insert --single-transaction -quick'

# Definindo parametros do sistema
echo "  -- Definindo parametros do sistema ..."
DATE=`date +%Y-%m-%d-%H-%M`
MYSQLDUMP=/usr/bin/mysqldump
BACKUP_DIR=~/backup/mysql
BACKUP_NAME=mysql-$DB_NAME-$DATE.sql
BACKUP_TAR=mysql-$DB_NAME-$DATE.tar

mkdir -p $BACKUP_DIR

#Gerando arquivo sql
echo "  -- Gerando Backup da base de dados $DB_NAME em $BACKUP_DIR/$BACKUP_NAME ..."
$MYSQLDUMP $DB_NAME $DB_PARAM -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME

# Compactando arquivo em tar
echo "  -- Compactando arquivo em tar ..."
tar -cjf $BACKUP_DIR/$BACKUP_TAR -C $BACKUP_DIR $BACKUP_NAME --remove-files

echo "  -- Enviando arquivo para o Google Drive ..."
./gdrive upload $BACKUP_DIR/$BACKUP_TAR

echo "  -- Excluindo arquivo tar ..."
rm $BACKUP_DIR/$BACKUP_TAR
