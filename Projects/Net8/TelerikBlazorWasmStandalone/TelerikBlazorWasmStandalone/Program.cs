using Microsoft.AspNetCore.Components.Web;
using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
using TelerikBlazorWasmStandalone;
#if (localization)
using TelerikBlazorWasmStandalone.Services;
using Microsoft.JSInterop;
using System.Globalization;
using Telerik.Blazor.Services;
#endif

var builder = WebAssemblyHostBuilder.CreateDefault(args);
builder.RootComponents.Add<App>("#app");
builder.RootComponents.Add<HeadOutlet>("head::after");

builder.Services.AddScoped(sp => new HttpClient { BaseAddress = new Uri(builder.HostEnvironment.BaseAddress) });

builder.Services.AddTelerikBlazor();

#if (localization)
// Localization service for the Telerik component labels
builder.Services.AddSingleton(typeof(ITelerikStringLocalizer), typeof(TelerikLocalizer));

builder.Services.AddLocalization();

WebAssemblyHost host = builder.Build();

const string defaultCulture = "en-US";

IJSRuntime js = host.Services.GetRequiredService<IJSRuntime>();
string result = await js.InvokeAsync<string>("blazorCulture.get");
CultureInfo culture = CultureInfo.GetCultureInfo(result ?? defaultCulture);

if (result == null)
{
    await js.InvokeVoidAsync("blazorCulture.set", defaultCulture);
}

CultureInfo.DefaultThreadCurrentCulture = culture;
CultureInfo.DefaultThreadCurrentUICulture = culture;

await host.RunAsync();
#else
await builder.Build().RunAsync();
#endif