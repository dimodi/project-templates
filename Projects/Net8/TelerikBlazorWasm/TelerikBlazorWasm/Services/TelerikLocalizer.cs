using TelerikBlazorWasmStandalone.Resources;
using Telerik.Blazor.Services;

namespace TelerikBlazorWasm.Services
{
    public class TelerikLocalizer : ITelerikStringLocalizer
    {
        public string this[string key]
        {
            get
            {
                return TelerikMessages.ResourceManager.GetString(key, TelerikMessages.Culture) ?? key;
            }
        }
    }
}