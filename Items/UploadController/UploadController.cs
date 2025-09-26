using Microsoft.AspNetCore.Mvc;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Json;
using System.Text;

namespace {TVAR_ROOTNAMESPACE}.Controllers
{
    [Route("{TVAR_ROUTE}")]
#if (ApiController)
    [ApiController]
#endif
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

                    Response.StatusCode = 201;
                }
                catch (Exception ex)
                {
                    Response.StatusCode = 500;
                    await Response.WriteAsync($"Upload failed: {ex.Message}");
                }
            }

            return new EmptyResult();
        }

#if (ChunkUpload)
        [HttpPost]
        public async Task<IActionResult> SaveChunk(IFormFile files, [FromForm] string chunkMetadata)
        {
            if (files != null)
            {
                try
                {
                    DataContractJsonSerializer dcSerializer = new(typeof(ChunkMetadata));
                    MemoryStream ms = new(Encoding.UTF8.GetBytes(chunkMetadata));

                    if (dcSerializer.ReadObject(ms) is not ChunkMetadata metadata)
                    {
                        throw new NullReferenceException("Chunk metadata serialization failed.");
                    }

                    string saveLocation = Path.Combine(RootPath, metadata.FileName);

                    using FileStream fs = new(saveLocation, FileMode.Append);
                    await files.CopyToAsync(fs);

                    Response.StatusCode = 201;
                }
                catch (Exception ex)
                {
                    Response.StatusCode = 500;
                    await Response.WriteAsync($"Upload failed: {ex.Message}");
                }
            }

            return new EmptyResult();
        }

#endif
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

    [DataContract]
    public class ChunkMetadata
    {
        [DataMember(Name = "fileId")]
        public string FileId { get; set; } = string.Empty;

        [DataMember(Name = "fileName")]
        public string FileName { get; set; } = string.Empty;

        [DataMember(Name = "fileSize")]
        public long FileSize { get; set; }

        [DataMember(Name = "contentType")]
        public string ContentType { get; set; } = string.Empty;

        [DataMember(Name = "chunkIndex")]
        public long ChunkIndex { get; set; }

        [DataMember(Name = "totalChunks")]
        public long TotalChunks { get; set; }
    }
}