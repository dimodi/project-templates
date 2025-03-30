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
# 2. Run the docker build command from the folder that contains the solution .sln file. Specify the Dockerfile location from there.
# 3. Verify the paths in the build stage, as they depend on the application structure. The source paths in the COPY commands must be relative to the folder from which you execute docker build.

# SUGGESTED BUILD COMMAND
#
//#if (host-identifier == "csharpdevkit" || create-solution-directory)
# docker build --secret id=telerik-license-key,src=/path/to/telerik-license.txt --secret id=telerik-nuget-key,src=/path/to/telerik-nuget.txt -t telerikblazorwasm:v1 -f TelerikBlazorWasm/TelerikBlazorWasm/Dockerfile .
//#else
# docker build --secret id=telerik-license-key,src=/path/to/telerik-license.txt --secret id=telerik-nuget-key,src=/path/to/telerik-nuget.txt -t telerikblazorwasm:v1 -f TelerikBlazorWasm/Dockerfile .
//#endif
#
# SUGGESTED RUN COMMAND
#
# docker run -p 8080:8080 telerikblazorwasm:v1
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
//#if (host-identifier == "csharpdevkit" || create-solution-directory)
COPY TelerikBlazorWasm/TelerikBlazorWasm/TelerikBlazorWasm.csproj TelerikBlazorWasm/TelerikBlazorWasm/
COPY TelerikBlazorWasm/TelerikBlazorWasm.Client/TelerikBlazorWasm.Client.csproj TelerikBlazorWasm/TelerikBlazorWasm.Client/
COPY TelerikBlazorWasm/TelerikBlazorWasm/NuGet_Deploy.Config TelerikBlazorWasm/NuGet.Config
//#else
COPY TelerikBlazorWasm/TelerikBlazorWasm.csproj TelerikBlazorWasm/
COPY TelerikBlazorWasm.Client/TelerikBlazorWasm.Client.csproj TelerikBlazorWasm.Client/
COPY TelerikBlazorWasm/NuGet_Deploy.Config NuGet.Config
//#endif
RUN --mount=type=secret,id=telerik-nuget-key \
//#if (host-identifier == "csharpdevkit" || create-solution-directory)
    dotnet nuget update source Telerik --username="api-key" --password="$(cat /run/secrets/telerik-nuget-key)" --store-password-in-clear-text --configfile TelerikBlazorWasm/NuGet.Config
RUN dotnet restore TelerikBlazorWasm/TelerikBlazorWasm/TelerikBlazorWasm.csproj
//#else
    dotnet nuget update source Telerik --username="api-key" --password="$(cat /run/secrets/telerik-nuget-key)" --store-password-in-clear-text --configfile NuGet.Config
RUN dotnet restore TelerikBlazorWasm/TelerikBlazorWasm.csproj
//#endif
COPY . .
//#if (host-identifier == "csharpdevkit" || create-solution-directory)
WORKDIR /src/TelerikBlazorWasm/TelerikBlazorWasm
//#else
WORKDIR /src/TelerikBlazorWasm
//#endif
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