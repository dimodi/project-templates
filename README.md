# Telerik Blazor Project Templates

This repository provides Visual Studio project templates for [Telerik Blazor apps](https://www.telerik.com/blazor-ui) with some convenient [extras](#extras).

When installed, the templates can be used to create new Blazor apps in Visual Studio or with `dotnet new` CLI commands.

* [Install](#install)
* [Use with Visual Studio](#use-with-visual-studio)
* [Use with the .NET CLI](#use-with-the-net-cli)
* [Extras](#extras)
* [Update or Uninstall](#update-or-uninstall)
* [License](#license)

## Install

1. Close Visual Studio.
1. Download the NuGet package and the shell scripts [from the latest release](https://github.com/dimodi/project-templates/releases) to some folder.
1. Open your Terminal or Shell app and go to the folder from the previous step.
1. Execute the `install.sh` script to install all project templates. On Windows:
    ```sh
    ./install.sh
    ```
    On macOS and Linux:
    ```sh
    sh install.sh
    ```

## Use with Visual Studio

On **Windows**, the new project templates will appear in the `C#`, `Web` and `Blazor` categories in the Create New Project wizard. Make sure to select "All platforms" in the respective dropdown.

On **Mac**, the new project templates will appear in the `Other` &gt; `Custom` category.

When creating a WebAssembly app, make sure to select the server project as a startup project before running.

## Usе with the .NET CLI

1. Open Terminal and go to the desired parent folder of your future app.
1. Execute the `dotnet new` command with the short name of the template and the app name, for example:
    ```sh
    dotnet new tbserver6 -o MyNewAppName
    ```

When creating a WebAssembly app, make sure to select the server project as a startup project before running.

### .NET 8 Interactivity

The .NET 8 Server template (`tbserver8`) sets global `Server` interactivity.

The .NET 8 WebAssembly template (`tbwasm8`) sets global `WebAssembly` interactivity. To create a project with `Auto` interactivity, set `rendermode` to `Auto` in the `dotnet new` command:

```sh
dotnet new tbwasm8 -o MyNewAppName --rendermore Auto
```

## Extras

The project templates are almost identical to the default .NET SDK Blazor project templates. The differences are:

* The projects reference the latest minor .NET version and the [latest Telerik UI for Blazor version](https://www.telerik.com/support/whats-new/blazor-ui/release-history).
* The [Telerik UI for Blazor components](https://docs.telerik.com/blazor-ui/introduction#getting-started) are installed and configured with [SVG icon support](https://docs.telerik.com/blazor-ui/common-features/icons) and the [`Default` theme](https://docs.telerik.com/blazor-ui/styling-and-themes/overview).
* The [Telerik font icon namespace](https://docs.telerik.com/blazor-ui/common-features/icons#icon-namespaces) is added in `_Imports.razor`, but it's commented out. The [Telerik font icon stylesheet](https://docs.telerik.com/blazor-ui/common-features/icons#font-icon-stylesheet) is added in `_Layout.cshtml`, `index.html`, or `App.razor` (depending on the .NET version and hosting model), but is commented out.
* `Program.cs` contains commented code to [increase the maximum file upload size](https://docs.telerik.com/blazor-ui/components/upload/overview#large-file-uploads).
* `Program.cs` in the server apps contains commented code to [increase the maximum SignalR message size](https://docs.telerik.com/blazor-ui/knowledge-base/common-increase-signalr-max-message-size).
* The `SurveyPrompt` Razor component is removed.

## Update or Uninstall

1. To update, follow steps 1 - 3 from the [installation guide](#install).
1. To update or uninstall, execute the `update.sh` or `uninstall.sh` script. On Windows:
    ```sh
    ./update.sh
    ```
    On macOS and Linux:
    ```sh
    sh update.sh
    ```

## License

[Telerik UI for Blazor is a commercial component library](https://www.telerik.com/purchase/license-agreement/blazor-ui) with its own license agreement.

The project templates are subject to [MIT License](LICENSE).
