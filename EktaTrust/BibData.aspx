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
    </style>

<div class="container">
        <h2 class="wow fadeInDown crtificate">BIB Data  <span id="lblYear">2025</span></h2>
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
                                    <asp:BoundField HeaderText="Venue to Collect BIB" DataField="collect_bib"></asp:BoundField>

                                </Columns>
                            </asp:GridView>
                        </tr>
                    </tbody>
                </table>
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

