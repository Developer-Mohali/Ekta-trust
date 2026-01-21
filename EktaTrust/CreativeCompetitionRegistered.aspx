<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreativeCompetitionRegistered.aspx.vb" MasterPageFile="~/MasterPage/Inner.Master" Inherits="EktaTrust.CreativeCompetitionRegistered" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</asp:Content>
<%@ Register Src="~/Controls/AdminSideMenuControl.ascx" TagPrefix="ucSM" TagName="AdminSideMenuControl" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            // TotalRecord();
            // HideLogdetails();
        })
        function TotalRecord() {

            var totalRowCount = $("[id*=gvEvent] tr").length;
            var rowCount = $("[id*=gvEvent] td").closest("tr").length;
            var message = "Total Items Count: " + rowCount;

            $('#message').text(message);
            return false;
        }

        function HideLogdetails() {
            var name = '<%=Session("RoleId") %>'
            if (name == 2) {
                window.location.href = "/LogIn.aspx";
                //$('#LogDetails').hide();
            }
            else {
                //$('#LogDetails').show();
            }
        }

        function showPreview(path, ext) {
            var modal = document.getElementById('filePreviewModal');
            var content = document.getElementById('previewContent');
            var html = '';

            ext = ext.toLowerCase();
            if (['.jpg', '.jpeg', '.png', '.gif'].includes(ext)) {
                html = '<img src="' + path + '" style="max-width:100%; height:auto;">';
            } else if (ext === '.pdf') {
                html = '<iframe src="' + path + '" style="width:100%; height:500px;"></iframe>';
            } else if (['.mp3', '.wav'].includes(ext)) {
                html = '<audio controls style="width:100%;"><source src="' + path + '" type="audio/' + ext.substring(1) + '">Your browser does not support audio.</audio>';
            } else if (['.mp4', '.webm', '.ogg'].includes(ext)) {
                html = '<video controls style="width:100%; max-height:500px;"><source src="' + path + '" type="video/' + ext.substring(1) + '">Your browser does not support video.</video>';
            } else {
                html = '<p>No preview available for this file type.</p>';
            }

            content.innerHTML = html;
            modal.style.display = 'flex';
        }

        function closePreview() {
            var modal = document.getElementById('filePreviewModal');
            document.getElementById('previewContent').innerHTML = '';
            modal.style.display = 'none';
        }

        window.onclick = function (event) {
            var modal = document.getElementById('filePreviewModal');
            if (event.target === modal) {
                closePreview();
            }
        };
        
    </script>
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }

        .modal-dialog {
            position: relative;
            z-index: 1050;
            margin: 0px;
            /* margin: 10px; */
        }

        .width {
            width: 10%;
        }
    </style>

    <div class="container-fluid main-container">
        <div class="col-md-2 sidebar">
            <div class="row">
                <!-- uncomment code for absolute positioning tweek see top comment in css -->
                <div class="absolute-wrapper"></div>
                <!-- Menu -->
                <ucSM:AdminSideMenuControl runat="server" ID="AdminSideMenuControl" />
            </div>
        </div>
        <div class="col-md-10 ">
            <h2 class="admin-heading">Registerd User of 3<span class="ordinal">rd</span> Ekta Creative Competition 2025</h2>

            <div class="table-responsive">
                <asp:Label ID="MessageUpdated" runat="server" Text="" ForeColor="Green"></asp:Label>
                <table class="table table-bordered table-hover table-striped">

                    <tbody>
                        <tr>
                            <td>Search Participant:
                                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                            </td>
                            <td>Contest:
        <asp:DropDownList ID="drpContest" runat="server" AutoPostBack="True">
            <asp:ListItem Value="0">All</asp:ListItem>
            <asp:ListItem Value="1">Painting for Adults</asp:ListItem>
            <asp:ListItem Value="2">Sketch Drawing for Children</asp:ListItem>
            <asp:ListItem Value="3">Essay for Adults</asp:ListItem>
            <asp:ListItem Value="4">Essay for Children</asp:ListItem>
            <asp:ListItem Value="5">Speech for Adults</asp:ListItem>
            <asp:ListItem Value="6">Fancy Dress Competition for Kids</asp:ListItem>
            <asp:ListItem Value="7">Songs for Adults</asp:ListItem>
            <asp:ListItem Value="8">Reels for Adults</asp:ListItem>
            <asp:ListItem Value="9">Book Review for Adults</asp:ListItem>
        </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" Text="Search" />
                                <asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red" Text=""></asp:Label>

                            </td>

                            <td style="display: none;">
                                <asp:Button ID="btnAdd" runat="server" Text="Add New User" OnClick="AddButton_Click" UseSubmitBehavior="False" />
                            </td>
                        </tr>

                    </tbody>
                    <br />

                    <asp:GridView ID="gvEvent" runat="server"
                        class="table table-bordered table-hover table-striped"
                        AutoGenerateColumns="false" DataKeyNames="ID"
                        PageSize="25"
                        EmptyDataText="No records has been added."
                        OnRowDeleting="gvEvent_RowDeleting"
                        OnPageIndexChanging="gvEvent_PageIndexChanging"
                        OnRowCommand="gvEvent_RowCommand">

                        <Columns>
                            <asp:BoundField HeaderText="Participant Id" DataField="Id" />
                            <asp:BoundField HeaderText="Name" DataField="Name" />
                            <asp:BoundField HeaderText="Email" DataField="EmailID" />
                            <asp:BoundField HeaderText="Contest" DataField="Contest" />
                            <asp:BoundField HeaderText="Mobile" DataField="MobileNumber" />
                            <asp:BoundField HeaderText="Address" DataField="Address" />
                            <asp:TemplateField HeaderText="Files">
                                <ItemTemplate>
                                    <%# GetFileLinks(Eval("Files")) %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action" ItemStyle-Width="72">
                                <ItemTemplate>
                                    <asp:ImageButton
                                        ID="ButtonEdit"
                                        runat="server"
                                        CommandName="EditRecord"
                                        CommandArgument='<%# Eval("Id") %>'
                                        ImageUrl="Images/UI_Icons-09-128.png"
                                        Width="25px"
                                        Height="25px"
                                        ToolTip="Edit Participant"
                                        Style="margin-right: 5px;" />

                                    <asp:ImageButton
                                        ID="ButtonDelete"
                                        runat="server"
                                        CommandName="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this event?');"
                                        ImageUrl="Images/minimal-97-128.png"
                                        Width="25px"
                                        Height="25px"
                                        CssClass="input" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </table>
                Total Items Count:
                <asp:Label ID="lblRecords" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>


</asp:Content>




