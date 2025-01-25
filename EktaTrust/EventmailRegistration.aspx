<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EventmailRegistration.aspx.vb" Inherits="EktaTrust.EventmailRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://www.recaptcha.net/recaptcha/api.js" async defer></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnMail" runat="server" Text="Button" OnClick="btnMail_Click" />
            <asp:Label ID="statusSuccess" runat="server" Text="Label"></asp:Label>
            <asp:Label ID="statusFail" runat="server" Text="Label"></asp:Label>
        </div>

    </form>


    <div class="g-recaptcha" data-sitekey="6Ldz-1MUAAAAAKjh1d4HasWbKdPeNE9TILrqL0Wd"></div>
<noscript>
    <div>
        <div style="width: 302px; height: 422px; position: relative;">
            <div style="width: 302px; height: 422px; position: absolute;">
                <iframe src="https://www.recaptcha.net/recaptcha/api/fallback?k=6Ldz-1MUAAAAAKjh1d4HasWbKdPeNE9TILrqL0Wd"
                        frameborder="0" scrolling="no"
                        style="width: 302px; height:422px; border-style: none;"></iframe>
            </div>
        </div>
        <div style="width: 300px; height: 60px; border-style: none;
                   bottom: 12px; left: 25px; margin: 0px; padding: 0px; right: 25px;
                   background: #f9f9f9; border: 1px solid #c1c1c1; border-radius: 3px;">
            <textarea id="g-recaptcha-response" name="g-recaptcha-response"
                      class="g-recaptcha-response"
                      style="width: 250px; height: 40px; border: 1px solid #c1c1c1;
                          margin: 10px 25px; padding: 0px; resize: none;">
      </textarea>
        </div>
    </div>
</noscript>

</body>
</html>
