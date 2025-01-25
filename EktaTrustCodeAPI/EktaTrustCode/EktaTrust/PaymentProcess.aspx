<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PaymentProcess.aspx.vb" Inherits="EktaTrust.PaymentProcess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home | Ekta Trust</title>

    <!-- core CSS -->
    <script src="../Js/js/jquery-1.11.3.min.js"></script>
    <link href="Css/bootstrap.min.css" rel="stylesheet" />
    <link href="../Css/font-awesome.css" rel="stylesheet" />
    <link href="../Css/animate.min.css" rel="stylesheet" />
    <link href="../Css/main.css" rel="stylesheet" />
    <link href="../Css/responsive.css" rel="stylesheet" />
    <link href="../Css/font-awesome.min.css" rel="stylesheet" />
    <link rel="icon" href="../ektafavicon.png" type="im" sizes="16x16" />
      <link href="Css/PaymentCSS/css/demo.css" rel="stylesheet" />
            <link href="Css/PaymentCSS/css/styles.css" rel="stylesheet" />
    <style>
        .errorMessage{
          line-height: 2.428571;
        }
        .ridge {
            border-style: ridge
        }

        .form-group {
            margin-bottom: 0px;
        }
    </style>
</head>
<body>
   <%-- <header id="header">
        <div class="top-bar">

            <div class="container-fluid">
                <div class="row">

                    <div style="float: left;" class="col-sm-10">
                        <div class="top-number ">
                            <p class="text-info ">
                                <a href="mailto:ektanavnirmantrust@gmail.com "><i class="fa fa-envelope"></i>ektanavnirmantrust@gmail.com </a>
                                <label class="lable1"><b>Tax Benefits:</b> Registered u/s 12A of the Income Tax Act, 1961. Donations exempted u/s 80G of the Income Tax Act 1961. </label>

                            </p>

                        </div>
                    </div>

                </div>

                <div>
                    <div class="social col-sm-3 pull-right">
                        <ul class="social-share ">

                            <li><a href="https://www.facebook.com/runforequality14april/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="https://twitter.com/TrustEkta" target="_blank"><i class="fa fa-twitter"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
     
        <div class="container" style="width: 100%;">
            <div class="row col-lg-2 col-xs-12 text-center">
                <a href="../Home">
                    <img src="../Images/logo2.png" alt="logo" style="padding-top: 7px;" /></a>
            </div>
            <div class="col-lg-2 col-xs-12 pull-right text-center nopadding-right " style="margin: 5px 0px 0px 0px">

                <img class="" width="100" height="100" src="../Images/ambd.png" />
            </div>
            <div class="col-lg-8 col-xs-12" style="color: #50255b; font-size: 25px; text-align: center; font-weight: bold; font-family: Verdana; margin: 20px 0px 5px 0px">
                <strong>Ekta Navnirman Trust</strong>
                <p style="font-size: 10px; font-family: Arial; color: #f57400; margin: -5px 0px 0px 160px;" class="p">Helping People, changing lives.</p>
            </div>
        </div>
    </header>--%>
     <div class="container-fluid">
       <header>
            <div class="limiter">
                <h3 style=" text-align: center;font-family: 'Open Sans', sans-serif; float:initial" >Payment Process</h3>
                
            </div>
        </header>
        <form id="form1"  action="PaymentRequest.aspx" method="post" runat="server" >
           
              <%--  <div class="form-group">
                    <label class="control-label col-sm-4" for="First Name:">First Name:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtFirstName" runat="server" class="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqFirstName" ControlToValidate="txtFirstName" CssClass="errorMessage" ErrorMessage="* First Name is required" ForeColor="Red" ToolTip="Please Enter First Name"></asp:RequiredFieldValidator>
                    </div>
                </div>--%>
              <%-- <div class="form-group">
                    <label class="control-label col-sm-4" for="Last Name:">Last Name:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtLastName" runat="server" class="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqLastName" ControlToValidate="txtLastName" CssClass="errorMessage" ErrorMessage="* Last Name is required" ForeColor="Red" ToolTip="Please Enter Last Name"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="Street:">Street:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtStreet" runat="server" class="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqStreet" ControlToValidate="txtStreet" CssClass="errorMessage" ErrorMessage="* Street name is required" ForeColor="Red" ToolTip="Please Enter Street Name"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="City:">City:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtCity" runat="server" class="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqCity" ControlToValidate="txtCity" CssClass="errorMessage" ErrorMessage="* City name is required" ForeColor="Red" ToolTip="Please Enter City Name"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="State:">State:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtState" runat="server" class="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqState" ControlToValidate="txtState" CssClass="errorMessage" ErrorMessage="* State name is required" ForeColor="Red" ToolTip="Please Enter Your State"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-4" for="Phone:">Phone:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtPhone" runat="server" class="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqPhone" ControlToValidate="txtPhone" CssClass="errorMessage" ErrorMessage="* Phone number is required" ForeColor="Red" ToolTip="Please Enter valid Phone Number"></asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="regexpPhone" runat="server"  
        ControlToValidate ="txtPhone" CssClass="errorMessage" ErrorMessage="* Must Enter 10 Digit number" ValidationExpression="[0-9]{10}" ForeColor="Red" ToolTip="Please enter 10 digits number "></asp:RegularExpressionValidator> --%>
              <%-- <div class="form-group">
                    <label class="control-label col-sm-4" for="Email:">Email:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtEmail" runat="server" class="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail" CssClass="errorMessage" ErrorMessage="* Email Id is required" ForeColor="Red" ToolTip="Please Enter valid Email"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ForeColor="Red" CssClass="errorMessage" ErrorMessage="Please enter valid email id format." />
                    </div>
                </div>--%>
              <%-- <div class="form-group">
                    <label class="control-label col-sm-4" for="Zip:">Zip:</label>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtZip" runat="server" class="form-control"> </asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="reqZip" ControlToValidate="txtZip" CssClass="errorMessage" ErrorMessage="* Zip code is required" ForeColor="Red" ToolTip="Please Enter Zip Code"></asp:RequiredFieldValidator>
                    </div>
                </div>--%>
              <%-- </div>--%>
              <%--  <div class=" ridge col-sm-6" style="border-radius: 10px 10px 10px 10px">
                <h4 class="heading-one">Payment Details:</h4>
                <%--<label class="control-label">Payment Details:</label>--%>
              <%-- <div class="form-group">
      <label class="control-label col-sm-4" for="Payment Option:">Payment Option:</label>
     <div class="col-sm-6">          
        <asp:DropDownList ID="ddlPaymentOption" runat="server" class="form-control"> 
                    <asp:ListItem Text="Credit Card" Value="cc"></asp:ListItem>
                    <asp:ListItem Text="Debit Card" Value="dc"></asp:ListItem>
                    <asp:ListItem Text="NetBanking" Value="nb"></asp:ListItem>
                    <asp:ListItem Text="Wallet" Value="wt"></asp:ListItem>                  
        </asp:DropDownList>         
      </div>
        <%--<asp:RequiredFieldValidator runat="server" ID="reqPaymentOption" ControlToValidate="ddlPayOpt" CssClass="errorMessage" ErrorMessage="* Payment option is required" ForeColor="Red" ToolTip="Please choose payment option" ></asp:RequiredFieldValidator>--%>
             <%--</div>--%>               
              <%--  <div class="form-group">
        <br />
      <label class="control-label col-sm-4" for="Card Number:">Card Number:</label>
     <div class="col-sm-6">          
        <asp:TextBox ID="txtCardNumber" runat="server" class="form-control"> </asp:TextBox>
        <asp:RequiredFieldValidator runat="server" ID="reqCardNumber" ControlToValidate="txtCardNumber" CssClass="errorMessage" ErrorMessage="* Card number is required" ForeColor="Red" ToolTip="Please Enter Card Number" ></asp:RequiredFieldValidator>
        <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  
        ControlToValidate ="txtCardNumber" CssClass="errorMessage" ErrorMessage="* Must Enter 16 Digits" ValidationExpression="[0-9]{16}" ForeColor="Red" tooltip="Please enter 16 Digits Card Number "></asp:RegularExpressionValidator> --%>
              <%-- </div>--%>
              <%-- </div>--%>
              <%--  <div class="form-group">
      <label class="control-label col-sm-4" for="Expiry Date:(MMYYYY) ">Expiry Date:(MMYYYY)</label>
      <div class="col-sm-6">                 
          <asp:DropDownList ID="ddlExpiryMonth" runat="server" class="form-control col-sm-3 " >
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
         
          <asp:DropDownList ID="ddlExpiryYear" runat="server" class="form-control col-sm-3 ">
                    <asp:ListItem>2018</asp:ListItem>
                    <asp:ListItem>2019</asp:ListItem>
                    <asp:ListItem>2020</asp:ListItem>
                    <asp:ListItem>2021</asp:ListItem>
                    <asp:ListItem>2022</asp:ListItem>
                    <asp:ListItem>2023</asp:ListItem>
                    <asp:ListItem>2024</asp:ListItem>
                    <asp:ListItem>2025</asp:ListItem>
                    <asp:ListItem>2026</asp:ListItem>
                    <asp:ListItem>2027</asp:ListItem>
                    <asp:ListItem>2028</asp:ListItem>
                    <asp:ListItem>2029</asp:ListItem>
                    </asp:DropDownList>          

      </div>
        <%-- <asp:RequiredFieldValidator runat="server" ID="reqExpiryMonth" ControlToValidate="ddlExpiryMonth" ErrorMessage="*" forecolor="Red" ToolTip="Please choose Expiry Month" ></asp:RequiredFieldValidator>
         <asp:RequiredFieldValidator runat="server" ID="reqExpiryYear" ControlToValidate="ddlExpiryYear" ErrorMessage="*" ForeColor="Red" ToolTip="Please choose Expiry Year" ></asp:RequiredFieldValidator>--%>
              <%-- </div>--%>
              <%--<div class="form-group">
        <br />
      <label class="control-label col-sm-4" for="CardSecurityCode:">Card Security Code:</label>
      <div class="col-sm-6">          
        <asp:TextBox ID="txtCardSecurityCode" runat="server" class="form-control"> </asp:TextBox>
           <asp:RequiredFieldValidator runat="server" ID="reqCardSecurityCode" ControlToValidate="txtCardSecurityCode" ErrorMessage="* Card Security Code is required" ForeColor="Red" ToolTip="Enter valid Card Security Code" ></asp:RequiredFieldValidator>
      </div>       
    </div>--%>
              <%-- </div>--%>
              <%--<div class="form-group">
            <label class="control-label col-sm-4" for="T-Shirt:">T-Shirt:</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlTshrt" runat="server" class="form-control col-sm-2">
                    <asp:ListItem>S</asp:ListItem>
                    <asp:ListItem>M</asp:ListItem>
                    <asp:ListItem>L</asp:ListItem>
                    <asp:ListItem>XL</asp:ListItem>
                </asp:DropDownList>
            </div>
            
        </div>--%>
              <%-- <div class="form-group">
            <br />
            <label class="control-label col-sm-4" for="Quantity:">Quantity:</label>
            <div class="col-sm-6">
                <asp:DropDownList ID="ddlQty" runat="server" class="form-control col-sm-2">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                </asp:DropDownList>
                <br />
            </div>
            
        </div>
    </div>--%>
              <%--<div class="form-group">
        <label class="control-label col-sm-8"></label>
        <div class="col-sm-8 col-lg-offset-6">
            <asp:Button ID="inprocess" runat="server" Text="Submit" class="btn" />
        </div>
    </div>--%>


       <%--  <header>
            <div class="">   
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

                                    <li><a href="https://www.facebook.com/runforequality14april/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                    <li><a href="https://twitter.com/TrustEkta" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
     
        <div class="container" style="width: 100%;background-color: #fff;">
            <div class="row col-lg-2 col-xs-12 text-center">
                <a href="../Home">
                    <img src="../Images/logo2.png" alt="logo" style="padding-top: 7px;" /></a>
            </div>
            <div class="col-lg-2 col-xs-12 pull-right text-center nopadding-right " style="margin: 5px 0px 0px 0px">

                <img class="" width="100" height="100" src="../Images/ambd.png" />
            </div>
            <div class="col-lg-8 col-xs-12" style="color: #50255b; font-size: 25px; text-align: center; font-weight: bold; font-family: Verdana; margin: 20px 0px 5px 0px">
                <strong>Ekta Navnirman Trust</strong>
                <p style="font-size: 10px; font-family: Arial; color: #f57400; margin: -5px 0px 0px 160px;" class="p">Helping People, changing lives.</p>
            </div>
        </div>
               
          </div>
            
        </header>--%>
       
 <%--   <div class="creditCardForm">
            <div class="heading">
                <h1>Customer Information</h1>
            </div>
            <div class="payment">

              
			<div class="row">
				<div class="col-xs-6">
                        <label for="First Name">First Name:</label>
                         <input type="text" class="form-control" runat="server" id="txtFirstName"/>
                        <asp:RequiredFieldValidator runat="server" ID="reqFirstName" ControlToValidate="txtFirstName"  ValidationGroup="PaymentInfo" ErrorMessage="* First Name is required" ForeColor="Red" ToolTip="Please Enter First Name"></asp:RequiredFieldValidator>
                   
				</div>
				<div class="col-xs-6">
                     <label for="Last Name">Last Name:</label>
                    <input type="text" class="form-control" runat="server" id="txtLastName"/>
                        <asp:RequiredFieldValidator runat="server" ID="reqLastName" ControlToValidate="txtLastName"  ValidationGroup="PaymentInfo" ErrorMessage="* Last Name is required" ForeColor="Red" ToolTip="Please Enter Last Name"></asp:RequiredFieldValidator>
                 </div>
                    <div class="col-xs-6">
                        <label for="Email">Email:</label>
                        <input type="text" class="form-control" runat="server" id="txtEmail"/>
                    <asp:RequiredFieldValidator runat="server" ID="reqEmail" ControlToValidate="txtEmail"  ValidationGroup="PaymentInfo" ErrorMessage="* Email Id is required" ForeColor="Red" ToolTip="Please Enter valid Email"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtEmail" ForeColor="Red" CssClass="errorMessage" ErrorMessage="Please enter valid email id format." />
                    </div>
                    <div class="col-xs-6">
                        <label for="Phone">Phone:</label>
                        <input type="text" class="form-control" runat="server" id="txtPhone"/>
                        <asp:RequiredFieldValidator runat="server" ID="reqPhone" ControlToValidate="txtPhone" CssClass="errorMessage" ValidationGroup="PaymentInfo" ErrorMessage="* Phone number is required" ForeColor="Red" ToolTip="Please Enter valid Phone Number"></asp:RequiredFieldValidator>
                    </div>				
                <div class="col-xs-6" >
                        <label for="Address">Address:</label>
                        <input type="text" runat="server" class="form-control" id="txtAddress"/>
                  <asp:RequiredFieldValidator runat="server" ID="reqStreet" ControlToValidate="txtAddress" CssClass="errorMessage" ValidationGroup="PaymentInfo" ErrorMessage="* Address  is required" ForeColor="Red" ToolTip="Please enter your address"></asp:RequiredFieldValidator>
                    </div>
                     <div class="col-xs-6">
                        <label for="City">City:</label>
                         <br />
                        <input type="text" class="form-control" runat="server" id="txtCity"/>
                   <asp:RequiredFieldValidator runat="server" ID="reqCity" ControlToValidate="txtCity" CssClass="errorMessage" ValidationGroup="PaymentInfo" ErrorMessage="* City name is required" ForeColor="Red" ToolTip="Please Enter City Name"></asp:RequiredFieldValidator>
                    </div>
                
                    <div class="col-xs-6">
                        <br />
                        <label for="State">State:</label>
                        <input type="text" class="form-control" runat="server" id="txtState"/>
                        <asp:RequiredFieldValidator runat="server" ID="reqState" ControlToValidate="txtState" CssClass="errorMessage" ValidationGroup="PaymentInfo" ErrorMessage="* State name is required" ForeColor="Red" ToolTip="Please Enter Your State"></asp:RequiredFieldValidator>
                    </div>
                    
                
                    <div class="col-xs-6">
                        <br />
                        <label for="Zip">Zip:</label>
                        <input type="text" class="form-control" runat="server" id="txtZip"/>
                         <asp:RequiredFieldValidator runat="server" ID="reqZip" ControlToValidate="txtZip" CssClass="errorMessage" ValidationGroup="PaymentInfo" ErrorMessage="* Zip code is required" ForeColor="Red" ToolTip="Please Enter Zip Code"></asp:RequiredFieldValidator>
                    </div>
			</div>     
                    

                   
            </div>
        </div>--%>  
    
