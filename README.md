# Minecraft Fabric Server - Docker Image

[![Docker Image CI](https://github.com/DylanBulmer/Minecraft-Fabric/actions/workflows/docker-image.yml/badge.svg)](https://github.com/DylanBulmer/Minecraft-Fabric/actions/workflows/docker-image.yml)

This image downloads, installs, and runs the latest version of Fabric MC. 

Feel free to create issues and/or pull requests for versions not available, improvements, and other developments! I'll try my best to keep up with this project while working.

Get started by pulling the image from `ghcr.io/dylanbulmer/minecraft-fabric`

| Env Veriable            | Default       |
| ----------------------- | ------------- |
| MINECRAFT_VERSION       | 1.17          |
| MINECRAFT_PORT          | 25565         |
| MINECRAFT_MAXHEAP       | 2048M         |
| MINECRAFT_EULA          | true          |
| MINECRAFT_RCON_ENABLE   | true          |
| MINECRAFT_RCON_PORT     | 25575         |
| MINECRAFT_RCON_PASSWORD | password      |

Please find examples in the [`/examples/`](https://github.com/DylanBulmer/minecraft-fabric/tree/master/examples) folder.