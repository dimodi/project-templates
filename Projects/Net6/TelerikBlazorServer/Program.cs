using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.AspNetCore.SignalR;
using TelerikBlazorServer.Data;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
builder.Services.AddSingleton<WeatherForecastService>();

builder.Services.AddTelerikBlazor();

// SignalR max message size for Editor, FileManager, FileSelect, PDF Viewer, Signature
builder.Services.Configure<HubOptions>(options =>
{
#if (SignalrMessageSize != 32)
    options.MaximumReceiveMessageSize = {TVAR_SIGNALRMESSAGE} * 1024; // {TVAR_SIGNALRMESSAGE} KB, or use null for no limit
#else
    //options.MaximumReceiveMessageSize = {TVAR_SIGNALRMESSAGE} * 1024; // {TVAR_SIGNALRMESSAGE} KB, or use null for no limit
#endif
});

// .NET Core max form body length for Upload
builder.Services.Configure<FormOptions>(options =>
{
#if (FormBodyLength != 128)
    options.MultipartBodyLengthLimit = {TVAR_FORMBODY} * 1048576; // {TVAR_FORMBODY} MB
#else
    //options.MultipartBodyLengthLimit = {TVAR_FORMBODY} * 1048576; // {TVAR_FORMBODY} MB
#endif
});

// Kestrel max request body size for Upload
builder.Services.Configure<KestrelServerOptions>(options =>
{
#if (KestrelRequestSize != 28)
    options.Limits.MaxRequestBodySize = {TVAR_KESTRELREQUEST} * 1048576; // {TVAR_KESTRELREQUEST} MB
#else
    //options.Limits.MaxRequestBodySize = {TVAR_KESTRELREQUEST} * 1048576; // {TVAR_KESTRELREQUEST} MB
#endif
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
