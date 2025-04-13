#if (UploadController)
using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Server.Kestrel.Core;
#endif
using Microsoft.AspNetCore.SignalR;
using TelerikBlazorServer.Components;
#if (Localization)
using TelerikBlazorServer.Services;
using Telerik.Blazor.Services;
#endif

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

#if (Localization)
builder.Services.AddLocalization();
#endif
#if (Localization || UploadController)
builder.Services.AddControllers();

#endif
builder.Services.AddTelerikBlazor();

#if (Localization)
// Localization service for the Telerik component labels
builder.Services.AddSingleton(typeof(ITelerikStringLocalizer), typeof(TelerikLocalizer));

#endif
// SignalR max message size for Editor, FileManager, FileSelect, PDF Viewer, Signature
builder.Services.Configure<HubOptions>(options =>
{
#if (SignalrMessageSize != 32)
    options.MaximumReceiveMessageSize = {TVAR_SIGNALRMESSAGE} * 1024; // {TVAR_SIGNALRMESSAGE} KB, or use null for no limit
#else
    //options.MaximumReceiveMessageSize = {TVAR_SIGNALRMESSAGE} * 1024; // {TVAR_SIGNALRMESSAGE} KB, or use null for no limit
#endif
});

#if (UploadController)
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
if (!app.Environment.IsDevelopment())
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

#if (Localization)
string[] supportedCultures = app.Configuration.GetSection("Cultures")
    .GetChildren().ToDictionary(x => x.Key, x => x.Value).Keys.ToArray();

RequestLocalizationOptions localizationOptions = new RequestLocalizationOptions()
    .SetDefaultCulture(supportedCultures[1])
    .AddSupportedCultures(supportedCultures)
    .AddSupportedUICultures(supportedCultures);

app.UseRequestLocalization(localizationOptions);
#endif
#if (Localization || UploadController)
app.MapDefaultControllerRoute();

#endif
app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();