FROM mcr.microsoft.com/dotnet/sdk:7.0-bullseye-slim AS dotnet-mongo
# Install MongoDB
RUN apt-get update \
&& apt-get -y install gnupg \
&& wget -qO - https://pgp.mongodb.com/server-6.0.asc | gpg --dearmour > /usr/share/keyrings/mongodb.gpg \
&& echo "deb [signed-by=/usr/share/keyrings/mongodb.gpg] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/6.0 main" > /etc/apt/sources.list.d/mongodb-org.list \
&& apt-get update \
&& apt-get install -y mongodb-org-server mongodb-mongosh\
&& rm -rf /var/lib/apt/lists/*
