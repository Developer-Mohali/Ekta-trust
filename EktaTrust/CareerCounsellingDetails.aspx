<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="CareerCounsellingDetails.aspx.vb" Inherits="EktaTrust.CareerCounsellingDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %> 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            TotalRecord();
            HideLogdetails();
        })
        function TotalRecord() {

            var totalRowCount = $("[id*=gvEvent] tr").length;
            var rowCount = $("[id*=gvEvent] td").closest("tr").length;
            var message = "Total Items Count: " + rowCount;

            $('#message').text(message);
            return false;
        }

        function HideLabel() {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=MessageUpdated.ClientID %>").style.display = "none";
                document.getElementById("<%=lblRequestMessage.ClientID %>").style.display = "none";
            }, seconds * 1000);
        }

        function HideLogdetails() {
            var name = '<%=Session("RoleId") %>'
            if (name == 2) {
                $('#LogDetails').hide();
            }
            else {
                $('#LogDetails').show();
            }
        }
    </script>
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }

        .width {
            width: 10%;
        }

        .labelCapital {
            text-transform: capitalize;
        }

        .box1 {
            border: 5px solid #eee;
            background: #FFF;
            border-radius: 10px !important;
            box-shadow: 0px 0px 10px 2px #999;
        }

        .divDisgn {
            width: 750px;
            margin-bottom: 20px;
        }

        .trBack {
            background-color: #d9edf7;
        }

        .tdHeads {
            text-align: left;
            font-size: large;
            color: dodgerblue;
        }

        .labelfont {
            font-weight: bold;
        }

        .labelCapital {
            text-transform: capitalize;
        }

        .ViewImage {
            cursor: pointer;
        }
    </style>

    <div class="container-fluid main-container">
        <div class="col-md-2 sidebar">
            <div class="row">
                <!-- uncomment code for absolute positioning tweek see top comment in css -->
                <div class="absolute-wrapper"></div>
                <!-- Menu -->
               <ucSM:AdminSideMenuControl runat="server" id="AdminSideMenuControl" />
            </div>
        </div>
        <div class="col-md-10 ">
            <div class="table-responsive">

                <!---- matrimonial panel ---->
                <asp:Panel ID="matrimonialPanel" runat="server">

                    <h2 class="admin-heading">Career Counselling &amp; Guidance Details</h2>
                    <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>

                    <table class="table table-bordered table-hover table-striped">

                        <tbody>
                            <tr>
                                <td>Search By:
                        <asp:DropDownList ID="ddlSearchBy" runat="server" AutoPostBack="True">
                            <asp:ListItem Text="All"></asp:ListItem>
                            <asp:ListItem Text="Name"></asp:ListItem>
                            <asp:ListItem Text="Mobile"></asp:ListItem>
                        </asp:DropDownList>
                                </td>
                                <td>Search
                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                                </td>
                                <td>
                                    <asp:Button ID="btnShowRequest" runat="server" Text="Request For Account Delete" OnClick="btnShowRequest_Click" disabled="disabled"/>
                                </td>
                            </tr>
                        </tbody>
                        <asp:GridView ID="gvEvent" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="Id" PageSize="25"
                            EmptyDataText="No records has been added." OnRowDataBound="gvEvent_RowDataBound1" Style="font-weight: normal;" OnRowDeleting="gvMIP_RowDeleting" OnPageIndexChanging="gvEvent_PageIndexChanging">
                            <Columns>

                                <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:BoundField HeaderText="Email" DataField="Email" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:BoundField HeaderText="Mobile" DataField="Phone" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:BoundField HeaderText="Area of Interest" DataField="Message" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:BoundField HeaderText="DOR" DataField="DOR" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" HeaderStyle-Width="10%"></asp:BoundField>
                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="72">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtn" CssClass="ViewImage" ImageUrl="Images/priview.png" ToolTip="View Details" runat="server" Width="25" Height="25" OnClick="imgbtn_Click1" />
                                        <asp:ImageButton ID="ButtonDelete" runat="server" ToolTip="Delete Account" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this account?');" Text="Delete" Width="25" Height="25" CssClass="input" ImageUrl="Images/minimal-97-128.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%--<asp:CommandField ButtonType="Link"  ItemStyle-Width="62"/>--%>
                            </Columns>
                        </asp:GridView>
                    </table>
                    Total Items Count:
                    <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label>

                    <br />
                    <asp:Label ID="lblresult" runat="server" />

                </asp:Panel>

                <!---request panel is here--->
                <asp:Panel ID="requestpanel" runat="server">
                    <h2 class="admin-heading">Request For Account Delete</h2>
                    <asp:Label ID="lblRequestMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    <table class="table table-bordered table-hover table-striped">
                        <tbody>
                            <tr>
                                <td>Search By:
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                            <asp:ListItem Text="All"></asp:ListItem>
                            <asp:ListItem Text="Name"></asp:ListItem>
                            <asp:ListItem Text="Mobile"></asp:ListItem>
                        </asp:DropDownList>
                                </td>
                                <td>Search 
                        <asp:TextBox ID="txtSearchRequest" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:Button ID="btnSearchRequest" runat="server" Text="Search" OnClick="btnSearchRequest_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnMatrimonialAll" runat="server" Text="Matrimonial Details" OnClick="btnMatrimonialAll_Click" />
                                </td>
                            </tr>
                        </tbody>

                        <asp:GridView ID="gridRequestDetails" runat="server" class="table table-bordered table-hover table-striped" AutoGenerateColumns="false" DataKeyNames="ID" PageSize="25"
                            EmptyDataText="No records has been added." OnRowDataBound="gridRequestDetails_RowDataBound" Style="font-weight: normal;" OnRowDeleting="gridRequestDetails_RowDeleting" OnPageIndexChanging="gridRequestDetails_PageIndexChanging">

                            <Columns>
                                <asp:BoundField HeaderText="Name" DataField="Name" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:BoundField HeaderText="Email" DataField="EmailId" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:BoundField HeaderText="Mobile" DataField="PhoneNo" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:BoundField HeaderText="Gender" DataField="Gender" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:BoundField HeaderText="Date Of Birth" DataField="DOB" ItemStyle-HorizontalAlign="Left" DataFormatString="{0:dd-M-yyyy}" HeaderStyle-Width="10%"></asp:BoundField>
                                <asp:BoundField HeaderText="Request" DataField="DeleteAccountRequest" ItemStyle-HorizontalAlign="Left"></asp:BoundField>
                                <asp:TemplateField HeaderText="Action" ItemStyle-Width="72">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="ButtonDelete" runat="server" CommandName="Delete" ToolTip="Delete Account" OnClientClick="return confirm('Are you sure you want to delete this account?');" Text="Delete" Width="25" Height="25" CssClass="input" ImageUrl="Images/minimal-97-128.png" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </table>
                    Total Items Count:
                    <asp:Label ID="lblRecordCount" runat="server" Text="Label"></asp:Label>
                </asp:Panel>

                <!----panel end  request---->
                <asp:Button ID="btnShowPopup" runat="server" Style="display: none" CssClass="col-lg-6 col-sm-6 col-md-6" />
                <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup" CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
                </ajaxToolkit:ModalPopupExtender>
                <asp:Panel ID="pnlpopup" runat="server" Style="display: none; /*overflow-y: scroll*/ max-height: 100%;">
                    <div class="modal-dialog" style="min-width: 800px; min-height: 600px;">
                        <div class="modal-content">

                            <div class="modal-header">
                                <div style="border-bottom: 1px solid #e5e5e5;">

                                    <tr style="background-color: #D55500">
                                        <td colspan="2" style="height: 10%; color: White; font-weight: bold; font-size: larger"></td>
                                        <div class="row">
                                            <div class="col-sm-4">
                                                <h4>Candidate Details</h4>
                                            </div>
                                            <div class="col-sm-3">
                                                <h4>Date of Registration:</h4>
                                            </div>
                                            <div class="col-sm-3" style="padding-top: 9px;">
                                                <asp:Label CssClass="labelfont" ID="labelDor" runat="server" Text="Label"></asp:Label>
                                            </div>
                                            <div class="col-sm-2">
                                                <asp:Button ID="btnCancel" runat="server" class="btn btn-primary btn-lg" Text="X" Style="width: auto; float: right; height: auto;" />
                                            </div>
                                        </div>
                                </div>

                                <div class="modal-body" style="width: 780px; overflow-y: auto">
                                    <table class="col-sm-12 table-hover box divDisgn">
                                        <!------Basic information------------->
                                        <tr class="trBack">
                                            <td class="tdHeads" colspan="3">Basic Information
                                            </td>
                                            <td class="tdstyle">&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">&nbsp;</td>
                                        </tr>
                                        <tr style="border: none">
                                            <td class="col-sm-3">
                                                <asp:Label CssClass="labelfont" runat="server" Text="Label">Name</asp:Label>
                                            </td>
                                            <td class="col-sm-3">
                                                <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblName" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                                            </td>
                                           <td class="col-sm-3">
                                                <asp:Label CssClass="labelfont" runat="server" Text="Label">Education</asp:Label>
                                            </td>
                                            <td class="col-sm-3">
                                                <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblEducation" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-sm-3">
                                                <asp:Label CssClass="labelfont" runat="server" Text="Label">Mobile No</asp:Label>
                                            </td>
                                            <td class="col-sm-3">
                                                <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblMobileNo" runat="server" Text="Label"></asp:Label>
                                            </td>
                                            <td class="col-sm-3">
                                                <asp:Label runat="server" CssClass="labelfont" Text="Label">Email Address</asp:Label>
                                            </td>
                                            <td class="col-sm-3">
                                                <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblEmail" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                           <td class="col-sm-3">
                                                <asp:Label CssClass="labelfont" runat="server" Text="Label">Address</asp:Label>
                                            </td>
                                            <td colspan="3" class="col-sm-9">
                                                <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblAddress" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                             <td class="col-sm-3">
                                                <asp:Label CssClass="labelfont" runat="server" Text="Label">Area of Interest</asp:Label>
                                            </td>
                                            <td colspan="3" class="col-sm-9">
                                                <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblAreaOfInterest" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                                            </td>
                                        </tr>                                      
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>

</asp:Content>

