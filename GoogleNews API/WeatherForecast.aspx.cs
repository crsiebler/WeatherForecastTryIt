using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Net;
using System.IO;
using System.Text;
using System.Data;

namespace WeatherForecast_API
{
    public partial class WeatherForecast : System.Web.UI.Page
    {
        /// <summary>
        /// Page Load Method
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="keyword"></param>
        /// <returns></returns>
        [WebMethod]
        public static string GetWeatherForecast(string keyword)
        {
            // Initialize the List of News forecasts
            List<Forecast> forecasts = new List<Forecast>();

            // Initialize the Google News RSS Feed request
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://api.openweathermap.org/data/2.5/forecast/daily?q=" + keyword + "&cnt=5&units=imperial&mode=json");

            // Specify GET Method Request
            request.Method = "GET";

            // Perform the Request
            HttpWebResponse response = (HttpWebResponse)request.GetResponse();

            // Check the Response State Code for Success
            if (response.StatusCode == HttpStatusCode.OK)
            {
                Stream receiveStream = response.GetResponseStream();
                StreamReader readStream = null;

                // Check the Character Set of the Response
                if (response.CharacterSet == "")
                {
                    readStream = new StreamReader(receiveStream);
                }
                else
                {
                    readStream = new StreamReader(receiveStream, Encoding.GetEncoding(response.CharacterSet));
                }

                // Convert the Stream in a JSON string
                return readStream.ReadToEnd();
            }

            return null;
        }

        public class Forecast
        {
            public string title { get; set; }
            public string url { get; set; }
            public string date { get; set; }
            public string id { get; set; }
            public string description { get; set; }
        }
    }
}