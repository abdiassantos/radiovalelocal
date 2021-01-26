## Stack

* Ruby 2.6.3
* Rails 5.2.3
* Mina(Deploy)
* PostgreSql

## Como preparar o ambiente?

---
Instalar rvm
---
[https://rvm.io/rvm/install](Link URL)

---
Instalar Ruby
---
```
rvm install 2.6.3
```
---
Instalar o Bundler
```
gem install bundler
```

---
Instalar as gems
---
```
bundle install
```

---
Instalar o PostgreSql
---
### Ubuntu
```
sudo apt-get install postgresql postgresql-contrib libpq-dev
```


### macOS
```
brew install postgresql
```

Para que seja mais simples gerenciar os bancos de dados de desenvolvimento, crie um usuário no PostgreSQL com o mesmo nome do seu usuário Ubuntu.

```
sudo -u postgres createuser -rds $USER
```

Depois, crie um banco de dados com o mesmo nome de seu usuário.
```
$ createdb $USER
```

Finalmente, você pode acessar o console do PostgreSQL com o comando psql.
```
$ psql
psql (9.4.2)
Type "help" for help.

user=#
```


---
Instalação Redis local
---
### Ubuntu
```
sudo apt install redis-server
```

### macOS
```
brew install redis-server
```

---
Instalação do docker para containerizar o Redis
---
* [https://docs.docker.com/engine/installation/ubuntulinux/](Link URL)(Ubuntu)
* [https://docs.docker.com/engine/installation/centos/](Link URL)(CentOS)
* [https://docs.docker.com/engine/installation/archlinux/](Link URL)(Arch Linux)
* [https://docs.docker.com/docker-for-mac/] (Link URL) (macOS)

---
Como limpar o redis?
---
```
redis-cli flushdb

ou

redis-cli flushall
```
---
Executando as migrations
---
```
rails db:drop db:create db:migrate db:seed
```
---
Instalando as dependências do node_modules
---
```
yarn install
```

## Executar em modo de desenvolvimento
```
foreman start
```

## Executar deploy

#Criar backup dos assets e imagens(rodar comandos na raiz do servidor)

```
rm -rf storage/
```

```
cp -R /var/www/radiovale/current/storage/ ~/
```

#Comando para iniciar o deploy(rodar comando em sua maquina local, na raiz do projeto)

```
mina deploy
```

#Atualizar assets e imagens com backup(rodar comandos na raiz do servidor)

```
rm -rf /var/www/radiovale/current/storage
```

```
cp -R storage/ /var/www/radiovale/current
```
