
## Instructions for running a linux script on  Docker  - to get the latest version of a nuget package from ubuntu. 

Let me know if you need any further modifications! 😊

```shell
cd NugetGetPackageCurrentVersion
docker rmi nuget-version-fetcher
docker build -t nuget-version-fetcher .
docker run --rm nuget-version-fetcher
```
