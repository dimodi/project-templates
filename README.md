# Telerik Blazor Project and Item Templates

This repository provides Visual Studio templates for [Telerik Blazor apps and component scaffolders](https://www.telerik.com/blazor-ui) with some convenient [extras](#extras).

* [Templates](#templates)
* [Install](#install)
* [Use with Visual Studio](#use-with-visual-studio)
* [Use with the .NET CLI](#use-with-the-net-cli)
* [Extras](#extras)
* [Update](#update)
* [Uninstall](#uninstall)
* [License](#license)

## Templates

* .NET 8-9 Blazor Web App with global interactive Server render mode
* .NET 8-9 Blazor Web App with global interactive WebAssembly or Auto render mode
* .NET 8-9 Blazor WebAssembly Standalone App
* .NET 6-7 Blazor Server App
* .NET 6-7 Blazor WebAssembly App (ASP.NET Core hosted)
* Grid with optional row selection, grouping, and two data binding mechanisms
* Editable Grid with CRUD operations

## Install

### Install From nuget.org

1. Close Visual Studio.
1. Open your Terminal or Shell app.
1. Execute the `dotnet new install` command:
    ```sh
    dotnet new install Dimodi.Telerik.Blazor.Templates
    ```

### Install From GitHub

1. Close Visual Studio.
1. Download the NuGet package from the [latest release](https://github.com/dimodi/project-templates/releases) to some folder.
1. Open your Terminal or Shell app and go to the folder from the previous step.
1. Execute the `dotnet new install` command:
    ```sh
    dotnet new install Dimodi.Telerik.Blazor.Templates.*.nupkg
    ```

## Use with Visual Studio

On **Windows**, the new project templates will appear in the `C#`, `Web` and `Blazor` categories in the Create New Project wizard. Make sure to select "All platforms" in the respective dropdown.

On **Mac**, the new project templates will appear in the `Other` &gt; `Custom` category.

When creating a WebAssembly app, make sure to select the server project as a startup project before running.

## Use with the .NET CLI

To see all available project and item templates, execute the `dotnet new list` command with the `--author` option:

```sh
dotnet new list --author="Dimo Dimov"
```

The project templates use similar short names to the respective Microsoft counterparts, but with a `dimodi` prefix and sometimes a suffix, for example:

| Template Descrption | Microsoft Template Short Name | Dimodi Template Short Name |
| --- | --- | --- |
| .NET 8-9 Blazor Server App | `blazor` | `dimodi-blazor-server` |
| .NET 8-9 Blazor Web App with WebAssembly or Auto render mode | `blazor` | `dimodi-blazor-wasmauto` |
| .NET 8-9 Blazor WebAssembly Standalone App | `blazorwasm` | `dimodi-blazorwasm` |
| .NET 6-7 Blazor Server App | `blazorserver` | `dimodi-blazorserver` |
| .NET 6-7 Blazor WebAssembly App (ASP.NET Core hosted) | `blazorwasm` | `dimodi-blazorwasm-hosted` |

For help on a specific project or item template, execute the `dotnet new` command with the `--help` option, for example:

```sh
dotnet new dimodi-gridedit --help
```

### Create Projects

1. Open Terminal and go to the desired parent folder of your future app.
1. Execute the `dotnet new` command with the short name of the template and the app name, for example:
    ```sh
    dotnet new dimodi-blazor-server -o MyNewAppName
    ```

When creating a WebAssembly app, make sure to select the server project as a startup project before running.

### Interactive Render Mode

The Blazor Web App (Server) template (`dimodi-blazor-server`) sets global `Server` interactivity location.

The Blazor Web App (WebAssembly / Auto) template (`dimodi-blazor-wasmauto`) sets global `WebAssembly` or `Auto` interactivity. To create a project with `Auto` interactivity, set `rendermode` to `Auto` in the `dotnet new` command:

```sh
dotnet new dimodi-blazor-wasmauto -o MyNewAppName --rendermode Auto
```

### Create Items

1. Open Terminal and go to a folder inside your existing app, for example `Pages` or `Components`.
1. Execute the `dotnet new` command with the short name of the template and the file name, for example:
    ```sh
    dotnet new dimodi-grid -n MyNewGridPаge
    ```
1. The above command will produce a `MyNewGridPаge.razor` file inside the current folder.

## Extras

The **item** templates provide declarations of Telerik Blazor components together with dummy data, which includes different data types.

The **project** templates are similar to the default .NET SDK Blazor project templates. The differences are:

* The apps reference the [latest Telerik UI for Blazor version](https://www.telerik.com/support/whats-new/blazor-ui/release-history). The WebAssembly apps reference the latest minor .NET version.
* The Telerik UI for Blazor NuGet package, namespaces, service, and static assets are [added, according to best practices](https://docs.telerik.com/blazor-ui/getting-started/what-you-need).
* You can configure some settings related to the [Telerik UI for Blazor components](https://docs.telerik.com/blazor-ui/introduction#getting-started) during app creation (see the default values in the brackets):
    * [Theme](https://docs.telerik.com/blazor-ui/styling-and-themes/overview) (`Default`)
    * [Icon type (SVG icons or Font icons)](https://docs.telerik.com/blazor-ui/common-features/icons) (SVG)
    * [CDN support](https://docs.telerik.com/blazor-ui/common-features/cdn) (disabled)
    * [RTL support](https://docs.telerik.com/blazor-ui/globalization/rtl-support) (disabled)
* The [Telerik CSS and JS files are loaded with a query string cache buster](https://docs.telerik.com/blazor-ui/knowledge-base/common-browser-cache-buster) to prevent browser caching across version upgrades. This feature is missing from the WebAssembly Standalone App template due to dynamic content usage restrictions in `index.html`.
* `Program.cs` contains commented code to [increase the maximum file upload size](https://docs.telerik.com/blazor-ui/components/upload/overview#large-file-uploads).
* `Program.cs` in server apps contains commented code to [increase the maximum SignalR message size](https://docs.telerik.com/blazor-ui/knowledge-base/common-increase-signalr-max-message-size).
* .NET 8 and .NET 9 apps use the `https` launch profile by default.
* The `SurveyPrompt` Razor component is removed.
* The `<button>` and `<table>` HTML elements in the default sample pages are replaced with Telerik Button and Grid.

## Update

### Update From nuget.org

Execute the `dotnet new update` command:

```sh
dotnet new update Dimodi.Telerik.Blazor.Templates
```

### Update from GitHub

1. Remove the currently installed package:
    ```sh
    dotnet new uninstall Dimodi.Telerik.Blazor.Templates
    ```
1. Repeat the [GitHub installation steps](#install-from-github).

## Uninstall

To remove the currently installed package, execute the `dotnet new uninstall` command:

```sh
dotnet new uninstall Dimodi.Telerik.Blazor.Templates
```

## License

[Telerik UI for Blazor is a commercial component library](https://www.telerik.com/purchase/license-agreement/blazor-ui) with its own license agreement.

The project templates are subject to [MIT License](LICENSE).
