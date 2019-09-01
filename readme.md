# A2Way Template Docker Laravel

A project template for Laravel on Docker. 

## First Run

- Open your shell's "rc file" (Eg: `.bashrc` and `.zshrc`.) and add following lines:

```
export UID
export GID
```

- Clone this repo.
- Go inside the repo directory.
- Run `docker-compose up -d`.
- Go inside the `php` container with `make shell`.
- Make sure you're in the `/app` directory.
- Empty directory with `rm -rf * .*`.
- Run `composer create-project --prefer-dist laravel/laravel .`.
- Copy of the content of the `src/.env` file to the `env/main.env` file, and delete the `src/.env` file.
- Copy the content of the `env/main.env` file to `env/tmp.main.env`, but remove the sensitive data like passwords or API keys.
- `exit` out of the `php` container.
- Run `docker-compose down`.
- Remove the `src/vendor` directory.
- Open `docker-compose.yml` file and uncomment the `- ./vols/vendor/:/app/vendor/` line.
- Run `docker-compose up -d`.
- Run `make shell`.
- Inside the `php` container, run `composer install`.
- Go to `localhost:8000` and make sure Laravel is running.

## Making Production Image

- Run `docker-compose -f prod.docker-compose.yml build`.
- Run `docker images` to make sure a new Docker Image with the tag `dockerhub-username/project-name:latest` is created (You can change the resulting image name in the `prod.docker-compose.yml` file.).
- Tag it as you wish and push to Docker Hub.
