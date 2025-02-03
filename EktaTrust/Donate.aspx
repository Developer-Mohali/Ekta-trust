<%@ Page Title="" Language="vb" AutoEventWireup="false"  MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Donate.aspx.vb" Inherits="EktaTrust.Donate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        Table tr td a {
            color: #2a6496;
            text-decoration: underline;
            margin-left: 4px;
        }

        Table tr td li {
            color: #2a6496;
            text-decoration: underline;
            margin-left: 5px;
        }

        .heading-image {
            background: #f87801;
            -webkit-border-top-left-radius: 5px;
            -webkit-border-top-right-radius: 5px;
            -moz-border-radius-topleft: 5px;
            -moz-border-radius-topright: 5px;
            border-top-left-radius: 5px;
            border-top-right-radius: 5px;
            padding: 5px;
            margin-left: 15px;
        }

        #divFirstName {
            min-height: 95px;
        }

        .divPanelChair {
            margin-left: 16px;
            margin-top: 10px;
        }

        .trustee-table {
            margin-top: 10px;
        }

        .divTrusteePanel {
            width: 97% !important;
        }

        .panelImgMar {
            margin-left: -3px;
        }

        .panel-heading {
            margin-right: 50%;
        }

        .content-us .trustee-table {
    font-size: 12px;
    margin: 0px 0px 10px 0px;
    width: 100%;
    padding: 0px;
    text-align: left;
    border-collapse: collapse;
     border: 0px; 
     height: 60px; 
} .content-us .trustee-table td{
     padding: 0px 0px 0px 0px;
     background-color:#f5f5f5;
 }
  .panel {
    padding: 20px !important;
}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="about-us">
        <div class="container">
            <%--<img src="Images/Donate.png" class="img-responsive img-rounded  wow fadeInDown" alt="" style="width: 1150px;" />--%>
            <img src="Images/Donate_1.png" class="img-responsive img-rounded  wow fadeInDown" alt="" style="width: 1150px;"/>
            <h2 class="wow fadeInDown">Donate US</h2>
            <section>
                <%--<div class="row  wow fadeInDown">--%>                    
                <div class="wow fadeInDown">                    
                    <div class="col-lg-4">
                        <div class="row">
                           <div class="panel content-us">
                                <h4>
                                    Cash Donation is not accepted in Ekta Navnirman Trust
                                </h4>
                            </div>
                        </div>
                    <div class="row">
                        <div class="panel content-us">
                            <h3>For Donation</h3>
                            <table class="trustee-table divPanelChair ">
                                <tr>
                                    <td style="font-weight: bold;">A/C NO:</td>  
                                    <td style="padding: 0px 0px 0px 5px;">35834326038</td> 
                                </tr>
                                    <tr>
                                    <td style="font-weight: bold;">IFSC:</td>  
                                    <td style="padding: 0px 0px 0px 5px;">SBIN0004227</td> 
                                </tr>
                                    <tr>

                                    <td style="font-weight: bold;">Account Name:</td>  
                                    <td style="padding: 0px 0px 0px 5px;">Ekta Navnirman Trust</td> 
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">Branch:</td>  
                                    <td style="padding: 0px 0px 0px 5px;">SBI Chandpole Bazar,Jaipur</td> 
                                </tr>
                                <tr>
                                    <td style="font-weight: bold;">UPI ID:</td>  
                                    <td style="padding: 0px 0px 0px 5px;">ektanavnirmantrust@sbi</td> 
                                </tr>
                            </table>
                            <p class="pt-2">
                               <strong>Please send email after donation for our record purpose and 80G</strong>
                            </p>
                        </div>
                     </div>
                    </div>
                     <div class="col-lg-8">
                       <div class="panel">
                                 <img src="Images/image_2024_04_16T10_33_08_337Z.png" style="width: 740px;height:700px;" class="img-responsive img-rounded  wow fadeInDown" alt=""/>
                            </div>

                      </div>
                </div>                   

            </section>
        </div>
    </div>

    <!--/.container-->
</asp:Content>


