if [ $# -eq 0 ]; then
 echo "Error: Provide a path argument"
 exit 1
fi

testFolder=$1

cd ~/$testFolder

# ===== Web App Server =====

echo
echo ===== Web App Server, default settings =====
echo dotnet new dimodi-blazor-server -o TestServerDefaultSettings

dotnet new dimodi-blazor-server -o TestServerDefaultSettings
cd TestServerDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestServerDefaultSettings

echo
echo ===== Web App Server, non-default settings =====
echo dotnet new dimodi-blazor-server -o TestServerNonDefaultSettings -f net8.0 -tv "*" -th bootstrap -dm -c -it Font -lo -r -sms 64 -uc -do

dotnet new dimodi-blazor-server -o TestServerNonDefaultSettings -f net8.0 -tv "*" -th bootstrap -dm -c -it Font -lo -r -sms 64 -uc -do
cd TestServerNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestServerNonDefaultSettings

# ===== Web App WebAssembly and Auto =====

echo
echo ===== Web App WebAssembly, default settings =====
echo dotnet new dimodi-blazor-wasmauto -o TestWasmDefaultSettings

dotnet new dimodi-blazor-wasmauto -o TestWasmDefaultSettings
cd TestWasmDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasmDefaultSettings

echo
echo ===== Web App WebAssembly, non-default settings =====
echo dotnet new dimodi-blazor-wasmauto -o TestWasmNonDefaultSettings -f net8.0 -rm Auto -tv "*" -th bootstrap -dm -c -it Font -lo -r -uc -do

dotnet new dimodi-blazor-wasmauto -o TestWasmNonDefaultSettings -f net8.0 -rm Auto -tv "*" -th bootstrap -dm -c -it Font -lo -r -uc -do
cd TestWasmNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasmNonDefaultSettings

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
echo dotnet new dimodi-blazorwasm -o TestWasmAloneNonDefaultSettings -f net8.0 -tv "*" -th bootstrap -dm -c -it Font -lo -r -do

dotnet new dimodi-blazorwasm -o TestWasmAloneNonDefaultSettings -f net8.0 -tv "*" -th bootstrap -dm -c -it Font -lo -r -do
cd TestWasmAloneNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneNonDefaultSettings

# ===== Web App =====

echo
echo ===== Web App, Server, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings -rm Server

dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings -rm Server
cd TestWebAppServerDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppServerDefaultSettings

echo
echo ===== Web App, Server, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings -f net8.0 -rm Server -tv "*" -th bootstrap -dm -c -it Font -lo -r -sms 64 -uc -do

dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings -f net8.0 -rm Server -tv "*" -th bootstrap -dm -c -it Font -lo -r -sms 64 -uc -do
cd TestWebAppServerNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppServerNonDefaultSettings

echo
echo ===== Web App, WebAssembly, default settings =====
echo dotnet new dimodi-blazor -o TestWebAppWasmDefaultSettings -rm WebAssembly

dotnet new dimodi-blazor -o TestWebAppWasmDefaultSettings -rm WebAssembly
cd TestWebAppWasmDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppWasmDefaultSettings

echo
echo ===== Web App, WebAssembly, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings -f net8.0 -rm WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -r -uc -do

dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings -f net8.0 -rm WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -r -uc -do
cd TestWebAppWasmNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppWasmNonDefaultSettings
