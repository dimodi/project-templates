# RECOMMENDED DOCUMENTATION About Docker, Dockerfile, and Telerik App Deployment
#
# Microsoft article: https://aka.ms/customizecontainer
# Dockerfile reference: https://docs.docker.com/reference/dockerfile/
# Telerik NuGet keys: https://www.telerik.com/blazor-ui/documentation/deployment/nuget-keys
# Telerik license keys: https://www.telerik.com/blazor-ui/documentation/deployment/ci-cd-license-key
# 
# PREREQUISITES TO DEPLOY TO A DOCKER CONTAINER
#
# 1. This Dockerfile depends on two secrets that must be passed to the docker build command. The sample commands below assume that you will provide the secrets from files. Just set their paths.
#     - Telerik license key (only for Telerik UI for Blazor versions >= 8.0)
#     - Telerik NuGet API key
# 2. Run the docker build command from the folder that contains the Dockerfile.
#
# SUGGESTED BUILD COMMAND
#
# docker build --secret id=telerik-license-key,src=/path/to/telerik-license.txt --secret id=telerik-nuget-key,src=/path/to/telerik-nuget.txt -t telerikblazorserver:v1 .
#
# SUGGESTED RUN COMMAND
#
# docker run -p 8080:8080 telerikblazorserver:v1
#
# BROWSE AT
#
# http://localhost:8080
#

FROM mcr.microsoft.com/dotnet/aspnet:{TVAR_NETNUMBER}.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:{TVAR_NETNUMBER}.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY TelerikBlazorServer.csproj .
COPY NuGet_Deploy.Config NuGet.Config
RUN --mount=type=secret,id=telerik-nuget-key \
    dotnet nuget update source Telerik --username="api-key" --password="$(cat /run/secrets/telerik-nuget-key)" --store-password-in-clear-text --configfile NuGet.Config
RUN dotnet restore TelerikBlazorServer.csproj
COPY . .
RUN --mount=type=secret,id=telerik-license-key,env=TELERIK_LICENSE \
    dotnet build TelerikBlazorServer.csproj -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN --mount=type=secret,id=telerik-license-key,env=TELERIK_LICENSE \
    dotnet publish TelerikBlazorServer.csproj -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TelerikBlazorServer.dll"]