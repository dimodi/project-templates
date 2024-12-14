using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Server.Kestrel.Core;
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

#if (localization && render-mode == "Auto")
builder.Services.AddLocalization();
builder.Services.AddControllers();

#endif
builder.Services.AddTelerikBlazor();

#if (localization && render-mode == "Auto")
// Localization service for the Telerik component labels
builder.Services.AddSingleton(typeof(ITelerikStringLocalizer), typeof(TelerikLocalizer));

#endif
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

#if (localization && render-mode == "Auto")
string[] supportedCultures = app.Configuration.GetSection("Cultures")
    .GetChildren().ToDictionary(x => x.Key, x => x.Value).Keys.ToArray();

RequestLocalizationOptions localizationOptions = new RequestLocalizationOptions()
    .SetDefaultCulture(supportedCultures[0])
    .AddSupportedCultures(supportedCultures)
    .AddSupportedUICultures(supportedCultures);

app.UseRequestLocalization(localizationOptions);
app.MapControllers();

#endif
app.MapRazorComponents<App>()
#if (render-mode == "Auto")
    .AddInteractiveServerRenderMode()
#endif
    .AddInteractiveWebAssemblyRenderMode()
    .AddAdditionalAssemblies(typeof(TelerikBlazorWasm.Client._Imports).Assembly);

app.Run();