using TelerikBlazorServer.Resources;
using Telerik.Blazor.Services;

namespace TelerikBlazorServer.Services
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