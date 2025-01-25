<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PaymentResponse.aspx.vb" Inherits="EktaTrust.PaymentResponse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <!-- start branding table -->
    <table width='100%' border='2' cellpadding='2' class='title'>
        <tr>
            <td class='shade' width='90%'>
                <h2 class='co'>&nbsp;
 MERCHANT RESPONSE PAGE</h2>
            </td>
            <td class='title' align='center'>
                <h3 class='co'></h3>
            </td>
        </tr>
    </table>
    <!-- end branding table -->

    <asp:Panel ID="Panel_Debug" runat="server">
        <!-- only display these next fields if debug enabled -->
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label_Debug" runat="server" /></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label_DigitalOrder" runat="server" /></td>
            </tr>
        </table>
    </asp:Panel>

    <h1 align="center">
        <asp:Label ID="Label_Title" runat="server" /></h1>

    <form runat="server">
        <table align="center" border="0" width="70%">

            <tr class="title">
                <td colspan="2">
                    <p>
                        <strong>&nbsp;Fields below are the request values returned </strong>
                </td>
            </tr>

            <tr>
                <td align="right"><strong><em>Merchant Transaction Reference:</em></strong></td>
                <td>
                    <asp:Label ID="Label_MerchTxnRef" runat="server" /></td>
            </tr>
            <tr class="shade">
                <td align="right"><strong><em>Order Info:</em></strong></td>
                <td>
                    <asp:Label ID="Label_OrderInfo" runat="server" /></td>
            </tr>
            <tr>
                <td align="right"><strong><em>Merchant ID: </em></strong></td>
                <td>
                    <asp:Label ID="Label_MerchantID" runat="server" /></td>
            </tr>

            <tr class="shade">
                <td align="right"><strong><em>Transaction Amount: </em></strong></td>
                <td>
                    <asp:Label ID="Label_Amount" runat="server" /></td>
            </tr>
            <tr>
                <td align="right"><strong><em>Terminal Id</em></strong></td>
                <td>
                    <asp:Label ID="Label_TerminalId" runat="server" /></td>
            </tr>

            <tr class='title'>
                <td colspan='2' height='25'>
                    <p><strong>Fields below are for a standard transaction </strong></p>
                </td>
            </tr>
            <tr class="shade">
                <td align="right"><strong><em>Transaction Response Code: </em></strong></td>
                <td>
                    <asp:Label ID="Label_TxnResponseCode" runat="server" /></td>
            </tr>

            <tr>
                <td align="right"><strong><i>Message: </i></strong></td>
                <td>
                    <asp:Label ID="Label_Message" runat="server" /></td>
            </tr>
            <asp:Panel ID="Panel_Receipt" runat="server">
                <!-- only display these next fields if not an error -->
                <tr>
                    <td align="right"><strong><em>RetRefNo: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_RetRefNo" runat="server" /></td>
                </tr>
                <tr class="shade">
                    <td align="right"><strong><em>Batch Number for this transaction: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_BatchNo" runat="server" /></td>
                </tr>


                <tr>
                    <td align="right"><strong><em>Authorization Code: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_AuthorizeID" runat="server" /></td>
                </tr>
                <tr class="shade">
                    <td align="right"><strong><em>Card Type: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_CardType" runat="server" /></td>
                </tr>
                <tr>
                    <td align="right"><strong><em>Card No: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_CardNo" runat="server" /></td>
                </tr>
                <tr class='title'>
                    <td colspan='2' height='25'>
                        <p><strong>Fields below are for 3-D Secure Authentication Fields </strong></p>
                    </td>
                </tr>
                <tr>
                    <td align='right'><strong><em>CAVV: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_CAVV" runat="server" /></td>
                </tr>
                <tr class='shade'>
                    <td align='right'><strong><em>ECI: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_UCAP" runat="server" /></td>
                </tr>

                <tr>
                    <td align='right'><strong><em>Authentication Status:</em></strong></td>
                    <td>
                        <asp:Label ID="Label_AuthStatus" runat="server" /></td>
                </tr>

                <tr class='shade'>
                    <td align="right"><strong><em>ENROLLED: </em></strong></td>
                    <td>
                        <asp:Label ID="Label_ENROLLED" runat="server" /></td>
                </tr>

            </asp:Panel>
            <tr>
                <td colspan="2">
                    <hr />
                </td>
            </tr>
            <tr class="title">
                <td colspan="2" height="25">
                    <p><strong>&nbsp;Hash Validation</strong></p>
                </td>
            </tr>
            <tr>
                <td align="right"><strong><em>Hash Validated Correctly: </em></strong></td>
                <td>
                    <asp:Label ID="Label_HashValidation" runat="server" /></td>
            </tr>
            <asp:Panel ID="Panel_StackTrace" runat="server">
                <!-- only display these next fields if an stacktrace output exists-->
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr class="title">
                    <td colspan="2">
                        <p><strong>&nbsp;Exception Stack Trace</strong></p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="Label_StackTrace" runat="server" /></td>
                </tr>
            </asp:Panel>
            <tr>
                <td width="50%">&nbsp;</td>
                <td width="50%">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="Label_AgainLink" runat="server" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
