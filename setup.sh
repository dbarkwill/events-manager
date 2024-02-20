#!/bin/bash

generate_hashed_password() {
    local password="$1"
    docker run --rm httpd htpasswd -bnB "admin" "$port_pass" |  sed "s/[$]/\$\$/g" | cut -d ":" -f 2
}

generate_secret() {
    docker compose run --rm --no-deps web bundle exec rake secret
}
cp ./env_example ./.env

read -sp 'Database Password: ' db_pass
echo
read -sp 'Portainer Password: ' port_pass
echo
echo 'Building Docker Image'
echo 'Process may take a few minutes.'
echo
docker compose build
echo
echo 'Generating Passwords'

port_hashed_password=$(generate_hashed_password $port_pass)
secret=$(generate_secret)

sed -i "s/^PORTAINER_PW_HASH=.*/PORTAINER_PW_HASH=$port_hashed_password/" .env
sed -i "s/^PORTAINER_PW=.*/PORTAINER_PW=$port_pass/" .env
sed -i "s/^DATABASE_PW=.*/DATABASE_PW=$db_pass/" .env
sed -i "s/^SECRET_TOKEN=.*/SECRET_TOKEN=$secret/" .env

echo 'Configuration Updated'