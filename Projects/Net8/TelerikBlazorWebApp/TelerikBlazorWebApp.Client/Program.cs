using Microsoft.AspNetCore.Components.WebAssembly.Hosting;
#if (localization)
using TelerikBlazorWebApp.Client.Services;
using Microsoft.JSInterop;
using System.Globalization;
using Telerik.Blazor.Services;
#endif

var builder = WebAssemblyHostBuilder.CreateDefault(args);

#if (localization)
// Localization service for the Telerik component labels
builder.Services.AddSingleton(typeof(ITelerikStringLocalizer), typeof(TelerikLocalizer));

builder.Services.AddLocalization();

WebAssemblyHost host = builder.Build();

string[] supportedCultures = host.Configuration.GetSection("Cultures")
    .GetChildren().ToDictionary(x => x.Key, x => x.Value).Keys.ToArray();

IJSRuntime js = host.Services.GetRequiredService<IJSRuntime>();
string savedCulture = await js.InvokeAsync<string>("blazorCulture.get");
CultureInfo culture = CultureInfo.GetCultureInfo(savedCulture ?? supportedCultures[1]);

if (string.IsNullOrEmpty(savedCulture))
{
    await js.InvokeVoidAsync("blazorCulture.set", supportedCultures[1]);
}

CultureInfo.DefaultThreadCurrentCulture = culture;
CultureInfo.DefaultThreadCurrentUICulture = culture;

await host.RunAsync();
#else
await builder.Build().RunAsync();
#endif