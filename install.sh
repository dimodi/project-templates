echo 
echo ==================================================
echo = Installing Telerik Blazor project templates... =
echo ==================================================
echo

dotnet new install Net6/TelerikBlazorServer
dotnet new install Net6/TelerikBlazorWasm
dotnet new install Net8/TelerikBlazorServer
dotnet new install Net8/TelerikBlazorWasm

echo 
echo ==============================================
echo = Listing all installed project templates... =
echo ==============================================
echo

dotnet new list
