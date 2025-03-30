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
//#if (UseWebAssembly)
# 2. Run the docker build command from the folder that contains the solution .sln file. Specify the Dockerfile location from there.
# 3. Verify the paths in the build stage, as they depend on the application structure. The source paths in the COPY commands must be relative to the folder from which you execute docker build.
//#else
# 2. Run the docker build command from the folder that contains the Dockerfile.
//#endif

# SUGGESTED BUILD COMMAND
#
//#if (HostIdentifier == "csharpdevkit" || CreateSolutionDirectory)
# docker build --secret id=telerik-license-key,src=/path/to/telerik-license.txt --secret id=telerik-nuget-key,src=/path/to/telerik-nuget.txt -t telerikblazorwebapp:v1 -f TelerikBlazorWebApp/TelerikBlazorWebApp/Dockerfile .
//#else
# docker build --secret id=telerik-license-key,src=/path/to/telerik-license.txt --secret id=telerik-nuget-key,src=/path/to/telerik-nuget.txt -t telerikblazorwebapp:v1 -f TelerikBlazorWebApp/Dockerfile .
//#endif
#
# SUGGESTED RUN COMMAND
#
# docker run -p 8080:8080 telerikblazorwebapp:v1
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
//#if (HostIdentifier == "csharpdevkit" || CreateSolutionDirectory)
COPY TelerikBlazorWebApp/TelerikBlazorWebApp/TelerikBlazorWebApp.csproj TelerikBlazorWebApp/TelerikBlazorWebApp/
//#if (UseWebAssembly)
COPY TelerikBlazorWebApp/TelerikBlazorWebApp.Client/TelerikBlazorWebApp.Client.csproj TelerikBlazorWebApp/TelerikBlazorWebApp.Client/
//#endif
COPY TelerikBlazorWebApp/TelerikBlazorWebApp/NuGet_Deploy.Config TelerikBlazorWebApp/NuGet.Config
//#else
COPY TelerikBlazorWebApp/TelerikBlazorWebApp.csproj TelerikBlazorWebApp/
//#if (UseWebAssembly)
COPY TelerikBlazorWebApp.Client/TelerikBlazorWebApp.Client.csproj TelerikBlazorWebApp.Client/
//#endif
COPY TelerikBlazorWebApp/NuGet_Deploy.Config NuGet.Config
//#endif
RUN --mount=type=secret,id=telerik-nuget-key \
//#if (HostIdentifier == "csharpdevkit" || CreateSolutionDirectory)
    dotnet nuget update source Telerik --username="api-key" --password="$(cat /run/secrets/telerik-nuget-key)" --store-password-in-clear-text --configfile TelerikBlazorWebApp/NuGet.Config
RUN dotnet restore TelerikBlazorWebApp/TelerikBlazorWebApp/TelerikBlazorWebApp.csproj
//#else
    dotnet nuget update source Telerik --username="api-key" --password="$(cat /run/secrets/telerik-nuget-key)" --store-password-in-clear-text --configfile NuGet.Config
RUN dotnet restore TelerikBlazorWebApp/TelerikBlazorWebApp.csproj
//#endif
COPY . .
//#if (HostIdentifier == "csharpdevkit" || CreateSolutionDirectory)
WORKDIR /src/TelerikBlazorWebApp/TelerikBlazorWebApp
//#else
WORKDIR /src/TelerikBlazorWebApp
//#endif
RUN --mount=type=secret,id=telerik-license-key,env=TELERIK_LICENSE \
    dotnet build TelerikBlazorWebApp.csproj -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN --mount=type=secret,id=telerik-license-key,env=TELERIK_LICENSE \
    dotnet publish TelerikBlazorWebApp.csproj -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "TelerikBlazorWebApp.dll"]