using TelerikBlazorWebApp.Resources;
using Telerik.Blazor.Services;

namespace TelerikBlazorWebApp.Services
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