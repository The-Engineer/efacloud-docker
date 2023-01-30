# efacloud-docker

Docker image for the [efacloud](https://github.com/tfyh/efacloud) using PHP 8, Apache and a MariaDB. Some reverse proxy should also be used to get SSL encryption.

The efacloud environment is a useful _extension_ to the [efa software](http://efa.nmichael.de/), written by [Nicholas Michael](http://www.nmichael.de/).

---

## Setup

Make sure docker and docker-compose are installed.

Clone the repository

```bash
git clone https://github.com/The-Engineer/efacloud-docker.git
```

### Setup .env variables

```bash
cp .env.sample .env
```

setup passwords for the database in the .env file

### Run the compose file

```bash
docker-compose up -d
```

### Open application and run setup

Open the [setup wizard](http://localhost:8080/install.php) and choose an efacloud version to install. In the database setup use the value mariadb as the database host (using docker internal dns routing).

---

## Can I haz sources

Can be found here:
- [efacloud](https://www.efacloud.org/material.html)
- [efa software](http://efa.nmichael.de/)
 