FROM node 
# utiliza uma imagem pronta do Node

WORKDIR /usr/src/app
# Essa pasta será criada dentro do container

COPY package.json /usr/src/app
#Copia o package.json para o workdir (o caminho pode ser substituido por um .)

RUN npm install 
#Executa comando dentro do container

COPY . /usr/src/app
# Copia todos os arquivos deste diretório para o workdir do container

EXPOSE 3000
# A porta q será exposta

CMD ["node", "index.js"]
# Esse comando será executado após o final dos processos acima.
