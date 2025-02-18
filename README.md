# Telerik Blazor Project and Item Templates

This NuGet package provides Visual Studio project and item templates for [Telerik Blazor apps and component scaffolders](https://www.telerik.com/blazor-ui) with some convenient [extras](#extras).

## Table of Contents

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
* Grid with optional CRUD operations, row selection, grouping, and two data binding mechanisms
* TreeView with optional selection, checkboxes, and flat or hierarchical data structure

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

On **Mac**, the new project templates will appear in the `Other` &gt; `Custom` category. Visual Studio for Mac is unable to run .NET 8 Blazor Web Apps with WebAssembly or Auto render mode if .NET 9 is installed. In this case, you can edit the app code in Visual Studio, but run the app through the .NET CLI. Or, edit and run the app through VS Code.

When creating a WebAssembly app, make sure to select the server project as a startup project before running.

## Use with the .NET CLI

To see all available project and item templates, execute the `dotnet new list` command with the `--author` option:

```sh
dotnet new list --author="Dimo Dimov"
```

The project templates use similar short names to the respective Microsoft counterparts, but with a `dimodi` prefix and sometimes a suffix, for example:

| Template Descrption | Microsoft Template Short Name | Dimodi Template Short Name |
| --- | --- | --- |
| .NET 8-9 Blazor Web App with Server render mode | `blazor` | `dimodi-blazor-server` |
| .NET 8-9 Blazor Web App with WebAssembly or Auto render mode | `blazor` | `dimodi-blazor-wasmauto` |
| .NET 8-9 Blazor WebAssembly Standalone App | `blazorwasm` | `dimodi-blazorwasm` |
| .NET 6-7 Blazor Server App | `blazorserver` | `dimodi-blazorserver` |
| .NET 6-7 Blazor WebAssembly App (ASP.NET Core hosted) | `blazorwasm` | `dimodi-blazorwasm-hosted` |

For help on a specific project or item template, execute the `dotnet new` command with the `--help` option, for example:

```sh
dotnet new dimodi-grid --help
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

* The apps reference one of the [latest Telerik UI for Blazor versions](https://www.telerik.com/support/whats-new/blazor-ui/release-history) or the latest version as a wildcard `*`.
* The WebAssembly apps reference the latest minor .NET version.
* The Telerik UI for Blazor NuGet package, namespaces, service, and static assets are [added, according to best practices](https://docs.telerik.com/blazor-ui/getting-started/what-you-need).
* You can configure some settings related to the app and the [Telerik UI for Blazor components](https://docs.telerik.com/blazor-ui/introduction#getting-started) during app creation (see the default values in the brackets):
    * [Theme](https://docs.telerik.com/blazor-ui/styling-and-themes/overview) (`Default`)
    * [Dark theme swatch](https://www.telerik.com/blazor-ui/documentation/styling-and-themes/overview#basics) (disabled)
    * [Icon type (SVG icons or Font icons)](https://docs.telerik.com/blazor-ui/common-features/icons) (SVG)
    * [CDN support](https://docs.telerik.com/blazor-ui/common-features/cdn) (disabled)
    * [Localization](https://docs.telerik.com/blazor-ui/globalization/localization) in .NET 8 and .NET 9 apps (disabled)
    * [RTL support](https://docs.telerik.com/blazor-ui/globalization/rtl-support) (disabled)
    * [Maximum file upload size](https://docs.telerik.com/blazor-ui/components/upload/overview#large-file-uploads) (128 MB in FormOptions and 28 MB in Kestrel) *
    * [Maximum SignalR message size](https://docs.telerik.com/blazor-ui/knowledge-base/common-increase-signalr-max-message-size) (32 KB) *
* The [Telerik CSS and JS files are loaded with a query string cache buster](https://docs.telerik.com/blazor-ui/knowledge-base/common-browser-cache-buster) to prevent browser caching across version upgrades. This feature is missing from the WebAssembly Standalone App template due to dynamic content usage restrictions in `index.html`.
* .NET 8 and .NET 9 apps use the `https` launch profile by default.
* The top bar uses background and border colors from the Telerik theme. This makes the styling consistent in dark mode.
* The `SurveyPrompt` Razor component is removed.
* The `<button>` and `<table>` HTML elements in the default sample pages are replaced with Telerik Button and Grid.

\* The options to change the max file upload size and the max SignalR message size work in Visual Studio on Windows and through the .NET CLI. [They don't appear in VS Code](https://github.com/microsoft/vscode-dotnettools/issues/1659) and in Visual Studio for Mac. In these cases, edit `Program.cs` after creating the app.

## Update

### Update From nuget.org

Execute the `dotnet new update` command:

```sh
dotnet new update Dimodi.Telerik.Blazor.Templates
```

### Update from GitHub

1. [Uninstall the package](#uninstall).
1. Repeat the [GitHub installation steps](#install-from-github).

## Uninstall

To remove the currently installed package, execute the `dotnet new uninstall` command:

```sh
dotnet new uninstall Dimodi.Telerik.Blazor.Templates
```

## License

[Telerik UI for Blazor is a commercial component library](https://www.telerik.com/purchase/license-agreement/blazor-ui) with its own license agreement.

The project templates are subject to [MIT License](LICENSE).
