## Php 7 Code Coverage

### Getting the image

```
docker pull nowait/php:7.0-coverage
```

### Usage

This docker image is very opinionated in how it must be used.  You must pass an env named `PHP_MEMORY_LIMIT` at runtime so the entrypoint templates the php.ini correctly.  Since code coverage analysis is a very memory intensive process and highly dependent on project size, this allows the same image to be used across small and large projects.  You must mount the project's source code to `/src` inside the container.  In addition, the entrypoint will pass all provided arguments to the `phpdbg7` binary inside the container, which allows for running whatever command you want with `phpdbg7`.

For a typical app that uses Phpunit for the test suite the following command would generate a code coverage report.

```
docker run -e "PHP_MEMORY_LIMIT=100M" -v $(pwd):/src nowait/php:7.0-coverage -qrr /src/path/to/phpunit --coverage-html report/
```

If your application is complex and the tests depend on environment variables being defined, an env file can be used to pass these to the coverage container like so.

```
docker run --env-file=.env -e "PHP_MEMORY_LIMIT=100M" -v $(pwd):/src nowait/php:7.0-coverage -qrr /src/path/to/phpunit --coverage-html report/
```
