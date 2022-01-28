FROM mcr.microsoft.com/dotnet/sdk:6.0-bullseye-slim AS dotnet-mongo
# Install MongoDB
RUN apt-get update \
&& apt-get install -y apt-utils gnupg dirmngr python3-httpbin \
# This is a load of complexity needed to add the security keys for the MongoDB repository.
&& mkdir /root/.gnupg \
&& chmod 700 /root/.gnupg \
&& dirmngr --daemon \
&& gpg --no-default-keyring --keyring gnupg-ring:/etc/apt/trusted.gpg.d/mongodb.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys b00a0bd1e2c63c11 \
&& chmod 644 /etc/apt/trusted.gpg.d/mongodb.gpg \
# Add MongoDB repository to apt
&& echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" > /etc/apt/sources.list.d/mongodb-org-5.0.list \
&& apt-get update \
&& apt-get install -y mongodb-org
