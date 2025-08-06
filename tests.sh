if [ $# -eq 0 ]; then
 echo "Error: Provide an argument with a path that is inside ~/"
 exit 1
fi

testFolder=$1

cd ~/$testFolder

# ===== WebAssembly Standalone =====

echo
echo ===== WebAssembly Standalone, default settings =====
echo dotnet new dimodi-blazorwasm -o TestWasmAloneDefaultSettings

dotnet new dimodi-blazorwasm -o TestWasmAloneDefaultSettings
cd TestWasmAloneDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneDefaultSettings

echo
echo ===== WebAssembly Standalone, non-default settings =====
echo dotnet new dimodi-blazorwasm -o TestWasmAloneNonDefaultSettings -f net9.0 -tv "*" -th bootstrap -dm -c -it Font -lo -dp -r -do

dotnet new dimodi-blazorwasm -o TestWasmAloneNonDefaultSettings -f net9.0 -tv "*" -th bootstrap -dm -c -it Font -lo -dp -r -do
cd TestWasmAloneNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneNonDefaultSettings

echo
echo ===== WebAssembly Standalone, .NET 10, default settings =====
echo dotnet new dimodi-blazorwasm -o TestWasmAloneDefaultSettings10 -f net10.0

dotnet new dimodi-blazorwasm -o TestWasmAloneDefaultSettings10 -f net10.0
cd TestWasmAloneDefaultSettings10
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneDefaultSettings10

echo
echo ===== WebAssembly Standalone, .NET 10, non-default settings =====
echo dotnet new dimodi-blazorwasm -o TestWasmAloneNonDefaultSettings10 -f net10.0 -tv "*" -th bootstrap -dm -c -it Font -lo -dp -r -do

dotnet new dimodi-blazorwasm -o TestWasmAloneNonDefaultSettings10 -f net10.0 -tv "*" -th bootstrap -dm -c -it Font -lo -dp -r -do
cd TestWasmAloneNonDefaultSettings10
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneNonDefaultSettings10


# ===== Web App =====

echo
echo ===== Web App, Server, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings -int Server

dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings -int Server
cd TestWebAppServerDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppServerDefaultSettings

echo
echo ===== Web App, Server, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings -f net9.0 -int Server -tv "*" -th bootstrap -dm -c -it Font -lo -uc -sms 64 -dp -r -do

dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings -f net9.0 -int Server -tv "*" -th bootstrap -dm -c -it Font -lo -uc -sms 64 -dp -r -do
cd TestWebAppServerNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppServerNonDefaultSettings

echo
echo ===== Web App, Server, .NET 10, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings10 -int Server -f net10.0

dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings10 -int Server -f net10.0
cd TestWebAppServerDefaultSettings10
dotnet build

cd ~/$testFolder
rm -rf TestWebAppServerDefaultSettings10

echo
echo ===== Web App, Server, .NET 10, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings10 -f net10.0 -int Server -tv "*" -th bootstrap -dm -c -it Font -lo -uc -sms 64 -dp -r -do

dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings10 -f net10.0 -int Server -tv "*" -th bootstrap -dm -c -it Font -lo -uc -sms 64 -dp -r -do
cd TestWebAppServerNonDefaultSettings10
dotnet build

cd ~/$testFolder
rm -rf TestWebAppServerNonDefaultSettings10

echo
echo ===== Web App, WebAssembly, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppWasmDefaultSettings -int WebAssembly

dotnet new dimodi-blazor -o TestWebAppWasmDefaultSettings -int WebAssembly
cd TestWebAppWasmDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppWasmDefaultSettings

echo
echo ===== Web App, WebAssembly, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings -f net9.0 -int WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do

dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings -f net9.0 -int WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do
cd TestWebAppWasmNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppWasmNonDefaultSettings

echo
echo ===== Web App, WebAssembly, .NET 10, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppWasmDefaultSettings10 -int WebAssembly -f net10.0

dotnet new dimodi-blazor -o TestWebAppWasmDefaultSettings10 -int WebAssembly -f net10.0
cd TestWebAppWasmDefaultSettings10
dotnet build

cd ~/$testFolder
rm -rf TestWebAppWasmDefaultSettings10

echo
echo ===== Web App, WebAssembly, .NET 10, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings10 -f net10.0 -int WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do

dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings10 -f net10.0 -int WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do
cd TestWebAppWasmNonDefaultSettings10
dotnet build

cd ~/$testFolder
rm -rf TestWebAppWasmNonDefaultSettings10

echo
echo ===== Web App, Auto, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppAutoDefaultSettings -int Auto

dotnet new dimodi-blazor -o TestWebAppAutoDefaultSettings -int Auto
cd TestWebAppAutoDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppAutoDefaultSettings

echo
echo ===== Web App, Auto, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppAutoNonDefaultSettings -f net9.0 -int Auto -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do

dotnet new dimodi-blazor -o TestWebAppAutoNonDefaultSettings -f net9.0 -int Auto -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do
cd TestWebAppAutoNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppAutoNonDefaultSettings

echo
echo ===== Web App, Auto, .NET 10, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppAutoDefaultSettings10 -int Auto -f net10.0

dotnet new dimodi-blazor -o TestWebAppAutoDefaultSettings10 -int Auto -f net10.0
cd TestWebAppAutoDefaultSettings10
dotnet build

cd ~/$testFolder
rm -rf TestWebAppAutoDefaultSettings10

echo
echo ===== Web App, Auto, .NET 10, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppAutoNonDefaultSettings10 -f net10.0 -int Auto -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do

dotnet new dimodi-blazor -o TestWebAppAutoNonDefaultSettings10 -f net10.0 -int Auto -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do
cd TestWebAppAutoNonDefaultSettings10
dotnet build

cd ~/$testFolder
rm -rf TestWebAppAutoNonDefaultSettings10


# ===== Item Templates =====

echo
echo ===== Item Templates =====
echo dotnet new dimodi-blazor -o TestItemTemplates -int Server

dotnet dotnet new dimodi-blazor -o TestItemTemplates -int Server
cd TestItemTemplates

# ===== Grid =====

echo
echo ===== Grid, default settings =====
cd Components/Pages/
echo dotnet new dimodi-grid -n GridDefault

dotnet dotnet new dimodi-grid -n GridDefault
cd ../../
dotnet build

rm Components/Pages/GridDefault.razor

echo
echo ===== Grid, non-default settings =====
cd Components/Pages/
echo dotnet new dimodi-grid -n GridNonDefault

dotnet dotnet new dimodi-grid -n GridNonDefault -da "OnRead" -em "Inline" -va -s -g
cd ../../
dotnet build

rm Components/Pages/GridNonDefault.razor

# ===== TreeView =====

echo
echo ===== TreeView, default settings =====
cd Components/Pages/
echo dotnet new dimodi-treeview -n TreeViewDefault

dotnet dotnet new dimodi-treeview -n TreeViewDefault
cd ../../
dotnet build

rm Components/Pages/TreeViewDefault.razor

echo
echo ===== TreeView, non-default settings =====
cd Components/Pages/
echo dotnet new dimodi-treeview -n TreeViewNonDefault -da "Hierarchical" -le 4 -c 2 -ri 2 -s -ch

dotnet dotnet new dimodi-treeview -n TreeViewNonDefault -da "Hierarchical" -le 4 -c 2 -ri 2 -s -ch
cd ../../
dotnet build

rm Components/Pages/TreeViewNonDefault.razor

# ===== Upload =====

echo
echo ===== Upload, default settings =====
cd Components/Pages/
echo dotnet new dimodi-upload -n UploadDefault

dotnet new dimodi-upload -n UploadDefault
cd ../../
dotnet build

rm Components/Pages/UploadDefault.razor

echo
echo ===== Upload, non-default settings =====
cd Components/Pages/
echo dotnet new dimodi-upload -n UploadNonDefault -ext "img" -min 2 -max 3 -mu false -ch

dotnet new dimodi-upload -n UploadNonDefault -ext "img" -min 2 -max 3 -mu false -ch
cd ../../
dotnet build

rm Components/Pages/UploadNonDefault.razor

# ===== Item Templates End =====

cd ~/$testFolder
rm -rf TestItemTemplates


# ===== Item Templates, .NET 10 =====

echo
echo ===== Item Templates, .NET 10 =====
echo dotnet new dimodi-blazor -o TestItemTemplates10 -int Server -f net10.0

dotnet new dimodi-blazor -o TestItemTemplates10 -int Server -f net10.0
cd TestItemTemplates10

# ===== Grid =====

echo
echo ===== Grid, default settings =====
cd Components/Pages/
echo dotnet new dimodi-grid -n GridDefault

dotnet new dimodi-grid -n GridDefault
cd ../../
dotnet build

rm Components/Pages/GridDefault.razor

echo
echo ===== Grid, non-default settings =====
cd Components/Pages/
echo dotnet new dimodi-grid -n GridNonDefault

dotnet new dimodi-grid -n GridNonDefault -da "OnRead" -em "Inline" -va -s -g
cd ../../
dotnet build

rm Components/Pages/GridNonDefault.razor

# ===== TreeView =====

echo
echo ===== TreeView, default settings =====
cd Components/Pages/
echo dotnet new dimodi-treeview -n TreeViewDefault

dotnet dotnet new dimodi-treeview -n TreeViewDefault
cd ../../
dotnet build

rm Components/Pages/TreeViewDefault.razor

echo
echo ===== TreeView, non-default settings =====
cd Components/Pages/
echo dotnet new dimodi-treeview -n TreeViewNonDefault -da "Hierarchical" -le 4 -c 2 -ri 2 -s -ch

dotnet dotnet new dimodi-treeview -n TreeViewNonDefault -da "Hierarchical" -le 4 -c 2 -ri 2 -s -ch
cd ../../
dotnet build

rm Components/Pages/TreeViewNonDefault.razor

# ===== Upload =====

echo
echo ===== Upload, default settings =====
cd Components/Pages/
echo dotnet new dimodi-upload -n UploadDefault

dotnet new dimodi-upload -n UploadDefault
cd ../../
dotnet build

rm Components/Pages/UploadDefault.razor

echo
echo ===== Upload, non-default settings =====
cd Components/Pages/
echo dotnet new dimodi-upload -n UploadNonDefault -ext "img" -min 2 -max 3 -mu false -ch

dotnet new dimodi-upload -n UploadNonDefault -ext "img" -min 2 -max 3 -mu false -ch
cd ../../
dotnet build

rm Components/Pages/UploadNonDefault.razor

# ===== Item Templates .NET 10 End =====

cd ~/$testFolder
rm -rf TestItemTemplates10
