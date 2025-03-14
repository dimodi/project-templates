using Microsoft.AspNetCore.Http.Features;
using Microsoft.AspNetCore.Server.Kestrel.Core;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

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
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseBlazorFrameworkFiles();
app.UseStaticFiles();

app.UseRouting();


app.MapRazorPages();
app.MapControllers();
app.MapFallbackToFile("index.html");

app.Run();
