 <%@ Page Language="vb" AutoEventWireup="false" CodeBehind="SignUp.aspx.vb" Inherits="EktaTrust.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table align="center">
                <tr>
                    <td></td>
                    <td align="right"></td>
                    <td align="center">
                       <h1>SingUp Page</h1>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Label ID="lblFirstName" runat="server" Text="FirstName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="textFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter FirstName" ForeColor="Red" ControlToValidate="textFirstName"
                runat="server" />
                    </td>
                </tr> 
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Label ID="lblLastName" runat="server" Text="LastName"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="textLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter LastName" ForeColor="Red" ControlToValidate="textLastName"
                runat="server" />
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Label ID="lblEmailId" runat="server" Text="Email Id"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="textEmailId" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter EmailId" ForeColor="Red" ControlToValidate="textEmailId"
                runat="server" />
                         <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ControlToValidate="textEmailId" ForeColor="Black" ErrorMessage="Please enter valid email id format." />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="textPassword" runat="server" TextMode="Password" ></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Password" ForeColor="Red" ControlToValidate="textPassword"
                runat="server" />
                    </td>
                </tr>                
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Label ID="lblPhoneNo" runat="server" Text="Phone No"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="textPhoneNo" runat="server"></asp:TextBox>
                       <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter PhoneNo" ForeColor="Red" ControlToValidate="textPhoneNo"
                runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="textAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ErrorMessage="*"  ToolTip="Please Enter Address" ForeColor="Red" ControlToValidate="textAddress"
                runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>

                    <td align="left">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                        <input type="reset" value="Reset" />
                        
                    </td>
                </tr>                
              </table>
    </div>
    </form>
</body>
</html>
