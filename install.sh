#!/bin/bash
export INSTALLER_JAR="fabric-installer-${FABRIC_VERSION}.jar"

if [ ! -f "/server/${INSTALLER_JAR}" ]; then
	echo "Downloading ${FABRIC_URL}"
	cd /server
	curl ${FABRIC_URL} -o ${INSTALLER_JAR}

	# Install fabric
	java -jar fabric-installer-${FABRIC_VERSION}.jar server -mcversion ${MINECRAFT_VERSION} -downloadMinecraft

	# Rename files
	mv server.jar vanilla.jar
	mv fabric-server-launch.jar server.jar
	echo "serverJar=vanilla.jar" > fabric-server-launcher.properties
fi

if [ ! -f "/server/server.properties" ]; then
	echo "server-port=${MINECRAFT_PORT}" > /server/server.properties
	echo "enable-rcon=${MINECRAFT_RCON_ENABLE}" >> /server/server.properties
	echo "rcon.port=${MINECRAFT_RCON_PORT}" >> /server/server.properties
	echo "rcon.password=${MINECRAFT_RCON_PASSWORD}" >> /server/server.properties
fi

if [ -n "${MINECRAFT_EULA}" ]; then
	echo "eula=${MINECRAFT_EULA}" > /server/eula.txt
fi

if [ ! -d "/server/mods/" ]; then
	mkdir -p /server/mods
fi

if [ ! -f "/server/mods/${FABRIC_API_FILENAME}" ]; then
	echo "Downloading ${FABRIC_API_URL}"
	curl -L ${FABRIC_API_URL} > /server/mods/${FABRIC_API_FILENAME}
fi

STARTCOMMAND="java"
if [ -n "${MINECRAFT_MAXHEAP}" ]; then
  STARTCOMMAND="${STARTCOMMAND} -Xmx${MINECRAFT_MAXHEAP}"
fi

STARTCOMMAND="${STARTCOMMAND} -jar server.jar"
cd /server && exec ${STARTCOMMAND}