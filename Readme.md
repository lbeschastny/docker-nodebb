NodeBB Dockerfile
=============

## Init

    mkdir -p /opt/nodebb/data /opt/nodebb/uploads

## Redis

    docker run --name nodebb-redis --restart=always -v /opt/nodebb/data:/data -d redis:2.8 redis-server

## Redis-cli

    docker run -it --link nodebb-redis:redis --rm redis sh -c 'exec redis-cli -h "$REDIS_PORT_6379_TCP_ADDR" -p "$REDIS_PORT_6379_TCP_PORT"'

## NodeBB

    docker run --name nodebb-app --link nodebb-redis:redis --restart=always -p 80:80 -p 443:443 -p 4567:4567 -v /opt/nodebb/uploads:/opt/nodebb/public/uploads -v /opt/nodebb/config.json:/opt/nodebb/config.json -d lbeschastny/nodebb:0.8
