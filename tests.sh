#if [ $# -eq 0 ]; then
# echo "Error: Provide an argument with a path that is inside ~/"
# exit 1
#fi

set -e

testFolder=temptests

mkdir $testFolder
cd $testFolder/

# ===== WebAssembly Standalone =====

echo
echo ===== WebAssembly Standalone, default settings =====
echo dotnet new dimodi-blazorwasm -o TestWasmAloneDefaultSettings

dotnet new dimodi-blazorwasm -o TestWasmAloneDefaultSettings
cd TestWasmAloneDefaultSettings
dotnet build

cd ../
rm -rf TestWasmAloneDefaultSettings

echo
echo ===== WebAssembly Standalone, non-default settings =====
echo dotnet new dimodi-blazorwasm -o TestWasmAloneNonDefaultSettings -p -tv "*" -th bootstrap -dm -c -it Font -lo -dp -r -do

dotnet new dimodi-blazorwasm -o TestWasmAloneNonDefaultSettings -p -tv "*" -th bootstrap -dm -c -it Font -lo -dp -r -do
cd TestWasmAloneNonDefaultSettings
dotnet build

cd ../
rm -rf TestWasmAloneNonDefaultSettings

# ===== Web App =====

echo
echo ===== Web App, Server, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings -int Server

dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings -int Server
cd TestWebAppServerDefaultSettings
dotnet build

cd ../
rm -rf TestWebAppServerDefaultSettings

echo
echo ===== Web App, Server, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings -int Server -tv "*" -th bootstrap -dm -c -it Font -lo -uc -sms 64 -dp -r -do

dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings -int Server -tv "*" -th bootstrap -dm -c -it Font -lo -uc -sms 64 -dp -r -do
cd TestWebAppServerNonDefaultSettings
dotnet build

cd ../
rm -rf TestWebAppServerNonDefaultSettings

echo
echo ===== Web App, WebAssembly, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppWasmDefaultSettings -int WebAssembly

dotnet new dimodi-blazor -o TestWebAppWasmDefaultSettings -int WebAssembly
cd TestWebAppWasmDefaultSettings
dotnet build

cd ../
rm -rf TestWebAppWasmDefaultSettings

echo
echo ===== Web App, WebAssembly, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings -int WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do

dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings -int WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do
cd TestWebAppWasmNonDefaultSettings
dotnet build

cd ../
rm -rf TestWebAppWasmNonDefaultSettings

echo
echo ===== Web App, Auto, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppAutoDefaultSettings -int Auto

dotnet new dimodi-blazor -o TestWebAppAutoDefaultSettings -int Auto
cd TestWebAppAutoDefaultSettings
dotnet build

cd ../
rm -rf TestWebAppAutoDefaultSettings

echo
echo ===== Web App, Auto, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppAutoNonDefaultSettings -int Auto -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do

dotnet new dimodi-blazor -o TestWebAppAutoNonDefaultSettings -int Auto -tv "*" -th bootstrap -dm -c -it Font -lo -uc -dp -r -do
cd TestWebAppAutoNonDefaultSettings
dotnet build

cd ../
rm -rf TestWebAppAutoNonDefaultSettings

# ===== Item Templates =====

echo
echo ===== Item Templates =====
echo dotnet new dimodi-blazor -o TestItemTemplates -int Server

dotnet new dimodi-blazor -o TestItemTemplates -int Server
cd TestItemTemplates

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

dotnet new dimodi-treeview -n TreeViewDefault
cd ../../
dotnet build

rm Components/Pages/TreeViewDefault.razor

echo
echo ===== TreeView, non-default settings =====
cd Components/Pages/
echo dotnet new dimodi-treeview -n TreeViewNonDefault -da "Hierarchical" -le 4 -c 2 -ri 2 -s -ch

dotnet new dimodi-treeview -n TreeViewNonDefault -da "Hierarchical" -le 4 -c 2 -ri 2 -s -ch
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

# ===== Upload Controller =====

echo
echo ===== Upload Controller, default settings =====
mkdir Controllers
cd Controllers
echo dotnet new dimodi-upload-controller -n UploadController -root TestItemTemplates

dotnet new dimodi-upload-controller -n UploadController -root TestItemTemplates
cd ../
dotnet build

rm -rf Controllers

echo
echo ===== Upload Controller, non-default settings =====
mkdir Controllers
cd Controllers
echo dotnet new dimodi-upload-controller -n UploadController -root TestItemTemplates -api false -ch

dotnet new dimodi-upload-controller -n UploadController -root TestItemTemplates -rte "[controller]/[action]" -api false -ch
cd ../
dotnet build

rm Controllers/UploadController.cs

# ===== Item Templates End =====

cd ../
rm -rf TestItemTemplates

# ===== Tests End =====

cd ../
rm -rf $testFolder
