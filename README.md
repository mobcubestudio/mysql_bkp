# Backup MySQL

Esse script tem a finalidade de realizar o mysqldump, compactar e enviar uma cópia para sua conta no google drive.

## Permissões
* cd PASTA_DO_PROJETO/mysql_bkp
* chmod +x mysql_bkp.sh

## Configurando o Google Drive:

* Exeute o comando ./gdrive about

* Copie o link gerado após o comando e abara em seu navegador, Conceda as permissões e copie o código gerado pelo google.

* Cole o código no terminal.

## Configurando o banco de dados
 * Aletere as linhas 10, 11 e 12 com as informações do seu banco de dados.
 * A linha 13 está destinada a parametros adicionais do mysqldump. Adicione ou remova conforme sua necessidade.

## Executando o script
* Manualmente
  * cd PASTA_DO_PROJETO/mysql_bkp
  * ./mysql_bkp.sh
* Agendado (Ex.: Todos os dia as 14:30)
  * crontab -e
  * 30 14 * * * cd PASTA_DO_PROJETO/mysql_bkp/ && /bin/bash mysql_bkp.sh