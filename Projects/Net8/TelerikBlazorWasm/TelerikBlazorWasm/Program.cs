using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using TelerikBlazorWasm.Components;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorComponents()
#if (render-mode == "Auto")
    .AddInteractiveServerComponents()
#endif
    .AddInteractiveWebAssemblyComponents();

builder.Services.AddTelerikBlazor();

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

app.MapRazorComponents<App>()
#if (render-mode == "Auto")
    .AddInteractiveServerRenderMode()
#endif
    .AddInteractiveWebAssemblyRenderMode()
    .AddAdditionalAssemblies(typeof(TelerikBlazorWasm.Client._Imports).Assembly);

app.Run();
