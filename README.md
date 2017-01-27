The provided `Dockerfile` creates a container with the default development installation of the [frab - conference management system](https://github.com/frab/frab).

## build the container

    git clone https://github.com/SubOptimal/frab-docker
    cd frab-docker
    docker build -t suboptimal/frab-docker .
    
In case you are behind a proxy start the build as

    docker build --build-arg http_proxy=http://your.proxy.host:8080 -t suboptimal/frab-docker .

## start the container

    docker run -ti -p 3000:3000 --name frab-devl-demo suboptimal/frab-docker su -l frab

## initial setup of frab

    # inside the container
    bundle config github.https true
    ~/setup_frab.sh

## starting frab

`frab` is not started automatically when the container is started, in case you want to replace the SQLite database file for testing purpose.

    # inside the container
    ~/run_frab.sh

As soon frab is started navigate to [http://localhost:3000/](http://localhost:3000/) and login as user `admin@example.org` with password `test123`.

## replace the SQLite database file

The container must be up and running, but frab must not be running.

    # on your host
    docker cp your_database.sqlite3 <your_container_id>:/home/frab/frab-master/db/development.sqlite3
    docker exec <your_container_id> chown frab.frab /home/frab/frab-master/db/development.sqlite3
