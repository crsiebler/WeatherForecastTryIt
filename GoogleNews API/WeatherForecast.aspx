﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeatherForecast.aspx.cs" Inherits="WeatherForecast_API.WeatherForecast" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Weather Forecast TryIt</title>
    <script type="text/javascript" src="Scripts/jquery-2.1.0.min.js"></script>
    <script type="text/javascript">
        // Function for GetNews using Ajax Post Method
        function GetForecast() {
            // Create Ajax Post Method
            $.ajax({
                type: "POST", // Ajax Mehod
                url: "WeatherForecast.aspx/GetWeatherForecast",  // Page URL / Method name
                data: "{'keyword':'" + document.getElementById("input").value + "'}", // Pass Parameters
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (data) { // Function call on success
                    $("#DivForecast").empty(); // Set Div Empty

                    /*
                    // Set For loop for binding Div Row wise
                    for (var i = 0; i < data.d.length; i++) {
                        // Design Div Dynamically using append
                        $("#DivForecast").append("<a target=\"_blank\" href=\"" + data.d[i].url + "\">" + data.d[i].title + "</a><br />");
                    }
                    */
                    $("#DivForecast").append(data.d + "<br />");
                },
                error: function (result) {
                    // Function call on failure or error
                    alert(result.d);
                }
            });

            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td align="center" class="style1">
                    <h3>OpenWeatherMap API</h3>
                </td>
            </tr>
            <tr>
                <td>Method Signature: GetForecast(string):List</td>
            </tr>
            <tr>
                <td>String Value: <asp:TextBox runat="server" ID="input" CssClass="textbox" /></td>
                <td><asp:Button id="Button1" Text="Submit" OnClientClick="return GetForecast()" runat="server"/></td>
            </tr>
        </table>
        <br />
        <br />
        <div id="DivForecast"></div>
    </form>
</body>
</html>
