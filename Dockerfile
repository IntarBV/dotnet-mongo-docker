FROM microsoft/dotnet:2.2-sdk AS dotnet-mongo

# Install MongoDB in an extra layer
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 \
&& echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.0 main" > /etc/apt/sources.list.d/mongodb-org-4.0.list \
&& apt-get update && apt-get install -y mongodb-org
# Configure MongoDB autostart and dotnet telemetry opt-out
RUN echo 'mkdir -p /tmp/data/db; mongod --dbpath tmp --nojournal --fork --logpath /var/log/mongod.log; export DOTNET_CLI_TELEMETRY_OPTOUT=1' >> /root/.bashrc

# CircleCI does not preserve the entrypoint unless this label is set.
LABEL com.circleci.preserve-entrypoint=true
ENTRYPOINT [ "bash" ]
