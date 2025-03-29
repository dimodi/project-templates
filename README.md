# Telerik UI for Blazor Project and Item Templates

This NuGet package provides ASP.NET Core Blazor project and item templates that include the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) component library. The [project templates provide multiple settings](#project-template-features) to configure the Telerik Blazor components during app creation. The [item templates expose settings](#item-templates) to enable various component features.

## Table of Contents

* [Templates](#templates)
* [Install](#install)
* [Use with Visual Studio](#use-with-visual-studio)
* [Use with VS Code](#use-with-vs-code)
* [Use with the .NET CLI](#use-with-the-net-cli)
* [Project template features](#project-template-features)
* [Update](#update)
* [Uninstall](#uninstall)
* [Create your own templates](#create-your-own-templates)
* [License](#license)

## Templates

The package includes the following project and item templates.

### Project Templates

| Template Name | .NET&nbsp;Version | .CLI Short Name |
| --- | --- | --- |
| Telerik Blazor Web App (Server) | .NET 8-9 | `dimodi-blazor-server` |
| Telerik Blazor Web App (WebAssembly or Auto) | .NET 8-9 | `dimodi-blazor-wasmauto` |
| Telerik Blazor WebAssembly Standalone App | .NET 8-9 | `dimodi-blazorwasm` |
| Telerik Blazor Server App | .NET 6-7 | `dimodi-blazorserver` |
| Telerik Blazor WebAssembly App (ASP.NET Core hosted) | .NET 6-7 | `dimodi-blazorwasm-hosted` |

The .NET 6-7 project templates are deprecated and no longer receive new features. These templates are compatible with Telerik UI for Blazor version 8.x, but won't be compatible with version 9.0.

### Item Templates

The item templates produce a runnable `.razor` file that includes a Telerik Blazor component, dummy data, and applicable event handlers.

| Template Name | .CLI Short Name | Component Features |
| --- | --- | --- |
| Telerik Blazor Grid | `dimodi-grid` | CRUD operations, row selection, grouping, two data binding mechanisms |
| Telerik Blazor TreeView | `dimodi-treeview` | Selection, checkboxes, flat or hierarchical data structure |

## Install

1. Close Visual Studio.
1. Open your Terminal or Shell app.
1. Execute the `dotnet new install` command:
    ```sh
    dotnet new install Dimodi.Telerik.Blazor.Templates
    ```

## Use with Visual Studio

On **Windows**, the new project templates will appear in the `C#`, `Web` and `Blazor` categories in the Create New Project wizard. Make sure to select "All platforms" in the respective dropdown.

On **Mac**, the new project templates will appear in the `Other` &gt; `Custom` category. Visual Studio for Mac is unable to run .NET 8 Blazor Web Apps with WebAssembly or Auto render mode if .NET 9 is installed. In this case, [edit and run the app through VS Code](#use-with-vs-code) or another compatible IDE.

When creating a WebAssembly app, make sure to select the server project as a startup project before running.

To [create a new `.razor` file](#create-items) from an item template, [use the .NET CLI](#use-with-the-net-cli).

## Use with VS Code

Install the [**C# Dev Kit** extension](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit).

To create a new app:

1. Go to the Command Palette at the top (`Ctrl` + `Shift` + `P`).
1. Select **Show and Run Commands**.
1. Select **.NET: New Project...**
1. Type a project name and [configure the project template options](#project-template-features).

To [create a new `.razor` file](#create-items) from an item template, [use the .NET CLI](#use-with-the-net-cli).

## Use with the .NET CLI

To see all available project and item templates, execute the `dotnet new list` command with the `--author` option:

```sh
dotnet new list --author="Dimo Dimov"
```

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

### Create Items

1. Open Terminal and go to a folder inside your existing app, for example `Pages` or `Components`.
1. Execute the `dotnet new` command with the short name of the template and the file name, for example:
    ```sh
    dotnet new dimodi-grid -n MyNewGridPаge
    ```
1. The above command will produce a `MyNewGridPаge.razor` file inside the current folder.

## Project Template Features

The project templates are similar to the default .NET SDK Blazor project templates in terms of structure and configuration. The differences are:

* The Blazor Web Apps use a global interactive render mode. This is the easier and recommended way to integrate Telerik UI for Blazor.
* The WebAssembly apps reference the latest minor version of the selected .NET version.
* .NET 8-9 apps use the `https` launch profile by default.
* Visual Studio opens `Home.razor` automatically after the app is created.
* The top bar uses background and border colors from the Telerik theme. This makes the styling consistent in dark mode.
* The `<button>` and `<table>` HTML elements in the default sample pages are replaced with Telerik Button and Grid.
* The `SurveyPrompt` Razor component is removed.

### Telerik UI for Blazor Configuration

The apps reference one of the [latest Telerik UI for Blazor versions](https://www.telerik.com/support/whats-new/blazor-ui/release-history) by default. You can also set the latest version as a wildcard `*`.

The Telerik UI for Blazor NuGet package, namespaces, service, and static assets are [added, according to best practices](https://docs.telerik.com/blazor-ui/getting-started/what-you-need). The Telerik CSS and JS file URLs include a [query string cache buster](https://docs.telerik.com/blazor-ui/knowledge-base/common-browser-cache-buster) to prevent browser caching across version upgrades. The cache buster is missing from the WebAssembly Standalone App template due to dynamic content restrictions in `index.html`.

You can configure some global settings related to the app and the [Telerik UI for Blazor components](https://docs.telerik.com/blazor-ui/introduction#getting-started) during app creation (the default values are in the brackets):

* [Theme](https://docs.telerik.com/blazor-ui/styling-and-themes/overview) (`Default`)
* [Dark theme mode](https://www.telerik.com/blazor-ui/documentation/styling-and-themes/overview#basics) (disabled). Requires CDN.
* [Icon type (SVG icons or Font icons)](https://docs.telerik.com/blazor-ui/common-features/icons) (SVG)
* [CDN support](https://docs.telerik.com/blazor-ui/common-features/cdn) (disabled). WebAssembly Standalone Apps support CDN only with a fixed Telerik UI for Blazor version number. Blazor Web Apps support CDN with both fixed and wildcard (`*`) version.
* [Localization](https://docs.telerik.com/blazor-ui/globalization/localization) in .NET 8-9 apps (disabled)
* [RTL support](https://docs.telerik.com/blazor-ui/globalization/rtl-support) (disabled)
* [File upload controller](https://www.telerik.com/blazor-ui/documentation/components/upload/overview#implement-controller-methods) in the .NET 8-9 Blazor Web App templates (disabled). When added, the [maximum file upload size](https://docs.telerik.com/blazor-ui/components/upload/overview#large-file-uploads) increases to 256 MB in `Programs.cs`.
* [Maximum SignalR message size](https://docs.telerik.com/blazor-ui/knowledge-base/common-increase-signalr-max-message-size) (32 KB). This option works in Visual Studio on Windows and through the .NET CLI. [The setting doesn't appear in VS Code](https://github.com/microsoft/vscode-dotnettools/issues/1659) and in Visual Studio for Mac. In these cases, edit `Program.cs` after creating the app.

### Docker Support

The .NET 8-9 app templates provide optional Docker setup, including `Dockerfile`, `.dockerignore`, and a Docker launch profile.

## Update

Execute the `dotnet new update` command:

```sh
dotnet new update Dimodi.Telerik.Blazor.Templates
```

## Uninstall

To remove the currently installed package, execute the `dotnet new uninstall` command:

```sh
dotnet new uninstall Dimodi.Telerik.Blazor.Templates
```

## Create Your Own Templates

If you wish to experiment with your own project or item templates, then start from here:

* https://learn.microsoft.com/en-us/dotnet/core/tools/custom-templates
* https://github.com/dotnet/templating/
* https://github.com/dotnet/aspnetcore/tree/main/src/ProjectTemplates
* https://github.com/sayedihashimi/template-sample

Prepare for reading incomplete and unofficial documentation, and achieving your goals by trial and error.

## License

[Telerik UI for Blazor is a commercial component library](https://www.telerik.com/purchase/license-agreement/blazor-ui) with its own license agreement.

The project and item templates are subject to [MIT License](LICENSE).
