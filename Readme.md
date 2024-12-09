
## Instructions for running a linux script on a Docker container to get the latest version of a nuget package from ubuntu. 

Let me know if you need any further modifications! 😊

```shell
docker rmi nuget-version-fetcher
docker build -t nuget-version-fetcher .
docker run --rm nuget-version-fetcher
```
