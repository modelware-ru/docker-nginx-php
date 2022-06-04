## v 1.1.0

Added x-debug.

launch.json

    {
        "version": "0.2.0",
        "configurations": [
            {
                "name": "Listen for Xdebug",
                "type": "php",
                "request": "launch",
                "port": 9003,
                "pathMappings": {
                    "/www":"${workspaceFolder}/www"
                }
            }
        ]
    }

## v 1.0.0

Nginx and PHP. Basic functionality