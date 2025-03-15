# Recommended documentation about Docker, Dockerfile, and Telerik app deployment.
# By Microsoft: https://aka.ms/customizecontainer
# Dockerfile reference: https://docs.docker.com/reference/dockerfile/
# Telerik NuGet keys: https://www.telerik.com/blazor-ui/documentation/deployment/nuget-keys
# Telerik license keys: https://www.telerik.com/blazor-ui/documentation/deployment/ci-cd-license-key
# 
# This Dockerfile depends on two secrets that must be passed to the docker build command:
# - Telerik license key (only for Telerik UI for Blazor versions >= 8.0)
# - Telerik NuGet API key
#
# Suggested build command:
#
# docker build --secret id=telerik-license-key,src=/path/to/telerik-license.txt --secret id=telerik-nuget-key,src=/path/to/telerik-nuget.txt -t TelerikBlazorServer:v1 .
#
# Suggested run command:
#
# docker run -p 8080:8080 TelerikBlazorServer:v1
#
# Browse application at:
#
# http://localhost:8080
#

FROM mcr.microsoft.com/dotnet/core/aspnet:{TVAR_NETNUMBER}.0 AS base
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/core/sdk:{TVAR_NETNUMBER}.0 AS build
WORKDIR /src
COPY TelerikBlazorServer.csproj .
COPY NuGet_Deploy.Config ./NuGet.Config
RUN --mount=type=secret,id=telerik-nuget-key \
    dotnet nuget update source Telerik --username="api-key" --password="$(cat /run/secrets/telerik-nuget-key)" --store-password-in-clear-text --configfile ./NuGet.Config
RUN dotnet restore TelerikBlazorServer.csproj
COPY . .
# WORKDIR /src/TelerikBlazorServer
RUN --mount=type=secret,id=telerik-license-key,env=TELERIK_LICENSE \
    dotnet build TelerikBlazorServer.csproj -c Release -o /app

FROM build AS publish
RUN --mount=type=secret,id=telerik-license-key,env=TELERIK_LICENSE \
    dotnet publish TelerikBlazorServer.csproj -c Release -o /app /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "TelerikBlazorServer.dll"]