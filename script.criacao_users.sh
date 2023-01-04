#!/bin/bash

#Criar diretórios
mkdir /publico
echo "Criado diretório /publico"
mkdir /adm
echo "Criado diretório /adm"
mkdir /ven
echo "Criado diretório /ven"
mkdir /sec
echo "Criado diretório /sec"

#Criar grupos
echo "Criando grupo da administração..."
groupadd GRP_ADM
echo "Criando grupo de vendas..."
groupadd GRP_VEN
echo "Criando grupo da secretaria..."
groupadd GRP_SEC

#criar usuários
echo "Criando usuários"
declare -a users_groups=("carlos GRP_ADM" "maria GRP_ADM" "joao GRP_ADM" "debora GRP_VEN" "sebastiana GRP_VEN" "roberto GRP_VEN" "josefina GRP_SEC" "amanda GRP_SEC" "rogerio GRP_SEC")
for val in "${users_groups[@]}"; do
    set -- $val
    useradd $1 -m -s /bin/bash -p $(openssl passwd Senha123) -G $2
done

#dando as permissões devidas aos diretórios
echo "dando as permissões devidas a cada diretório"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
chmod 770 /adm
chmod 770 /ven
chmod 770 /sec
chmod 777 /publico

echo "Finalizado o script..."

