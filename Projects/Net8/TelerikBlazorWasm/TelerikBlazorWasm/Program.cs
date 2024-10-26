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

// Upload file size limit on ASP.NET Core
builder.Services.Configure<FormOptions>(options =>
{
    //options.MultipartBodyLengthLimit = 4_294_967_296; // 4 GB
});
// Upload file size limit on Kestrel
builder.Services.Configure<KestrelServerOptions>(options =>
{
    //options.Limits.MaxRequestBodySize = 4_294_967_296; // 4 GB
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