<%--             <div class="creditCardForm">
            <div class="heading">
                <h1>Order Details</h1>
            </div>
            <div class="payment">     
                
                <div class="row">
				<div class="col-xs-6">
                         <label for="T-Shirt">T-Shirt:</label>     
                        <select id="ddlTShrt" class="" runat="server" style="width: 100%;">
                            <option>S</option>
                            <option>M</option>
                            <option>L</option>
                            <option>XL</option>
                        </select>
				</div>
				<div class="col-xs-6">
                    <label>Quantity</label>   
                      <select id="ddlQuantity" class="" runat="server" style="width: 100%;">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                        </select>
				</div>
			</div>  

        
                    </div>
        </div>  --%>

        <div class="creditCardForm">
            <div class="heading">
                <h1>Confirm Purchase</h1>
            </div>
            <div class="payment">                
                    <div class="form-group owner">
                        <label for="owner">Card Holder's Name</label>
                        <input type="text" class="form-control" runat="server" id="CardHolder"/>
                         <asp:RequiredFieldValidator runat="server" ID="reqCardHolder" ControlToValidate="CardHolder"  ValidationGroup="PaymentInfo" ErrorMessage="* Card holder's name is required" ForeColor="Red" ToolTip="Please Enter card holder Name " ></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group CVV">
                        <label for="cvv">CVV</label>
                        <input type="password" class="form-control" runat="server" id="CardSecurityCode"/>
                        <asp:RequiredFieldValidator runat="server" ID="reqCardSecurityCode" ControlToValidate="CardSecurityCode" ValidationGroup="PaymentInfo" ErrorMessage="* CVV is required" ForeColor="Red" ToolTip="Enter valid Card Security Code" ></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group" id="card-number-field">
                        <label for="cardNumber">Card Number</label>
                        <input type="text" class="form-control" maxlength="16" runat="server" id="CardNumber"/>
                         <asp:RequiredFieldValidator runat="server" ID="reqCardNumber" ControlToValidate="CardNumber" ValidationGroup="PaymentInfo" ErrorMessage="* Card number is required" ForeColor="Red" ToolTip="Please Enter Card Number" ></asp:RequiredFieldValidator>
                    </div>
                <div class="form-group" id="expiration-date">
                        <label>Expiration Date</label>
                        <select id="ddlExpiryMonth" runat="server">
                            <option value="01">January</option>
                            <option value="02">February </option>
                            <option value="03">March</option>
                            <option value="04">April</option>
                            <option value="05">May</option>
                            <option value="06">June</option>
                            <option value="07">July</option>
                            <option value="08">August</option>
                            <option value="09">September</option>
                            <option value="10">October</option>
                            <option value="11">November</option>
                            <option value="12">December</option>
                        </select>
                        <select id="ddlExpiryYear" runat="server">
                            <option> 2018</option>
                            <option> 2019</option>
                            <option> 2020</option>
                            <option> 2021</option>
                            <option> 2018</option>
                            <option> 2019</option>
                            <option> 2020</option>
                            <option> 2021</option>
                            <option> 2022</option>
                            <option> 2023</option>
                            <option> 2024</option>
                            <option> 2025</option>
                            <option> 2026</option>
                            <option> 2027</option>
                            <option> 2028</option>
                            <option> 2029</option>
                            <option> 2030</option>                       
                        </select>
                    </div>
                    <div class="form-group" id="credit_cards">
                       <img src="Css/PaymentCSS/images/visa.jpg" id="visa"/>
                        <img src="Css/PaymentCSS/images/mastercard.jpg" id="mastercard"/>
                        <img src="Css/PaymentCSS/images/amex.jpg" id="amex"/>
                    </div>
                    <div class="form-group" id="pay-now">
                       <%-- <button type="submit" class="btn btn-default" ValidationGroup="paymentinfo" id="inprocess">Confirm</button>--%>
                        <asp:Button ID="inprocess" runat="server" ValidationGroup="PaymentInfo" Text="Confirm" class="btn btn-default" />
                        
                    </div>                
            </div>
        </div>
      </form> 
           
   </div>
</body>

</html>
<footer id="footer" class="midnight-blue">
    <div class="container">
        <div class="row">
            <div class="col-sm-3">Dedicated for a Better Tomorrow
                <div style="padding-top: 12px"></div>
            </div>
            <div class="col-sm-9" style="text-align: right">
                <ul>
                    <li><a href="../TermsAndCondition.aspx" target="_blank">Terms and Conditions</a></li>
                </ul>
            </div>
            <div class="col-sm-12 rezinfo">
                <div class="col-sm-6 rezinfo"><span id="siteseal">
                    <script async type="text/javascript" src="https://seal.godaddy.com/getSeal?sealID=Tx5CaysYwyffrq8bzM0EFkoTXgfJAgBGMcc62iZT5BYncW3t0uStsuFiZsvW"></script>
                </span></div>
                <div class="col-sm-6 rezinfo" style="text-align: right"><small>Website Developed & Maintained By: - </small><a href="http://www.kasproit.com/" style="color: red; font-weight: bold;" target="_blank">Kaspro Solutions Pvt Ltd</a><br />
                  <%--  <label style="font-size: 11px;">Last Updated on: 23/03/2018 4:00 PM</label>--%></div>
            </div>


        </div>
    </div>
</footer>
