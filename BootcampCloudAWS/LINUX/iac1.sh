#!/bin/bash

#Excluir diretórios, arquivos, grupos e usuários criados anteriormente
#rm -Rf /os dietorios criados anteriormente
#userdel -r <usuarios criados, verificar em /etc/passwd>
#groupdel  <deletando os grupos criados, verificar em /etc/group>

#Criando os diretorios

echo "Criando diretórios"

mkdir /publico
mkdir /adm
mkdir /ven
mkdir /sec

#Criando os grupos

echo "Criando os grupos de usuarios"

groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

#Criando os usuarios

echo "Criando usuarios"

useradd carlos -c "Carlos Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
passwd carlos -e
useradd maria -c "Maria Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
passwd maria -e
useradd joao -c "Joao Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_ADM
passwd joao -e

useradd debora -c "Debora Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
passwd debora -e
useradd sebastiana -c "Sebastiana Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
passwd sebastiana -e
useradd roberto -c "Roberto Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_VEN
passwd roberto -e

useradd josefina -c "Josefina Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
passwd josefina -e
useradd amanda -c "Amanda Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
passwd amanda -e
useradd rogerio -c "Rogerio Silva" -m -s /bin/bash -p $(openssl passwd -1 Senha123) -G GRP_SEC
passwd rogerio -e

#Dando permissões nos diretorios

echo "Dando permissões nos diretorios"

chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec

chmod 770 /adm
chmod 770 /ven
chmod 770 /sec

chmod 777 /publico

echo "finalizado"
