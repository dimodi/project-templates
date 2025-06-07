using Microsoft.AspNetCore.Mvc;

namespace TelerikBlazorWebApp.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private IWebHostEnvironment HostingEnvironment { get; set; }

        private readonly string RootPath;

        public UploadController(IWebHostEnvironment hostingEnvironment)
        {
            HostingEnvironment = hostingEnvironment;
            RootPath = HostingEnvironment.WebRootPath;
        }

        [HttpPost]
        public async Task<IActionResult> Save(IFormFile files)
        {
            if (files != null)
            {
                try
                {
                    string saveLocation = Path.Combine(RootPath, files.FileName);

                    using FileStream fs = new(saveLocation, FileMode.Create);
                    await files.CopyToAsync(fs);
                }
                catch (Exception ex)
                {
                    Response.StatusCode = 500;
                    await Response.WriteAsync($"Upload failed: {ex.Message}");
                }
            }

            return new EmptyResult();
        }

        [HttpPost]
        public async Task<IActionResult> Remove([FromForm] string files)
        {
            if (files != null)
            {
                try
                {
                    string fileLocation = Path.Combine(RootPath, files);

                    if (System.IO.File.Exists(fileLocation))
                    {
                        System.IO.File.Delete(fileLocation);
                    }
                }
                catch (Exception ex)
                {
                    Response.StatusCode = 500;
                    await Response.WriteAsync($"Delete failed: {ex.Message}");
                }
            }

            return new EmptyResult();
        }
    }
}