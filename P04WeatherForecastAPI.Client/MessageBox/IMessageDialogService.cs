using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace P04WeatherForecastAPI.Client.MessageBox
{
    public interface IMessageDialogService
    {
        void ShowMessage(string message);
    }

}
