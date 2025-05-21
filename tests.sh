if [ $# -eq 0 ]; then
 echo "Error: Provide an argument with a path that is inside ~/"
 exit 1
fi

testFolder=$1

cd ~/$testFolder

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
