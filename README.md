# Docker Development Environment for Laravel and Vite --react-ts with MariaDB

## Getting Started

1. Clone this repository.
2. Build and start the containers:
   
   ```sh
   docker compose -f compose.dev.yaml up --build
   ```

3. Access your apps:
   - Laravel: http://localhost:8000
   - React: http://localhost:3000
   - MariaDB: localhost:3306 (user: laravel, password: secret)

## Laravel Project Initialization

- If the `./backend` directory not exist, the container will create it.
- If the `./backend` directory is empty when you first start the containers, the Bitnami Laravel container will automatically create a new Laravel project inside `./backend`.
- If `./backend` already contains a Laravel project, it will be used as-is.
- This makes it easy to start a new Laravel project or use an existing one without extra commands.
- The environment variables for the Laravel project are loaded from the root `.env` file. You app-key can be generated automatically in the env file of the new project, you must set in the .env root file if is not set automatically.

### Starter Kit Configuration

- You can automatically install a Laravel starter kit (breeze, jetstream, or fortify) when a new project is created.
- Set the desired starter kit in your `.env` file:
  ```env
  LARAVEL_STARTER_KIT=breeze
  # LARAVEL_STARTER_KIT_OPTIONS=  # e.g., --stack=livewire for Jetstream
  ```
- Supported values for `LARAVEL_STARTER_KIT` are `breeze`, `jetstream`, and `fortify`.
- For Jetstream, you can specify additional options with `LARAVEL_STARTER_KIT_OPTIONS` (e.g., `--stack=livewire` or `--stack=inertia`).
- On first startup, the container will create the project and install the selected starter kit automatically.

## Directory Structure

- `backend/`   — Laravel app (mounted to `/app` in the container)
- `frontend/`  — React app (mounted to `/app` in the container)

## Environment Variables

- All services use the `.env` file in the project root for configuration.
- Update `.env` or `.env.example` to change database credentials, app URL, etc.
- The compose file uses Bitnami images for both Laravel and MariaDB, and loads environment variables via `env_file: .env`.

## First-time Setup

- For Laravel, run migrations and generate APP_KEY (if not set in the .env file) inside the container:
  ```sh
  docker compose -f compose.dev.yaml exec laravel php artisan migrate
  docker compose -f compose.dev.yaml exec laravel php artisan key:generate
  ```
- For React, the development server will reload on file changes.
- On first startup, the container will create the project and install the selected starter kit automatically, so you don't need to run any additional commands with the default configuration.
  
- The first startup may take a few minutes as the container needs to create the project and install dependencies.

## Notes
- Laravel and MariaDB services use Bitnami Docker images for easy development.
- MariaDB data is persisted in a Docker volume (`db_data`).
- If you update `.env`, you may need to restart the containers for changes to take effect.
