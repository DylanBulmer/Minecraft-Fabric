FROM openjdk:16

# Minecraft setup
ENV MINECRAFT_PORT 25565
ENV MINECRAFT_EULA true
ENV MINECRAFT_MAXHEAP 2048M
ENV MINECRAFT_VERSION 1.17

# Rcon setup
ENV MINECRAFT_RCON_ENABLE true
ENV MINECRAFT_RCON_PORT 25575
ENV MINECRAFT_RCON_PASSWORD password

# Setup Installation Variable
ENV FABRIC_VERSION 0.7.4
ENV FABRIC_URL "https://maven.fabricmc.net/net/fabricmc/fabric-installer/${FABRIC_VERSION}/fabric-installer-${FABRIC_VERSION}.jar"
ENV FABRIC_API_FILENAME fabric-api-0.36.0+1.17.jar
ENV FABRIC_API_URL "https://edge.forgecdn.net/files/3358/619/${FABRIC_API_FILENAME}"

WORKDIR "/server"

ADD ./install.sh /start_fabric
RUN chmod +x /start_fabric

EXPOSE ${MINECRAFT_PORT}
EXPOSE ${MINECRAFT_RCON_PORT}
CMD ["/start_fabric"]