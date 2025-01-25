<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" EnableEventValidation="false" CodeBehind="Certificate.aspx.vb" Inherits="EktaTrust.Certificate" %>

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

        .CertificateFeedback {
            position: relative;
            bottom: 4.58rem;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            float: right;
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 500px;
            max-width: 600px;
        }

        /* The Close Button */
        .close {
           
            float: right;
            font-size: 21px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .edifysports{
                padding:25px 8px !important;
            }
             .Header_popup{
                border-bottom: 1px solid #dee2e6;
                margin-bottom:20px;
            }
    </style>
    <div class="container">

        <h2 class="wow fadeInDown crtificate">Timings & Certificate of Run for Equality 2023</h2>
        <button id="btnCertificateFeedback" type="button" class="CertificateFeedback">Feedback / Suggestions</button>

        <div class="row contact-wrap  wow fadeInDown">
            <div class="status alert alert-success" style="display: none"></div>
            <span style="color: gray; font-weight: bold">
                <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>

            <div class="col-sm-3">
                <div class="form-group">
                    <label>Enter Your BIB Number:</label>
                    <asp:TextBox ID="txtbibNo" runat="server" name="txtbibNo" class="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="BIBnumberValidator" ControlToValidate="txtbibNo"
                        runat="server" ErrorMessage="Please enter the BIB number" ValidationGroup="BIBnumber" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <asp:Button ID="SearchButton" runat="server" class="btn btn-success form-control" Text="Search" ValidationGroup="BIBnumber" OnClick="SearchButton_Click" />
                </div>


            </div>
            
        </div>
        <!--/.row-->
        <div class="col-md-12 ">
            <h2  runat="server" id="hdnMessageCertificate" class="admin-heading">Congratulations Your details are as follows!</h2>

            <div class="table-responsive">

                <table class="table table-bordered table-hover table-striped">

                    <tbody>
                        <tr>
                            <asp:GridView ID="getRec" runat="server" AutoGenerateColumns="False" class="table table-bordered table-hover table-striped" Style="font-weight: normal;">
                                <Columns>
                                    <asp:BoundField HeaderText="BIB Number" DataField="bib_no"></asp:BoundField>
                                    <asp:BoundField HeaderText="Name" DataField="participate_name"></asp:BoundField>
                                    <asp:BoundField HeaderText="Gender" DataField="gender"></asp:BoundField>
                                    <asp:BoundField HeaderText="Run Category" DataField="Event_Name"></asp:BoundField>
                                    <asp:BoundField HeaderText="Completion Time" DataField="Net_Time"></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ItemStyle-Width="72">
                                        <ItemTemplate>
                                            <asp:Button runat="server" Text="Download Certificate" class="btn btn-primary btn-lg" OnClick="DownloadButton_Click" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField HeaderText="" ItemStyle-Width="253"  ItemStyle-CssClass="edifysports">
                                        <ItemTemplate>
                                           <a href="https://www.edifysports.com/result/Event-Result.php" target="_blank" style="text-decoration:underline;">More info about your Run please click</a>                        

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div id="feedbackCertificate" class="modal">
        <!-- Modal content -->
        <div class="modal-content">

            <span class="close">&times;</span>
             <div class="row" style="margin-left: 0">
                <div class="col-12 Header_popup">
                    <div class="modal-header " style="padding:0px">
                        <h5 class="modal-title" style="background-color: #fff; text-align: initial;color: #333;padding:0px;">Feedback/Suggestions Form</h5>
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <label>Name</label>
                        <asp:TextBox ID="txtName" ClientIDMode="Static" name="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredtxtName" ControlToValidate="txtName"
                            runat="server" ClientIDMode="Static" ErrorMessage="Please enter the name." ValidationGroup="feedback" ForeColor="Red"></asp:RequiredFieldValidator>                        
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <label>Mobile no.</label>
                        <asp:TextBox ID="txtMobile" ClientIDMode="Static" name="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredtxtMobile" ControlToValidate="txtMobile"
                            runat="server" ClientIDMode="Static" ErrorMessage="Please enter the mobile number." ValidationGroup="feedback" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ClientIDMode="Static" ID="RegulartxtMobile"                             
                             ControlToValidate="txtMobile" runat="server" ValidationExpression="^([0-9]{10})$"
                            ErrorMessage="Please enter valid mobile number." ValidationGroup="feedback"  ForeColor="Red" style="position: absolute; left: 20px;"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <label>Comments</label>
                        <asp:TextBox ID="txtComment" ClientIDMode="Static" name="txtComment" runat="server" Rows="4" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredtxtComment" ControlToValidate="txtComment"
                            runat="server" ClientIDMode="Static" ErrorMessage="Please enter the comment." ValidationGroup="feedback" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="col-12">
                    <div class="form-group">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Style="float: right" ValidationGroup="feedback" Text="Submit" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>       
        var modal = document.getElementById("feedbackCertificate");
        var btn = document.getElementById("btnCertificateFeedback");
        var span = document.getElementsByClassName("close")[0];

        btn.onclick = function () {
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
           
            document.getElementById("RequiredtxtName").style.visibility = "hidden";
            document.getElementById("RequiredtxtMobile").style.visibility = "hidden";
            document.getElementById("RequiredtxtComment").style.visibility = "hidden";
            document.getElementById("RegulartxtMobile").style.visibility = "hidden";

            document.getElementById("txtName").value =""
            document.getElementById("txtMobile").value =""
            document.getElementById("txtComment").value = ""

             modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
           
            if (event.target == modal) {
              
                document.getElementById("RequiredtxtName").style.visibility = "hidden";
                document.getElementById("RequiredtxtMobile").style.visibility = "hidden";
                document.getElementById("RequiredtxtComment").style.visibility = "hidden";
                document.getElementById("RegulartxtMobile").style.visibility = "hidden";

                document.getElementById("txtName").value =""
                document.getElementById("txtMobile").value =""
                document.getElementById("txtComment").value = ""

                  modal.style.display = "none";
            }
        }
    </script>

</asp:Content>
