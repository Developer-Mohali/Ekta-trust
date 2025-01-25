<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="TestingForm.aspx.vb" Inherits="EktaTrust.TestingForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">

            <div class="row contact-wrap  wow fadeInDown" id="MipRegistration">
           <img src="images/moke-image.png" class="img-responsive wow fadeInDown pull-right hidden-sm hidden-xs hidden-md" alt="" style="margin-top:150px"> 
                <div class="status alert alert-success" style="display: none"></div>
                <%--<form id="main-contact-form" class="contact-form" name="contact-form" method="post" action="sendemail.php">--%>
                    <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">


                      <div class="form-group">
                            <label>Upload DAF (pdf file) <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="FileUpload" ForeColor="Red" ErrorMessage="Registraion for MIP cannot be done without DAF uploading. Please upload DAF file and try again. Thanks !"  ToolTip="Please upload file." />
                               
                            </label>
                            <asp:fileupload runat="server" class="form-control" id="FileUpload" onclientclick="CheckFile(this);" ></asp:fileupload>
                        </div>                       
                        <div class="form-group">
                            <%-- <button type="submit" name="submit" class="btn btn-primary btn-lg" >Submit Message</button>--%>
                            <asp:button id="ButtonSubmitMessage" runat="server" class="btn btn-success btn-lg" text="Submit" OnClientClick="condtionChecked();" OnClick="MIP_Registration"/>

                        </div>                    
                    </div>
            </div><!--/.row-->
      
  </div>
 
</asp:Content>
