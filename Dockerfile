FROM node:lts-alpine

# installe un simple serveur http pour servir un contenu statique
RUN npm install -g http-server

# définit le dossier 'app' comme dossier de travail
WORKDIR /app

# copie 'package.json' et 'package-lock.json' (si disponible)
COPY package*.json ./

# installe les dépendances du projet
RUN npm install

# copie les fichiers et dossiers du projet dans le dossier de travail (par exemple : le dossier 'app')
COPY . .

# construit l'app pour la production en la minifiant
RUN npm run build

EXPOSE 8080
CMD [ "http-server", "dist" ]

# FROM node:lts-alpine
# WORKDIR /app
# COPY package.json ./
# RUN  npm install
# EXPOSE 8080
# CMD ["npm", "run", "serve"]


# docker-compose up # to start the compilation process
# to install npm package run
# docker-compose exec -it web npm i bootstrap