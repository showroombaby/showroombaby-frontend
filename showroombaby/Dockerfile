   # Utiliser une image de base officielle de Swift
   FROM swift:5.7

   # Créer un répertoire de travail
   WORKDIR /app

   # Copier le projet Xcode
   COPY . .

   # Construire le projet avec xcodebuild
   RUN xcodebuild -scheme "showroombaby.app" -configuration Release

   # Exposer le port sur lequel l'application écoute
   EXPOSE 8080

   # Commande pour exécuter l'application
   CMD ["path/to/ton/executable"]