# Laravel & Node.js Development Environment Image

This repository provides a Dockerfile for creating a Docker image based on **php:8.2-fpm** with additional development tools.  

You can pull the pre-built image from Docker Hub at:  
[**softjpn/laravel-nodejs-dev**](https://hub.docker.com/r/softjpn/laravel-nodejs-dev)

---

## What's Included

- **PHP 8.2 (FPM)**  
- **Composer** (for PHP package management)  
- **Laravel Installer** (for easy project scaffolding)  
- **Git** (for version control)  
- **Node.js & npm** (for JavaScript/Node.js development)  

By using this image, you can develop Laravel applications (or any PHP applications) without installing all these tools on your local machine.

---

## Additional Files in This Repository

In addition to the Dockerfile, this repository contains some test files for demonstration purposes:

- **`./example-app`**  
  A Laravel example application generated by running the `laravel new` command.  
- **`./helloworld.php`**  
  A simple PHP script to test PHP functionality.  
- **`./helloworld.js`**  
  A simple Node.js script to test Node.js functionality.  

Feel free to use these files to quickly verify that the container is working as intended.

---

## Getting Started

### Pull the Docker Image

You can pull the Docker image directly from Docker Hub:

```bash
docker pull softjpn/laravel-nodejs-dev
```

---

## Usage Examples

Below are some commonly used commands. The key idea is to mount your current directory (`$PWD`) to the container's `/app` directory.

### 1. Create a new Laravel project

```bash
docker run --rm -it -v "$PWD:/app" softjpn/laravel-nodejs-dev laravel new example-app
```

This command will create a new Laravel project in a directory called `example-app` under your current working directory.

---

### 2. Run a simple PHP script

If you have a file named `helloworld.php` in your current directory:

```bash
docker run --rm -it -v "$PWD:/app" softjpn/laravel-nodejs-dev php helloworld.php
```

This will execute `helloworld.php` using the PHP runtime from the container.

---

### 3. Check PHP version

```bash
docker run --rm -it -v "$PWD:/app" softjpn/laravel-nodejs-dev php --version
```

Displays the PHP version inside the container.

---

### 4. Use Git

```bash
docker run --rm -it -v "$PWD:/app" softjpn/laravel-nodejs-dev git --version
```

Displays the Git version inside the container. You can also run any other Git commands this way.

---

### 5. Check npm version

```bash
docker run --rm -it -v "$PWD:/app" softjpn/laravel-nodejs-dev npm --version
```

Displays the npm version inside the container. You can also install dependencies, run build scripts, etc., by replacing `npm --version` with other npm commands.

---

## Building the Image Locally

If you prefer to build the image yourself, clone this repository and run:

```bash
git clone https://github.com/<your-github-account>/<repository-name>.git
cd <repository-name>
docker build -t softjpn/laravel-nodejs-dev .
```

Then you can use your locally built image by specifying `softjpn/laravel-nodejs-dev` (or another name if you change `-t`) in the commands above.

---

## Notes

- **Working Directory**: The container’s default working directory is `/app`.  
- **Default Command**: When no command is provided, the container runs `php-fpm`.  
- **Entry Point**: Uses `docker-php-entrypoint`, ensuring your PHP environment is set up correctly.  

---

## Contributing

1. Fork the repository.  
2. Create a new feature branch.  
3. Make your changes and commit them.  
4. Push to the branch.  
5. Create a Pull Request.  

All contributions are welcome!

---

## License

This project is open-sourced software licensed under the [MIT license](LICENSE).  

Feel free to open issues or submit pull requests for improvements or suggestions!  