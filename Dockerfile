FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS dotnet-mongo
# Install MongoDB in an extra layer
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv b00a0bd1e2c63c11 \
&& echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" > /etc/apt/sources.list.d/mongodb-org-5.0.list \
&& apt-get update && apt-get install -y mongodb-org python3-httpbin
