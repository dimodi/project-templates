# Recommended documentation about Docker, Dockerfile, and Telerik app deployment:
# Microsoft article: https://aka.ms/customizecontainer
# Dockerfile reference: https://docs.docker.com/reference/dockerfile/
# Telerik NuGet keys: https://www.telerik.com/blazor-ui/documentation/deployment/nuget-keys
# Telerik license keys: https://www.telerik.com/blazor-ui/documentation/deployment/ci-cd-license-key
# 
# This Dockerfile depends on two secrets that must be passed to the docker build command:
# - Telerik license key (only for Telerik UI for Blazor versions >= 8.0)
# - Telerik NuGet API key
#
# Run the build command from the Dockerfile's parent folder, where the .sln file is. Suggested build command:
#
# docker build --secret id=telerik-license-key,src=/path/to/telerik-license.txt --secret id=telerik-nuget-key,src=/path/to/telerik-nuget.txt -t telerikblazorwasm:v1 -f TelerikBlazorWasm/Dockerfile .
#
# Suggested run command:
#
# docker run -p 8080:8080 telerikblazorwasm:v1
#
# Browse application at:
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
COPY TelerikBlazorWasm/TelerikBlazorWasm.csproj TelerikBlazorWasm/
COPY TelerikBlazorWasm.Client/TelerikBlazorWasm.Client.csproj TelerikBlazorWasm.Client/
COPY TelerikBlazorWasm/NuGet_Deploy.Config NuGet.Config
RUN --mount=type=secret,id=telerik-nuget-key \
    dotnet nuget update source Telerik --username="api-key" --password="$(cat /run/secrets/telerik-nuget-key)" --store-password-in-clear-text --configfile ./NuGet.Config
RUN dotnet restore TelerikBlazorWasm/TelerikBlazorWasm.csproj
COPY . .
WORKDIR /src/TelerikBlazorWasm
RUN --mount=type=secret,id=telerik-license-key,env=TELERIK_LICENSE \
    dotnet build TelerikBlazorWasm.csproj -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN --mount=type=secret,id=telerik-license-key,env=TELERIK_LICENSE \
    dotnet publish TelerikBlazorWasm.csproj -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TelerikBlazorWasm.dll"]