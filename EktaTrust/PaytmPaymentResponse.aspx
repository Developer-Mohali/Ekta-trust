<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PaytmPaymentResponse.aspx.vb" Inherits="EktaTrust.PaytmPaymentResponse" %>


<!DOCTYPE html>
<style>

body section {
            padding: 20px 0;
        }

    .row {
        margin-right: 0;
        margin-left: -15px;
    }
       .lable1 {
       color:white !important;
       margin-left:10%;
       font-size:12px;
       font-family:Arial;
       }

        
          .feedback {
       background-image:url('Images/DonateUs.gif');
       padding: 10px 15px;
       border-radius: 1em 0 0 1em !important; 
       height:115px !important;
       width:25px !important;
       }

      #Donate {
     position: fixed;
     top: 190px;
     right: 0px !important;
     z-index:999;
     }

</style>

<html xmlns="http://www.w3.org/1999/xhtml">


<head runat="server">
             <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

        <link href="../Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />

      <title>Home | Ekta Trust</title>
</head>
<body>
   


     <header id="header">
                    <div class="top-bar">                   
            <div class="container-fluid">
                <div class="row">
                    <div style="float: left;" class="col-sm-10">
                        <div class="top-number ">
                            <p class="text-info "><a href="mailto:ektanavnirmantrust@gmail.com "><i class="fa fa-envelope"></i>ektanavnirmantrust@gmail.com </a>
                                <label class="lable1"><b>Tax Benefits:</b> Registered u/s 12A of the Income Tax Act, 1961. Donations exempted u/s 80G of the Income Tax Act 1961. </label>
                       
                            </p>
                                   
                        </div>
                    </div>

                </div>

                <div>
                    <div class="social col-sm-3 pull-right">
                        <ul class="social-share ">
                                <li><a href="https://t.me/EktaTrust" target="_blank"><i class="fa fa-telegram"></i></a></li>
                                <li><a href="https://www.facebook.com/Ekta-Navnirman-Trust-Page-1688092001490316/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://twitter.com/trust_ekta" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container" style="width: 100%; height:120px; border-bottom-style:solid;">
            <div class="row col-lg-2 col-xs-12 text-center"><a href="../Home">
                <img src="../Images/logo2.png" alt="logo" style="padding-top: 7px;"></a> </div>
            <div class="col-lg-2 col-xs-12 pull-right text-center nopadding-right " style="margin: 5px 0px 0px 0px">

                <img class="" width="100" height="100" src="../Images/ambd.png" />
            </div>
            <div class="col-lg-8 col-xs-12" style="color: #50255b; font-size: 25px; text-align: center;font-weight: bold; font-family: Verdana; margin: 20px 0px 5px 0px">
                <strong>Ekta Navnirman Trust</strong>
                <p style="font-size: 10px; font-family: Arial; color: #f57400; margin: -5px 0px 0px 160px;" class="p">Helping People, changing lives.</p>
            </div>

        </div>
       </header>


<div style="max-width:600px;margin:50px auto;text-align:center;border:1px solid #ddd;padding:30px;border-radius:10px;">

    <h2 id="statusTitle" runat="server"></h2>

    <asp:Label ID="lblMessage" runat="server" Font-Size="Large"></asp:Label>

    <hr />

    <p><b>Order ID:</b> <asp:Label ID="lblOrderId" runat="server"></asp:Label></p>
    <p><b>Transaction ID:</b> <asp:Label ID="lblTxnId" runat="server"></asp:Label></p>
    <p><b>Amount:</b> ₹ <asp:Label ID="lblAmount" runat="server"></asp:Label></p>
    <asp:Panel ID="Panelpayment" runat="server" Visible="false">
        <p><b>Transaction Type:</b> <asp:Label ID="lblpaymentType" runat="server"></asp:Label></p>
        <p><b>Payment Mode:</b> <asp:Label ID="lblpaymentMode" runat="server"></asp:Label></p>
       <form id="form1" runat="server"> <asp:LinkButton ID="lnkReceipt" runat="server" CssClass="btn btn-warning"  OnClick="lnkReceipt_Click"> Download Receipt </asp:LinkButton>  </form>
    </asp:Panel>
    <br />

    <asp:Panel ID="pnlRetry" runat="server" Visible="false">
        <a href="EventRegistration.aspx" class="btn btn-warning">Retry Payment</a>
    </asp:Panel>

    <br />

    <a href="/" class="btn btn-primary">Go Back</a>
</div>


</body>
    <footer id="footer" class="midnight-blue">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">Dedicated for a Better Tomorrow <div style="padding-top:12px"></div> </div>
                <div class="col-sm-9" style="text-align:right" >
                    <ul>
                        <li><a href="../TermsAndCondition.aspx" target="_blank">Terms and Conditions</a></li>
                    </ul>
                </div>
               <div class="col-sm-12 rezinfo"> 
                   <div class="col-sm-6 rezinfo"><span id="siteseal"><script async type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=Tx5CaysYwyffrq8bzM0EFkoTXgfJAgBGMcc62iZT5BYncW3t0uStsuFiZsvW"></script></span></div>
                    <div class="col-sm-6 rezinfo" style ="text-align :right ">
                        <small>Website Developed & Maintained By: - </small>
                        <a href="http://www.kasproit.com/" style="color: red; font-weight: bold;" target="_blank">Kaspro Solutions Pvt Ltd</a>
                        <br />
               </div>

                
            </div>
        </div>
    </footer>
</html>