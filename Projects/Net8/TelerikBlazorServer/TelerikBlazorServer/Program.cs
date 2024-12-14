using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.AspNetCore.SignalR;
using TelerikBlazorServer.Components;
#if (localization)
using TelerikBlazorServer.Services;
using Telerik.Blazor.Services;
#endif

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
    .AddInteractiveServerComponents();

#if (localization)
builder.Services.AddLocalization();
builder.Services.AddControllers();

#endif
builder.Services.AddTelerikBlazor();

#if (localization)
// Localization service for the Telerik component labels
builder.Services.AddSingleton(typeof(ITelerikStringLocalizer), typeof(TelerikLocalizer));

#endif
// SignalR max message size for Editor, FileManager, FileSelect, PDF Viewer, Signature
builder.Services.Configure<HubOptions>(options =>
{
#if (signalr-message-size != 32)
    options.MaximumReceiveMessageSize = {TVAR_SIGNALRMESSAGE} * 1024; // {TVAR_SIGNALRMESSAGE} KB, or use null for no limit
#else
    //options.MaximumReceiveMessageSize = {TVAR_SIGNALRMESSAGE} * 1024; // {TVAR_SIGNALRMESSAGE} KB, or use null for no limit
#endif
});

// .NET Core max form body length for Upload
builder.Services.Configure<FormOptions>(options =>
{
#if (form-body-length != 128)
    options.MultipartBodyLengthLimit = {TVAR_FORMBODY} * 1048576; // {TVAR_FORMBODY} MB
#else
    //options.MultipartBodyLengthLimit = {TVAR_FORMBODY} * 1048576; // {TVAR_FORMBODY} MB
#endif
});

// Kestrel max request body size for Upload
builder.Services.Configure<KestrelServerOptions>(options =>
{
#if (kestrel-request-size != 28)
    options.Limits.MaxRequestBodySize = {TVAR_KESTRELREQUEST} * 1048576; // {TVAR_KESTRELREQUEST} MB
#else
    //options.Limits.MaxRequestBodySize = {TVAR_KESTRELREQUEST} * 1048576; // {TVAR_KESTRELREQUEST} MB
#endif
});

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

#if (localization)
string[] supportedCultures = app.Configuration.GetSection("Cultures")
    .GetChildren().ToDictionary(x => x.Key, x => x.Value).Keys.ToArray();

RequestLocalizationOptions localizationOptions = new RequestLocalizationOptions()
    .SetDefaultCulture(supportedCultures[1])
    .AddSupportedCultures(supportedCultures)
    .AddSupportedUICultures(supportedCultures);

app.UseRequestLocalization(localizationOptions);
app.MapControllers();

#endif
app.MapRazorComponents<App>()
    .AddInteractiveServerRenderMode();

app.Run();