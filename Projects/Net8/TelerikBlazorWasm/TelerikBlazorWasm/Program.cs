#if (upload-controller)
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Server.Kestrel.Core;
#endif
using TelerikBlazorWasm.Components;
#if (localization)
using TelerikBlazorWasm.Services;
using Microsoft.Extensions.Localization;
using Telerik.Blazor.Services;
#endif

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
#if (render-mode == "Auto")
    .AddInteractiveServerComponents()
#endif
    .AddInteractiveWebAssemblyComponents();

#if (localization)
builder.Services.AddLocalization();
#endif
#if (localization || upload-controller)
builder.Services.AddControllers();

#endif
builder.Services.AddTelerikBlazor();

#if (localization)
// Localization service for the Telerik component labels
builder.Services.AddSingleton(typeof(ITelerikStringLocalizer), typeof(TelerikLocalizer));

#endif
#if (upload-controller)
// .NET Core max form body length for Upload
builder.Services.Configure<FormOptions>(options =>
{
    options.MultipartBodyLengthLimit = 256 * 1048576; // 256 MB
});

// Kestrel max request body size for Upload
builder.Services.Configure<KestrelServerOptions>(options =>
{
    options.Limits.MaxRequestBodySize = 256 * 1048576; // 256 MB
});

#endif
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseWebAssemblyDebugging();
}
else
{
    app.UseExceptionHandler("/Error", createScopeForErrors: true);
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

#if (Framework == "net8.0")
app.UseStaticFiles();
#else
app.MapStaticAssets();
#endif
app.UseAntiforgery();

#if (localization)
string[] supportedCultures = app.Configuration.GetSection("Cultures")
    .GetChildren().ToDictionary(x => x.Key, x => x.Value).Keys.ToArray();

RequestLocalizationOptions localizationOptions = new RequestLocalizationOptions()
    .SetDefaultCulture(supportedCultures[1])
    .AddSupportedCultures(supportedCultures)
    .AddSupportedUICultures(supportedCultures);

app.UseRequestLocalization(localizationOptions);
#endif
#if (localization || upload-controller)
app.MapDefaultControllerRoute();

#endif
app.MapRazorComponents<App>()
#if (render-mode == "Auto")
    .AddInteractiveServerRenderMode()
#endif
    .AddInteractiveWebAssemblyRenderMode()
    .AddAdditionalAssemblies(typeof(TelerikBlazorWasm.Client._Imports).Assembly);

app.Run();