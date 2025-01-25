<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TestCookies.aspx.vb" Inherits="EktaTrust.TestCookies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <div id="demo"></div>

<script>
var txt = "";
txt += "<p>Browser CodeName: " + navigator.appCodeName + "</p>";
txt += "<p>Browser Name: " + navigator.appName + "</p>";
txt += "<p>Browser Version: " + navigator.appVersion + "</p>";
txt += "<p>Cookies Enabled: " + navigator.cookieEnabled + "</p>";
txt += "<p>Browser Language: " + navigator.language + "</p>";
txt += "<p>Browser Online: " + navigator.onLine + "</p>";
txt += "<p>Platform: " + navigator.platform + "</p>";
txt += "<p>User-agent header: " + navigator.userAgent + "</p>";

document.getElementById("demo").innerHTML = txt;
</script>
</body>
</html>
