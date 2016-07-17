The provided `Dockerfile` creates a container with the default development installation of the [frab - conference management system](https://github.com/frab/frab).

## build the container

    git clone https://github.com/SubOptimal/frab-docker
    cd frab-docker
    docker build -t suboptimal/frab-docker .

## start the container

    docker run -ti -p 3000:3000 suboptimal/frab-docker su -l frab

## run frab

`frab` is not started automatically in case you want to replace the SQLite database file for testing purpose.

    # inside the container
    ./run_frab.sh

When frab is started navigate to [http://localhost:3000/](http://localhost:3000/) and login as `admin@example.org` with password `test123`.

## replace the SQLite database file

The container must be running and frab should not be running.

    # on your host
    docker cp your_database.sqlite3 <your_container_id>:/home/frab/frab-master/db/development.sqlite3
    docker exec <your_container_id> chown frab.frab /home/frab/frab-master/db/development.sqlite3
