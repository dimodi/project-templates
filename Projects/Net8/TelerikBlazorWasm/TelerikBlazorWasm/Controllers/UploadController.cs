using Microsoft.AspNetCore.Mvc;

namespace TelerikBlazorWasm.Controllers
{
    [Route("api/[controller]/[action]")]
    [ApiController]
    public class UploadController : ControllerBase
    {
        private IWebHostEnvironment HostingEnvironment { get; set; }

        public UploadController(IWebHostEnvironment hostingEnvironment)
        {
            HostingEnvironment = hostingEnvironment;
        }

        [HttpPost]
        public async Task<IActionResult> Save(IFormFile files)
        {
            if (files != null)
            {
                try
                {
                    string rootPath = HostingEnvironment.WebRootPath;
                    string saveLocation = Path.Combine(rootPath, files.FileName);

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
                    string rootPath = HostingEnvironment.WebRootPath;
                    string fileLocation = Path.Combine(rootPath, files);

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