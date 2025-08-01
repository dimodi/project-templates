# Telerik UI for Blazor Project and Item Templates

This NuGet package provides ASP.NET Core Blazor project and item templates that include the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) component library. The [project templates provide multiple settings](#project-template-features) to configure the Telerik Blazor components during app creation. The [item templates expose settings](#item-templates) to enable various Telerik component features.

## Table of Contents

* [Templates](#templates)
    * [Project Templates](#project-templates)
    * [Item Templates](#item-templates)
* [Install](#install)
* [Use with Visual Studio](#use-with-visual-studio)
* [Use with VS Code](#use-with-vs-code)
* [Use with the .NET CLI](#use-with-the-net-cli)
    * [Create Projects](#create-projects)
    * [Create Items](#create-items)
* [Project template features](#project-template-features)
    * [Telerik UI for Blazor Configuration](#telerik-ui-for-blazor-configuration)
    * [Docker Support](#docker-support)
* [Update](#update)
* [Uninstall](#uninstall)
* [Create your own templates](#create-your-own-templates)
* [License](#license)

## Templates

The package includes the following project and item templates.

### Project Templates

| Template Name | .CLI Short Name |
| --- | --- |
| Telerik Blazor Web App | `dimodi-blazor` |
| Telerik Blazor WebAssembly Standalone App | `dimodi-blazorwasm` |

The last package version that includes .NET 6 and 7 project template is **5.4.0**.

### Item Templates

The item templates produce a runnable `.razor` file that includes a Telerik Blazor component, dummy data, and applicable event handlers.

| Template Name | .CLI Short Name | Component Features |
| --- | --- | --- |
| Telerik Blazor Grid | `dimodi-grid` | CRUD operations, row selection, grouping, `Data` or `OnRead` data binding |
| Telerik Blazor TreeView | `dimodi-treeview` | Selection, checkboxes, flat or hierarchical data structure |
| Telerik Blazor Upload | `dimodi-upload` | Allowed extensions, min/max file size, multiple uploads, chunk uploads |

## Install

1. Close Visual Studio.
1. Open your Terminal or Shell app.
1. Execute the `dotnet new install` command:
    ```sh
    dotnet new install Dimodi.Telerik.Blazor.Templates
    ```

## Use with Visual Studio

On **Windows**, the new project templates will appear in the `C#`, `Web` and `Blazor` categories in the **Create New Project** wizard. Make sure to select "**All platforms**" in the respective dropdown.

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
    dotnet new dimodi-blazor -o MyNewAppName
    ```

### Create Items

1. Open Terminal and go to a folder inside your existing app, for example `Pages` or `Components`.
1. Execute the `dotnet new` command with the short name of the template and the file name, for example:
    ```sh
    dotnet new dimodi-grid -n MyNewGridPаge
    ```
1. The above command will produce a `MyNewGridPаge.razor` file inside the current folder.

## Project Template Features

The project templates are similar to the default .NET SDK Blazor project templates in terms of structure and configuration. The differences are:

* The Blazor Web Apps use a **Global** interactivity location, i.e. [interactive render mode for the entire app](https://learn.microsoft.com/en-us/aspnet/core/blazor/components/render-modes). This is the [easier and recommended way to integrate Telerik UI for Blazor](https://www.telerik.com/blazor-ui/documentation/getting-started/web-app#interactive-render-mode).
* The WebAssembly apps reference the latest minor version of the selected .NET version through a wildcard.
* The apps use the `https` launch profile by default.
* Visual Studio opens `Home.razor` automatically after the app is created.
* The top bar uses background and border colors from the Telerik theme. This makes the styling consistent in dark mode.
* The `<button>` and `<table>` HTML elements in the default sample pages are replaced with Telerik Button and Grid.

### Telerik UI for Blazor Configuration

* The Telerik UI for Blazor NuGet package, namespaces, service, and static assets are [added, according to best practices](https://docs.telerik.com/blazor-ui/getting-started/what-you-need). The [query string cache buster for the Telerik CSS and JavaScript files](https://docs.telerik.com/blazor-ui/knowledge-base/common-browser-cache-buster) is missing from the WebAssembly Standalone App template due to dynamic content restrictions in `index.html`.
* The Web App templates set [`PrivateAssets="none"` to the Telerik UI for Blazor NuGet package reference](https://www.telerik.com/blazor-ui/documentation/installation/license-key#using-telerik-packages-in-referenced-projects) when using WebAssembly or Auto render mode. This avoids license warnings on app startup.

The project templates provide options to configure the app and the [Telerik UI for Blazor components](https://docs.telerik.com/blazor-ui/introduction#getting-started) during app creation:

| Template Option | Default Value | Description |
| --- | --- | --- |
| [Components version](https://www.telerik.com/support/whats-new/blazor-ui/release-history) | latest | The project templates provide a selection of recent Telerik UI for Blazor versions. The default value is the latest semantic version, but the templates also allow you to set the latest version as a wildcard `*`. |
| [Theme](https://docs.telerik.com/blazor-ui/styling-and-themes/overview) | Default | The Telerik UI for Blazor NuGet package includes a few CSS files that define different styling of the Telerik Blazor components. |
| [Dark mode](https://www.telerik.com/blazor-ui/documentation/styling-and-themes/overview#basics) | disabled | Dark mode requires **CDN** to be enabled, because the dark theme variations (known as swatches) are not included as static assets in the Telerik UI for Blazor NuGet package. |
| [CDN support](https://docs.telerik.com/blazor-ui/common-features/cdn) | disabled | Load the Telerik theme and JavaScript file from CDN instead of the NuGet package assets. WebAssembly Standalone Apps support CDN only with a fixed Telerik UI for Blazor version number. Blazor Web Apps support CDN with both fixed and wildcard version `*`. |
| [Icon type](https://docs.telerik.com/blazor-ui/common-features/icons) | SVG | Telerik Blazor components can render SVG icons or font icons. |
| [Localization](https://docs.telerik.com/blazor-ui/globalization/localization) | disabled | Adds both .NET and Telerik localization. |
| [RTL support](https://docs.telerik.com/blazor-ui/globalization/rtl-support) | disabled |  |
| [File upload controller](https://www.telerik.com/blazor-ui/documentation/components/upload/overview#implement-controller-methods) | disabled | When added, the [maximum file upload size](https://docs.telerik.com/blazor-ui/components/upload/overview#large-file-uploads) increases to 256 MB in `Programs.cs`. The controller class provides two save methods - one for regular uploads and one for [chunk uploads](https://www.telerik.com/blazor-ui/documentation/components/upload/chunk-upload). |
| [Maximum SignalR message size](https://docs.telerik.com/blazor-ui/knowledge-base/common-increase-signalr-max-message-size) | 32 KB | This option works in Visual Studio on Windows and through the .NET CLI. [The setting doesn't appear in VS Code](https://github.com/microsoft/vscode-dotnettools/issues/1659) and in Visual Studio for Mac. In these cases, edit `Program.cs` after creating the app. |
| [Telerik Document Processing Integration](https://www.telerik.com/blazor-ui/documentation/integrations/document-processing-libraries) | disabled | Some [Grid](https://www.telerik.com/blazor-ui/documentation/knowledge-base/grid-custom-cell-formatting-with-radspreadprocessing), [Editor](https://www.telerik.com/blazor-ui/documentation/components/editor/import-export) or [Spreadsheet](https://www.telerik.com/blazor-ui/documentation/knowledge-base/spreadsheet-get-cell-values) scenarios may require working with CSV, DOCX, HTML, PDF and XLXS files. This option references the required NuGet packages from the Telerik Document Processing library. |

### Docker Support

The project templates provide an optional Docker setup, including `Dockerfile`, `.dockerignore`, and a Docker launch profile. The `Dockerfile` sets up the Telerik NuGet package source in the container.

The `Dockerfile` contains additional documentation and tips.

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
