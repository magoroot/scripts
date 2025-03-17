#!/bin/bash
#By: Joás Pardim

# Diretórios de logs do WildFly no Sankhya-W
LOG_DIRS=(
    "/home/mgeweb/wildfly_producao/standalone/log"
    "/home/mgeweb/wildfly_teste/standalone/log"
    "/home/mgeweb/wildfly_treina/standalone/log"
)

# Quantidade de dias para manter os logs
DAYS_TO_KEEP=30

# Loop para percorrer os diretórios e remover logs antigos
for DIR in "${LOG_DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        echo "Limpando logs antigos em: $DIR"

        # Encontrar e remover logs com padrão server.log.AAAA-MM-DD que tenham mais de X dias
        find "$DIR" -type f -name "server.log.20*" -mtime +$DAYS_TO_KEEP -exec rm -f {} \;

    else
        echo "Diretório não encontrado: $DIR"
    fi
done

echo "Limpeza de logs 'LOG_DIRS' concluída."
