# Blazor Project Templates

This repository provides Visual Studio project templates for [Telerik Blazor apps](https://www.telerik.com/blazor-ui).

When installed, the templates can be used to create new Blazor apps in Visual Studio and also with `dotnet new` CLI commands.

## Installation

1. Clone the repository in some folder, e.g. `FolderName`.
1. Open your favorite terminal app.
1. Execute `dotnet new install FolderName/TelerikBlazorServer` to install the Telerik Blazor Server template.
1. Execute `dotnet new install FolderName/TelerikBlazorWasm` to install the Telerik Blazor WebAssembly template.
1. Execute `dotnet new list` to verify the two solution templates are installed.
1. Restart Visual Studio if it's open.

## Usage with Visual Studio

The new solution templates should appear in the `Custom` category in the New Project wizard.

## Usage with the .NET CLI

1. Create a new empty folder.
1. Go to that folder in a terminal app.
1. To create a new Telerik Blazor Server app, execute `dotnet new tbserver -n MyNewAppName`
1. To create a new Telerik Blazor WebAssembly app, execute `dotnet new tbwasm -n MyNewAppName`

## Extras

The project templates are almost identical to the default .NET 6 Blazor Server and WebAssembly project templates. The differences are:

* The [Telerik UI for Blazor components](https://docs.telerik.com/blazor-ui/introduction#getting-started) are installed and configured with [SVG icon support](https://docs.telerik.com/blazor-ui/common-features/icons) and the [`Default` theme](https://docs.telerik.com/blazor-ui/styling-and-themes/overview).
* The [Telerik font icon namespace](https://docs.telerik.com/blazor-ui/common-features/icons#icon-namespaces) is added in `_Imports.razor`, but it's commented out. The [Telerik font icon stylesheet](https://docs.telerik.com/blazor-ui/common-features/icons#font-icon-stylesheet) is added in `_Layout.cshtml` and `index.html`, but is commented out.
* `Program.cs` in both apps contains commented code to [increase the maximum file upload size](https://docs.telerik.com/blazor-ui/components/upload/overview#large-file-uploads).
* `Program.cs` in the Blazor Server app contains commented code to [increase the maximum SignalR message size](https://docs.telerik.com/blazor-ui/components/fileselect/overview#large-file-support).

## License

[Telerik UI for Blazor is a commercial component library](https://www.telerik.com/purchase/license-agreement/blazor-ui) with its own license agreement.

The project templates are subject to [MIT License](LICENSE).
