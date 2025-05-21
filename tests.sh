if [ $# -eq 0 ]; then
 echo "Error: Provide an argument with a path that is inside ~/"
 exit 1
fi

testFolder=$1

cd ~/$testFolder

# ===== Server =====

echo
echo ===== Server, default settings =====
echo dotnet new dimodi-blazorserver -o TestServer6DefaultSettings -tv "7.1.0"

dotnet new dimodi-blazorserver -o TestServer6DefaultSettings -tv "7.1.0"
cd TestServer6DefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestServer6DefaultSettings

echo
echo ===== Server, non-default settings =====
echo dotnet new dimodi-blazorserver -o TestServer6NonDefaultSettings -f net7.0 -tv "7.1.0" -th bootstrap -dm -c -it Font -r -sms 64

dotnet new dimodi-blazorserver -o TestServer6NonDefaultSettings -f net7.0 -tv "7.1.0" -th bootstrap -dm -c -it Font -r -sms 64
cd TestServer6NonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestServer6NonDefaultSettings

# ===== WebAssembly Hosted =====

echo
echo ===== WebAssembly Hosted, default settings =====
echo dotnet new dimodi-blazorwasm-hosted -o TestWasm6DefaultSettings -tv "7.1.0"

dotnet new dimodi-blazorwasm-hosted -o TestWasm6DefaultSettings -tv "7.1.0"
cd TestWasm6DefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasm6DefaultSettings

echo
echo ===== WebAssembly Hosted, non-default settings =====
echo dotnet new dimodi-blazorwasm-hosted -o TestWasm6NonDefaultSettings -f net7.0 -tv "7.1.0" -th bootstrap -dm -c -it Font -r

dotnet new dimodi-blazorwasm-hosted -o TestWasm6NonDefaultSettings -f net7.0 -tv "7.1.0" -th bootstrap -dm -c -it Font -r
cd TestWasm6NonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasm6NonDefaultSettings

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
echo dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings -int Server

dotnet new dimodi-blazor -o TestWebAppServerDefaultSettings -int Server
cd TestWebAppServerDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppServerDefaultSettings

echo
echo ===== Web App, Server, non-default settings =====
echo dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings -f net8.0 -int Server -tv "*" -th bootstrap -dm -c -it Font -lo -r -sms 64 -uc -do

dotnet new dimodi-blazor -o TestWebAppServerNonDefaultSettings -f net8.0 -int Server -tv "*" -th bootstrap -dm -c -it Font -lo -r -sms 64 -uc -do
cd TestWebAppServerNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppServerNonDefaultSettings

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
echo dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings -f net8.0 -int WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -r -uc -do

dotnet new dimodi-blazor -o TestWebAppWasmNonDefaultSettings -f net8.0 -int WebAssembly -tv "*" -th bootstrap -dm -c -it Font -lo -r -uc -do
cd TestWebAppWasmNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppWasmNonDefaultSettings

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
echo dotnet new dimodi-blazor -o TestWebAppAutoNonDefaultSettings -f net8.0 -int Auto -tv "*" -th bootstrap -dm -c -it Font -lo -r -uc -do

dotnet new dimodi-blazor -o TestWebAppAutoNonDefaultSettings -f net8.0 -int Auto -tv "*" -th bootstrap -dm -c -it Font -lo -r -uc -do
cd TestWebAppAutoNonDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWebAppAutoNonDefaultSettings
