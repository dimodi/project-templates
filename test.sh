if [ $# -eq 0 ]; then
 echo "Error: no arguments"
 exit 1
fi

testFolder=$1

cd ~/$testFolder

echo
echo ===== Web App Server, default settings =====

dotnet new dimodi-blazor-server -o TestServerDefaultSettings
cd TestServerDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestServerDefaultSettings

echo
echo ===== Web App Server, .NET 8 =====

dotnet new dimodi-blazor-server -o TestServerNet8 -f net8.0
cd TestServerNet8
dotnet build

cd ~/$testFolder
rm -rf TestServerNet8

echo
echo ===== Web App Server, font icons =====

dotnet new dimodi-blazor-server -o TestServerFontIcons -it Font
cd TestServerFontIcons
dotnet build

cd ~/$testFolder
rm -rf TestServerFontIcons

echo
echo ===== Web App Server, localization =====

dotnet new dimodi-blazor-server -o TestServerLocalization -lo
cd TestServerLocalization
dotnet build

cd ~/$testFolder
rm -rf TestServerLocalization

echo
echo ===== Web App Server, upload controller =====

dotnet new dimodi-blazor-server -o TestServerUploadController -uc
cd TestServerUploadController
dotnet build

cd ~/$testFolder
rm -rf TestServerUploadController

echo
echo ===== Web App WebAssembly, default settings =====

dotnet new dimodi-blazor-wasmauto -o TestWasmDefaultSettings
cd TestWasmDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasmDefaultSettings

echo
echo ===== Web App WebAssembly, .NET 8 =====

dotnet new dimodi-blazor-wasmauto -o TestWasmNet8 -f net8.0
cd TestWasmNet8
dotnet build

cd ~/$testFolder
rm -rf TestWasmNet8

echo
echo ===== Web App WebAssembly, Auto render mode =====

dotnet new dimodi-blazor-wasmauto -o TestWasmAuto -rm Auto
cd TestWasmAuto
dotnet build

cd ~/$testFolder
rm -rf TestWasmAuto

echo
echo ===== Web App WebAssembly, font icons =====

dotnet new dimodi-blazor-wasmauto -o TestWasmFontIcons -it Font
cd TestWasmFontIcons
dotnet build

cd ~/$testFolder
rm -rf TestWasmFontIcons

echo
echo ===== Web App WebAssembly, localization =====

dotnet new dimodi-blazor-wasmauto -o TestWasmLocalization -lo
cd TestWasmLocalization
dotnet build

cd ~/$testFolder
rm -rf TestWasmLocalization

echo
echo ===== Web App WebAssembly, upload controller =====

dotnet new dimodi-blazor-wasmauto -o TestWasmUploadController -uc
cd TestWasmUploadController
dotnet build

cd ~/$testFolder
rm -rf TestWasmUploadController

echo
echo ===== WebAssembly Standalone, default settings =====

dotnet new dimodi-blazorwasm -o TestWasmAloneDefaultSettings
cd TestWasmAloneDefaultSettings
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneDefaultSettings

echo
echo ===== WebAssembly Standalone, .NET 8 =====

dotnet new dimodi-blazorwasm -o TestWasmAloneNet8 -f net8.0
cd TestWasmAloneNet8
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneNet8

echo
echo ===== WebAssembly Standalone, font icons =====

dotnet new dimodi-blazorwasm -o TestWasmAloneFontIcons -it Font
cd TestWasmAloneFontIcons
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneFontIcons

echo
echo ===== WebAssembly Standalone, localization =====

dotnet new dimodi-blazorwasm -o TestWasmAloneLocalization -lo
cd TestWasmAloneLocalization
dotnet build

cd ~/$testFolder
rm -rf TestWasmAloneLocalization

echo
echo ===== SUCCESS =====
echo
