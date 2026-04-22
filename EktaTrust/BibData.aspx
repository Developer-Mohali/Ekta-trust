<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" EnableEventValidation="false" CodeBehind="BibData.aspx.vb" Inherits="EktaTrust.BibData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        .crtificate {
            visibility: visible;
            animation-name: fadeInDown;
            color: #4e4e4e;
            font-size: 20px;
            text-align: left;
            padding: 0px 0px 10px 0px;
            border-bottom: 1px dotted #ff7500;
            font-weight: 600;
            text-transform: uppercase;
        }
        input[type=number]::-webkit-inner-spin-button, 
            input[type=number]::-webkit-outer-spin-button { 
                -webkit-appearance: none;
                -moz-appearance: none;
                appearance: none;
                margin: 0; 
            }
        .card {
  max-width: 400px;
  margin: 20px auto;
  padding: 15px;
  border: 1px solid #ddd;
  border-radius: 8px;
  font-family: Arial, sans-serif;
  line-height: 1.5;
}

.card b {
  display: block;
  margin-bottom: 6px;
}

.card a {
  color: blue;
  text-decoration: underline;
}
    </style>

    <style>
    .custom-card {
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 20px;
        margin-top: 20px;
        background: #fff;
    }
    .custom-card h4 {
        margin-top: 0;
        margin-bottom: 10px;
        font-weight: bold;
    }
    .divider {
        border-left: 1px solid #eee;
    }
</style>

