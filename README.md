# Telerik Blazor Project Templates

This repository provides Visual Studio project templates for [Telerik Blazor apps](https://www.telerik.com/blazor-ui) with some convenient [extras](#extras).

When installed, the templates can be used to create new Blazor apps in Visual Studio or with `dotnet new` CLI commands.

* [Installation](#installation)
* [Usage with Visual Studio](#usage-with-visual-studio)
* [Usage with the .NET CLI](#usage-with-the-net-cli)
* [Extras](#extras)
* [Update]
* [License](#license)

## Installation

1. Close Visual Studio.
1. Open your favorite Terminal app.
1. Clone the repository and go into the repository root folder (`/project-templates/`).
1. Execute the `install.sh` script to install all project templates.
    ```sh
    sh install.sh
    ```
    Alternatively, use the `dotnet new install` command to install only the desired project template(s). The command should point to the folder, which holds the template, for example:
    ```sh
    dotnet new install Net6/TelerikBlazorServer
    ```
1. Execute `dotnet new list` to verify the desired project templates are installed. The command output should include:

<pre>
Template Name                       Short Name       Language    Tags
----------------------------------  ---------------  ----------  -----------------------
...
Telerik Blazor Server .NET 6        tbserver6        [C#]        Web/Blazor
Telerik Blazor Server .NET 8        tbserver8        [C#]        Web/Blazor
Telerik Blazor WebAssembly .NET 6   tbwasm6          [C#]        Web/Blazor/WebAssembly
...
</pre>

## Usage with Visual Studio

On **Windows**, the new project templates will appear in the `C#`, `Web` and `Blazor` categories in the Create New Project wizard. Make sure to select "All platforms" in the respective dropdown.

On **Mac**, the new project templates will appear in the `Other` &gt; `Custom` category.

## Usage with the .NET CLI

1. Create a new empty folder.
1. Go to that folder in a Terminal app.
1. To create a new Telerik Blazor app, use the short name of the template with the `dotnet new` command, for example
    ```sh
    dotnet new tbserver6 -n MyNewAppName
    ```

## Extras

The project templates are almost identical to the default .NET 6 Blazor Server and WebAssembly (hosted) project templates. The differences are:

* The projects reference the latest minor .NET version and the [latest Telerik UI for Blazor version](https://www.telerik.com/support/whats-new/blazor-ui/release-history).
* The [Telerik UI for Blazor components](https://docs.telerik.com/blazor-ui/introduction#getting-started) are installed and configured with [SVG icon support](https://docs.telerik.com/blazor-ui/common-features/icons) and the [`Default` theme](https://docs.telerik.com/blazor-ui/styling-and-themes/overview).
* The [Telerik font icon namespace](https://docs.telerik.com/blazor-ui/common-features/icons#icon-namespaces) is added in `_Imports.razor`, but it's commented out. The [Telerik font icon stylesheet](https://docs.telerik.com/blazor-ui/common-features/icons#font-icon-stylesheet) is added in `_Layout.cshtml` and `index.html`, but is commented out.
* `Program.cs` in both apps contains commented code to [increase the maximum file upload size](https://docs.telerik.com/blazor-ui/components/upload/overview#large-file-uploads).
* `Program.cs` in the Blazor Server app contains commented code to [increase the maximum SignalR message size](https://docs.telerik.com/blazor-ui/knowledge-base/common-increase-signalr-max-message-size).
* The `SurveyPrompt` Razor component is removed.

## Update or Uninstall

1. Close Visual Studio.
1. Open Terminal and go to the repository root folder.
1. Execute the `update.sh` or `uninstall.sh` scripts
    ```sh
    sh update.sh
    ```
    Alternatively, use the `dotnet new uninstall` command to uninstall only the desired project template(s):
    ```sh
    dotnet new uninstall Net6/TelerikBlazorServer
    ```

## License

[Telerik UI for Blazor is a commercial component library](https://www.telerik.com/purchase/license-agreement/blazor-ui) with its own license agreement.

The project templates are subject to [MIT License](LICENSE).