<div class="container">
        <h2 class="wow fadeInDown crtificate">BIB Data  <span id="lblYear"><%= year %></span></h2>
        <div class="row contact-wrap  wow fadeInDown">
            <div class="status alert alert-success" style="display: none"></div>
            <span style="color: gray; font-weight: bold">
                <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
            <div class="col-sm-6">
                 <div class="col-sm-6">
                        <div class="form-group">
                            <label>Enter Your Mobile Number:</label>
                            <asp:TextBox ID="txtMobileNo" runat="server" name="txtMobileNo" TextMode="Number" class="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredValidatorMobile" ControlToValidate="txtMobileNo"
                                runat="server" ErrorMessage="Please enter the Mobile number" ValidationGroup="BibDataSearch" ForeColor="Red" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone number should be 10 digit" 
                            ControlToValidate="txtMobileNo" ValidationExpression="^\d{10}$" ValidationGroup="BibDataSearch" ForeColor="Red" Display="Dynamic" />
                        </div>
                     </div>
                <div class="col-sm-12" style="justify-items: flex-start;padding: unset;">
                 <div class="col-sm-3">
                  <div class="form-group">
                    <asp:Button ID="SearchButton" runat="server" class="btn btn-success form-control" Text="Search" ValidationGroup="BibDataSearch"  OnClick="SearchButton_Click" />
                </div>
                     </div>
            </div>
            </div>
          
        </div>

        <!--/.row-->
        <div class="col-md-12 ">
            <h2  runat="server" id="hdnMsgBiBData" class="admin-heading">Congratulations Your details are as follows!</h2>
            <div class="table-responsive">
                <table class="table table-bordered table-hover table-striped">
                    <tbody>
                        <tr>
                            <asp:GridView ID="getRec" runat="server" AutoGenerateColumns="False" class="table table-bordered table-hover table-striped" Style="font-weight: normal;">
                                <Columns>
                                    <asp:BoundField HeaderText="Category" DataField="category_name"></asp:BoundField>
                                    <asp:BoundField HeaderText="Name" DataField="participate_name"></asp:BoundField>
                                    <asp:BoundField HeaderText="Gender" DataField="gender"></asp:BoundField>
                                    <asp:BoundField HeaderText="Blood Group" DataField="blood_group"></asp:BoundField>
                                    <asp:BoundField HeaderText="Tshirt Size" DataField="tshirt_size"></asp:BoundField>
                                    <asp:BoundField HeaderText="Run Category" DataField="run_category"></asp:BoundField>
                                    <asp:BoundField HeaderText="BIB Number" DataField="bib_no"></asp:BoundField>

                                    <asp:TemplateField HeaderText="BIB Expo Location">
                                        <ItemTemplate>
                                           <a href="https://share.google/uDKLU8Psb4WBZZIME" target="_blank" style="text-decoration:underline; color:blue">https://share.google/uDKLU8Psb4WBZZIME </a>
                                      <%--     <a href="https://g.co/kgs/adLsfKf" target="_blank" style="text-decoration:underline; color:blue">https://g.co/kgs/adLsfKf </a>--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Venue to Collect BIB" DataField="collect_bib"></asp:BoundField>

                                </Columns>
                            </asp:GridView>
                        </tr>
                        <%--<tr>
                            <td>
                                --%>
                                <%--<div class="card">
                                <b>BIB EXPO DETAIL</b><br />
                                &nbsp; &nbsp;&nbsp; &nbsp;Details of BIB EXPO 2026<br />
                                &nbsp; &nbsp;&nbsp; &nbsp;Timing - 10AM to 7PM<br />
                                &nbsp; &nbsp;&nbsp; &nbsp;Date   -  13.04.2026<br />
                                &nbsp; &nbsp;&nbsp; &nbsp;Venue - Rajasthan Local Self Governement Institute Jaipur, Tonk Road<br />
                                &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<a href="https://share.google/uDKLU8Psb4WBZZIME" target="_blank" style="text-decoration:underline; color:blue">https://share.google/uDKLU8Psb4WBZZIME </a><br />
                                <br />
                                <b>Run Reporting Time on 14.04.2026 at South Gate, Albert Hall, Jaipur</b><br />
                                &nbsp; &nbsp;&nbsp; &nbsp;4:15AM - Half Marathon<br />
                                &nbsp; &nbsp;&nbsp; &nbsp;5:15AM - 10 KM<br />
                                &nbsp; &nbsp;&nbsp; &nbsp;5:30AM - 5KM<br />
                             </div>--%>

                           <%-- </td>
                        </tr>--%>
                    </tbody>
                </table>
            </div>

            <div class="row">
    <div class="col-md-12">
        <div class="custom-card">
            
            <div class="row">
                
                <!-- Left Column -->
                <div class="col-md-6 col-sm-6 col-xs-12">
                    <h4>BIB EXPO DETAIL</h4>
                    Details of BIB EXPO 2026<br>
                    Timing - 10AM to 7PM<br>
                    Date - 13.04.2026<br>
                    Venue - Rajasthan Local Self Government Institute Jaipur, Tonk Road<br>
                    <a href="https://share.google/uDKLU8Psb4WBZZIME" style="color:blue;" target="_blank">
                        https://share.google/uDKLU8Psb4WBZZIME
                    </a>
                </div>

                <!-- Right Column -->
                <div class="col-md-6 col-sm-6 col-xs-12 divider">
                    <h4>Run Reporting Time (14.04.2026)</h4>
                    South Gate, Albert Hall, Jaipur<br>
                    4:15 AM - Half Marathon<br>
                    5:15 AM - 10 KM<br>
                    5:30 AM - 5 KM
                </div>

            </div>

        </div>
    </div>
</div>
        </div>
    </div>

    <script type="text/javascript">
        function validateMobile() {
            var input = document.getElementById('<%= txtMobileNo.ClientID %>').value.trim();
            var errorSpan = document.getElementById('mobileError');
            errorSpan.style.display = 'none';
            errorSpan.innerText = '';

            if (input === '') {
                errorSpan.innerText = 'Please enter the Mobile number';
                errorSpan.style.display = 'inline';
                return false;
            }

            if (!/^\d+$/.test(input)) {
                errorSpan.innerText = 'Please enter a valid phone number (digits only)';
                errorSpan.style.display = 'inline';
                return false;
            }

            if (input.length !== 10) {
                errorSpan.innerText = 'Phone number should be exactly 10 digits';
                errorSpan.style.display = 'inline';
                return false;
            }

            return true;
        }
    </script>

</asp:Content>

