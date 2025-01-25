<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Inner.Master" CodeBehind="SendNotificationMIP.aspx.vb" Inherits="EktaTrust.SendNotificationMIP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>

        $(document).ready(function () {

            HideLogdetails();

        });

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
        /* CSS REQUIRED */
        .state-icon {
            left: -5px;
        }
       

        .list-group-item-primary {
            color: rgb(255, 255, 255);
            background-color: rgb(66, 139, 202);
        }

        /* DEMO ONLY - REMOVES UNWANTED MARGIN */
        .well .list-group {
            margin-bottom: 0px;
        }
    </style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
   
    <style>
        .container {
            border: 2px solid #ccc;
            background-color: #eee;
            border-radius: 5px;
            padding: 16px;
            margin: 16px 0;
        }

            .container::after {
                content: "";
                clear: both;
                display: table;
            }

            .container img {
                float: left;
                margin-right: 20px;
                border-radius: 50%;
            }

            .container span {
                font-size: 20px;
                margin-right: 15px;
            }

        @media (max-width: 500px) {
            .container {
                text-align: center;
            }

                .container img {
                    margin: auto;
                    float: none;
                    display: block;
                }
        }
 .panel-primary>.panel-heading {
    font-size: 17px;
    color: #fff;
    background-color: #428bca;
    border-color: #428bca;
}
    </style>
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }
        .btn {
            width:100%;
            font-size: 17px;
            
        }
        

   
    </style>

    <div class="container-fluid main-container">
        <div class="col-md-2 sidebar">
            <div class="row">
                <!-- uncomment code for absolute positioning tweek see top comment in css -->
                <div class="absolute-wrapper"></div>
                <!-- Menu -->
                <div class="side-menu">
                    <nav class="navbar navbar-default" role="navigation">

                        <!-- Main Menu -->
                        <div class="side-menu-container">
                            <ul class="nav navbar-nav">
                                <li><a href="DashBoard.aspx">Dashboard</a></li>
                                <li><a href="TrainingActivity.aspx">Training Activites</a></li>
                                <li><a href="Joining.aspx">Joining</a></li>
                                <li><a href="ContactDetails.aspx">Contact Detail</a></li>
                                <li><a href="#">Donation</a></li>
                                <li><a href="SUGGESTIONTRUSTACTIVITIES.aspx">Trust Activities</a></li>
                                <li><a href="EventDetails.aspx">Events</a></li>
                                <li><a href="MIPRegistrationDetails.aspx">MIP Registration Details</a></li>
                                <li><a href="MIPFacultyRegistrationDetails.aspx">Registration Details</a></li>
                                <li class="active"><a href="SendNotificationMIP.aspx">Send Notification</a></li>
                                <li><a href="ModificationEmailAndSms.aspx">New Template</a></li>
                                <li><a href="TemplateListing.aspx">Templates</a></li>
                                <li><a href="LogDetails.aspx" id="LogDetails">Log Details</a></li>
                                <li><a href="UserDetails.aspx">Users</a></li>
                                <li><a href="MatrimonialDetails.aspx">Matrimonial Details</a></li>
                                <li><a href="CareerCounsellingDetails.aspx">Career Counselling Details</a></li>
                                <li><a href="AtrocityReportingDetails.aspx">Atrocities Reporting Details</a></li>
                                <li><a href="AddNotification.aspx">Add New Notification</a></li>
                                <li><a href="DonationDetails.aspx">Donation Details</a></li>
                            </ul>

                        </div>
                        <!-- /.navbar-collapse -->
                    </nav>
                </div>
            </div>
        </div>
        <div class="col-md-6 ">
           
             <div class="panel panel-primary">
      <div class="panel-heading"> <input id="btnNotification" class="btn" type="button" value=" Send Notification" style="height:30px;width:200px;padding-bottom: 28px; color:white"/><div class="pull-right">
            <input id="btnNewUser" type="button" class="btn" style="height:30px;padding-bottom: 28px;color:white" value="Send Notification to Anonymous"/></div> </div>
      <div class="panel-body">
 
          <div class="col-lg-12">
           <h4 style="text-align:center;"> <span class="label label-success" id="lblSucessMessages"></span><span class="label label-danger" id="NotValidEmail"></span></h4>
              <asp:Panel ID="Panel1" runat="server">
               <div class="form-group col-sm-12">
                        <label style="color:#777">Notification To<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="drpEvent" ForeColor="Red" ErrorMessage="*" ToolTip="Please Enter Event" /></label>
                        <%--<input type="text" name="subject" class="form-control" required>--%>
                        <asp:DropDownList runat="server" class="form-control" ID="drpEvent">
                            <asp:ListItem Value="1">---Select Value---</asp:ListItem>
                            <asp:ListItem Value="2">MOCK INTERVIEW PROGRAMME</asp:ListItem>
                            <asp:ListItem Value="3">EVENT REGISTRATION</asp:ListItem>
                            <asp:ListItem Value="4">MIP FACULTY REGISTRATION</asp:ListItem>
                            <asp:ListItem Value="5">SUBSCRIBE</asp:ListItem>
                        </asp:DropDownList>
                  </div>
                
                    <div class="form-group col-sm-12">
                      
                   <div class="panel panel-default">
                   <div class="panel-heading" style="color:#777">Message list  <div style="float: right;">Check all user <input type="checkbox" id="select_all" /></div> </div>   
                <div class="well" style="max-height: 300px; overflow:scroll;" id="DisplayAllUser">
                    
                </div>
                </div>
   
                   </div>

                </asp:Panel>
              <asp:Panel ID="Panel4" runat="server">
                 <div class="form-group col-sm-6">
                        <div class="panel-heading" style="color:#777">Mobile Number<div style="float: right;"><input type="checkbox" id="chkMobile" checked="checked" /></div> </div> 
                        <asp:TextBox ID="txtMobileNumber" runat="server" Rows="2" Columns="30" TextMode="MultiLine" class="form-control" placeholder="Mobile Number"></asp:TextBox>
                 <span style="font-size:smaller">Note: incase of multiple numbers, make them comma seperated.</span>   
                 </div>
                   <div class="form-group col-sm-6">
                        <div class="panel-heading" style="color:#777">Eamil Address<div style="float: right;"><input type="checkbox" id="chkEmail" /></div> </div> 
                        <asp:TextBox ID="txtEamilAddress" runat="server" Rows="2" Columns="30" TextMode="SingleLine" class="form-control" placeholder="Email Address"></asp:TextBox>
                    </div>
              </asp:Panel>
                    <div class="form-group col-sm-12" id="divSendSmsAnonymous">
                        <div class="panel-heading" style="color:#777">Mobile Message  <span class="label label-danger" id="mobileMessage"></span><div class="pull-right" style="padding-bottom: 8px;">
                            <asp:DropDownList ID="drpMobileMessage" runat="server" class="form-control">
                               
                            </asp:DropDownList></div> <div style="float: left;margin-right:5px"><input type="checkbox" id="checkBoxMobile" ></div> </div> 
                        <asp:TextBox ID="MobileAddress" runat="server" Rows="10" Columns="30" TextMode="multiline" class="form-control" placeholder="Mobile Messages"></asp:TextBox>
                    </div>
               <div class="form-group col-sm-12" id="divSendEmailAnonymous">
                    <div class="panel-heading" style="color:#777">Email Message  <span class="label label-danger" id="emailMessage"></span><div class="pull-right" style="padding-bottom: 8px;">
                            <asp:DropDownList ID="drpEmailMessage" runat="server" class="form-control">
                              <%--  <asp:ListItem Value="1">---Select Category Message---</asp:ListItem>
                                <asp:ListItem Value="2">For MIP Registration</asp:ListItem>
                                <asp:ListItem Value="3">For Event Registration</asp:ListItem>
                                <asp:ListItem Value="4">For Faculty Registration</asp:ListItem>--%>
                            </asp:DropDownList></div><div style="float:left;margin-right:5px"><input type="checkbox" id="checkBoxEmail" ></div> </div>  
                      <asp:TextBox ID="Email" runat="server" Rows="10" Columns="40" TextMode="multiline" class="form-control" placeholder="Email Messages"></asp:TextBox>
                        <%--<asp:TextBox ID="Email" runat="server" Rows="10" Columns="40" onKeyUp="Count(this,160)" onChange="Count(this,160)" TextMode="multiline" class="form-control" placeholder="Email Messages"></asp:TextBox>--%>
                    </div>
              <asp:Panel ID="Panel2" runat="server">
                    <div class="form-group col-sm-12">
                        <input type="button"  class="btn btn-primary btn-lg" onclick="GetAllSelectNotificationValue()" value="Submit Message"></input>
                       <%-- <asp:Button ID="Button1" runat="server" class="btn btn-info" value="Send Notification"  Text="Send Notification" OnClientClick="GetAllSelectNotificationValue()"/>--%>
              </div>
                    </asp:Panel>
                <asp:Panel ID="Panel3" runat="server">
                   
                    <div id="panel" class="form-group col-sm-12">
                         <span class="label label-success" id="spnMessageNotification" style="margin-left:46%"></span><br /><br />
                        <input type="button"  class="btn btn-primary btn-lg" onclick="sendNewUser()" value="Submit Messages" />
                       <%-- <asp:Button ID="Button1" runat="server" class="btn btn-info" value="Send Notification"  Text="Send Notification" OnClientClick="GetAllSelectNotificationValue()"/>--%>
              </div>
                    </asp:Panel>

                </div></div>
    </div>
            
        </div>
    </div>
    
    <script type="text/javascript">

	
        $("#select_all").change(function () {  //"select all" change 
            var status = this.checked; // "select all" checked status
            $('.checkboxs').each(function () { //iterate all listed checkbox items
                this.checked = status; //change ".checkbox" checked status
            });
        });

        $('.checkboxs').change(function () { //".checkbox" change 
            //uncheck "select all", if one of the listed checkbox item is unchecked
            if (this.checked == false) { //if this item is unchecked
                $("#select_all")[0].checked = false; //change "select all" checked status to false
            }

            //check "select all" if all checkbox items are checked
            if ($('.checkboxs:checked').length == $('.checkboxs').length) {
                $("#select_all")[0].checked = true; //change "select all" checked status to true
            }
        });

     ///This fuction used to Get user list from data base.
        $(function () {
            $("#<%=drpEvent.ClientID%>").change(function () {
                if ($("#<%=drpEvent.ClientID%>").val() > 1) {
                    $.ajax({
                        type: "POST",
                        url: "/SendNotificationMIP.aspx/GetDataforMessage",
                        data: '{name: "' + $("#<%=drpEvent.ClientID%>")[0].value + '" }',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        var $data = $('#DisplayAllUser').empty();
                        var GetData = response.d;
                        $(GetData).each(function () {
                            var $data = $('#DisplayAllUser');
                            $data.append('<ul class="list-group checked-list-box"><li class="list-group-item list-group-item-default "  style="cursor: pointer;font-family: serif;font-weight: normal;"><input name="check[]" class="checkboxs" type="checkbox" id=' + this.Id + ' value=' + this.Id + '><span style="padding-left:10px"> Name: ' + this.Name + ', Mobile : ' + this.MobileNumber + ', Eamil : ' + this.EamilID + '</span></li></ul>');
                        })

                    },
                    failure: function (response) {

                    }
                  });

            }
            else {

                $("#NotValidEmail").show();
                $('#NotValidEmail').html("Please select Notification To.");
                setTimeout(function () { $("#NotValidEmail").hide(); }, 10000);


            }
            });
        });
          
              
   

        ///This send notification listing user.
        function GetAllSelectNotificationValue()
        { 
            if ($("#select_all").is(":checked"))
                {
                
                var ID =0;
                var ObjSend = {};
                $('.checkboxs:checked').each(function (i) {
                    ID = ID+","+ $(this).val();
                });
                ObjSend.Id = ID;
               
                if ($("#checkBoxMobile").is(":checked") && $("#checkBoxEmail").is(":checked")) {
                    if ($("#<%=MobileAddress.ClientId %>").val() == '') {
                        $("#mobileMessage").show();
                        $('#mobileMessage').html("Please Enter Your Mobile Messages.");
                        setTimeout(function () { $("#mobileMessage").hide(); }, 10000);
                    }
                    else if ($("#<%=Email.ClientId %>").val() == '') {
                        $("#emailMessage").show();
                        $('#emailMessage').html("Please Enter Your Mobile Messages.");
                        setTimeout(function () { $("#emailMessage").hide(); }, 10000);
                    }
                    else {
                        ObjSend.MobileMessage = $("#<%=MobileAddress.ClientId %>").val();
                        ObjSend.MobileType = ("MobileType");
                        ObjSend.EmailMessage = $("#<%=Email.ClientId %>").val();
                        ObjSend.EmailType = ("EmailType");
                        ObjSend.SendMessageTo = $("#<%=drpEvent.ClientID%>").val();
                        $.ajax({
                            type: "POST",
                            url: "/SendNotificationMIP.aspx/SendNotification",
                            data: "{ObjSend:" + JSON.stringify(ObjSend) + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var $data = $('#DisplayAllUser').empty();
                                var GetData = response.d;
                                $(GetData).each(function () {
                                    $("#lblSucessMessages").show();
                                    $("#spnMessageNotification").show();
                                    $("#spnMessageNotification").html(this.SuccessfullMessage);
                                    $('#lblSucessMessages').html(this.SuccessfullMessage);
                                    setTimeout(function () {
                                        $("#spnMessageNotification").hide();
                                        $("#lblSucessMessages").hide();
                                    }, 10000);
                                    $("#<%=Email.ClientId %>").val('');
                                    <%--$("#<%=MobileAddress.ClientID%>").val('');--%>
                                })
                            }
                        });
                    }
                   
                   
                }
                    //This condition used to checked Mobile option.
                else if ($("#checkBoxMobile").is(":checked")) {
                    if ($("#<%=MobileAddress.ClientId %>").val() == '') {
                        $("#mobileMessage").show();
                        $('#mobileMessage').html("Please Enter Your Mobile Messages.");
                        setTimeout(function () { $("#mobileMessage").hide(); }, 10000);
                    }
                    else {
                        ObjSend.MobileMessage = $("#<%=MobileAddress.ClientId %>").val();
                        ObjSend.MobileType = ("MobileType");
                        ObjSend.SendMessageTo = $("#<%=drpEvent.ClientID%>").val();
                        $.ajax({
                            type: "POST",
                            url: "/SendNotificationMIP.aspx/SendNotification",
                            data: "{ObjSend:" + JSON.stringify(ObjSend) + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var $data = $('#DisplayAllUser').empty();
                                var GetData = response.d;
                                $(GetData).each(function () {
                                    var $data = $('#DisplayAllUser').empty();
                                    var GetData = response.d;
                                    $(GetData).each(function () {
                                        $("#lblSucessMessages").show();
                                        $('#lblSucessMessages').html(this.SuccessfullMessage);
                                        $("#spnMessageNotification").show();
                                        $("#spnMessageNotification").html(this.SuccessfullMessage);
                                        setTimeout(function () {
                                            $("#lblSucessMessages").hide();
                                            $("#spnMessageNotification").hide();
                                        }, 10000);
                                        $("#<%=Email.ClientId %>").val('');
                                        <%--$("#<%=MobileAddress.ClientID%>").val('');--%>
                                    })
                                })
                            }
                        });
                    }
                }
                    //This condition used to checked mail option.
                else if ($("#checkBoxEmail").is(":checked")) {
                    if ($("#<%=Email.ClientId %>").val() == '') {
                        $("#emailMessage").show();
                        $('#emailMessage').html("Please Enter Your Mobile Messages.");
                        setTimeout(function () { $("#emailMessage").hide(); }, 10000);
                    } else {
                        ObjSend.EmailMessage = $("#<%=Email.ClientId %>").val();
                        ObjSend.EmailType = ("EmailType");
                        ObjSend.SendMessageTo = $("#<%=drpEvent.ClientID%>").val();
                        $.ajax({
                            type: "POST",
                            url: "/SendNotificationMIP.aspx/SendNotification",
                            data: "{ObjSend:" + JSON.stringify(ObjSend) + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var $data = $('#DisplayAllUser').empty();
                                var GetData = response.d;
                                $(GetData).each(function () {
                                    $("#lblSucessMessages").show();
                                    $('#lblSucessMessages').html(this.SuccessfullMessage);
                                    $("#spnMessageNotification").show();
                                    $("#spnMessageNotification").html(this.SuccessfullMessage);
                                    setTimeout(function () {
                                        $("#lblSucessMessages").hide();
                                        $("#spnMessageNotification").hide();
                                    }, 10000);
                                    $("#<%=Email.ClientId %>").val('');
                                    <%--$("#<%=MobileAddress.ClientID%>").val('');--%>
                                })
                            }
                        });
                    }
                }
               
                else {
                  
                    $("#NotValidEmail").show();
                    $('#NotValidEmail').html("Please select messages option.");
                    setTimeout(function () { $("#NotValidEmail").hide(); }, 10000);
                }
            }
                //This condition used to checked one by one send message option.
            else {
                if ($(".checkboxs").is(":checked"))
                {
               var ID =0;
                var ObjSend = {};
                $('.checkboxs:checked').each(function (i) {
                    ID = ID+","+ $(this).val();
                });
                ObjSend.Id = ID;
            
                if ($("#checkBoxMobile").is(":checked") && $("#checkBoxEmail").is(":checked")) {
                  
                    if ($("#<%=MobileAddress.ClientId %>").val() == '') {
                        $("#mobileMessage").show();
                        $('#mobileMessage').html("Please Enter Your Mobile Messages.");
                        setTimeout(function () { $("#mobileMessage").hide(); }, 10000);
                    }
                    else if ($("#<%=Email.ClientId %>").val() == '') {
                        $("#emailMessage").show();
                        $('#emailMessage').html("Please Enter Your Mobile Messages.");
                        setTimeout(function () { $("#emailMessage").hide(); }, 10000);
                    }
                    else {
                        ObjSend.MobileMessage = $("#<%=MobileAddress.ClientId %>").val();
                        ObjSend.MobileType = ("MobileType");
                        ObjSend.EmailMessage = $("#<%=Email.ClientId %>").val();
                        ObjSend.EmailType = ("EmailType");
                        ObjSend.SendMessageTo = $("#<%=drpEvent.ClientID%>").val();
                        $.ajax({
                            type: "POST",
                            url: "/SendNotificationMIP.aspx/SendNotification",
                            data: "{ObjSend:" + JSON.stringify(ObjSend) + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var $data = $('#DisplayAllUser').empty();
                                var GetData = response.d;
                                $(GetData).each(function () {
                                    $("#lblSucessMessages").show();
                                    $('#lblSucessMessages').html(this.SuccessfullMessage);
                                    $("#spnMessageNotification").show();
                                    $("#spnMessageNotification").html(this.SuccessfullMessage);
                                    setTimeout(function () {
                                        $("#lblSucessMessages").hide();
                                        $("#spnMessageNotification").hide();
                                    }, 10000);
                                    $("#<%=Email.ClientId %>").val('');
                                    <%--$("#<%=MobileAddress.ClientID%>").val('');--%>
                                })
                            }
                        });
                    }
                }
                else if ($("#checkBoxMobile").is(":checked")) {
                    if ($("#<%=MobileAddress.ClientId %>").val() == '') {
                        $("#mobileMessage").show();
                        $('#mobileMessage').html("Please Enter Your Mobile Messages.");
                        setTimeout(function () { $("#mobileMessage").hide(); }, 10000);
                    }
                    else {
                        ObjSend.MobileMessage = $("#<%=MobileAddress.ClientId %>").val();
                        ObjSend.MobileType = ("MobileType");
                        ObjSend.SendMessageTo = $("#<%=drpEvent.ClientID%>").val();
                        $.ajax({
                            type: "POST",
                            url: "/SendNotificationMIP.aspx/SendNotification",
                            data: "{ObjSend:" + JSON.stringify(ObjSend) + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var $data = $('#DisplayAllUser').empty();
                                var GetData = response.d;
                                $(GetData).each(function () {
                                    $("#lblSucessMessages").show();
                                    $('#lblSucessMessages').html(this.SuccessfullMessage);
                                    $("#spnMessageNotification").show();
                                    $("#spnMessageNotification").html(this.SuccessfullMessage);
                                    setTimeout(function () {
                                        $("#lblSucessMessages").hide();
                                        $("#spnMessageNotification").hide();
                                    }, 10000);
                                    $("#<%=Email.ClientId %>").val('');
                                    <%--$("#<%=MobileAddress.ClientID%>").val('');--%>
                                })
                            }
                        });
                    }
                }
                else if ($("#checkBoxEmail").is(":checked")) {
                    if ($("#<%=Email.ClientId %>").val() == '') {
                        $("#emailMessage").show();
                        $('#emailMessage').html("Please Enter Your Mobile Messages.");
                        setTimeout(function () { $("#emailMessage").hide(); }, 10000);
                    }
                    else {
                        ObjSend.EmailMessage = $("#<%=Email.ClientId %>").val();
                        ObjSend.EmailType = ("EmailType");
                        ObjSend.SendMessageTo = $("#<%=drpEvent.ClientID%>").val();
                        $.ajax({
                            type: "POST",
                            url: "/SendNotificationMIP.aspx/SendNotification",
                            data: "{ObjSend:" + JSON.stringify(ObjSend) + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var $data = $('#DisplayAllUser').empty();
                                var GetData = response.d;
                                $(GetData).each(function () {
                                    $("#lblSucessMessages").show();
                                    $('#lblSucessMessages').html(this.SuccessfullMessage);
                                    $("#spnMessageNotification").show();
                                    $("#spnMessageNotification").html(this.SuccessfullMessage);
                                    setTimeout(function () {
                                        $("#lblSucessMessages").hide();
                                        $("#spnMessageNotification").hide();
                                    }, 10000);

                                    $("#<%=Email.ClientId %>").val('');
                                    <%--$("#<%=MobileAddress.ClientID%>").val('');--%>
                                })
                            }
                        });
                    }
                }
              
                }
                else
                {
                    $("#NotValidEmail").show();
                    $('#NotValidEmail').html("Please selecte message list.");
                    setTimeout(function () { $("#NotValidEmail").hide(); }, 10000);
                }
            }

          
        }

        //Send New user Notification mail and sms.
       
        $("#chkMobile").click(function () {
            $('#Email').attr("disabled", $(this).is(":checked"));
        });

        //if ($("#chkMobile").is(":checked")) {
        //        alert("demo");
        //        $('#Email').attr("disabled", "disabled");
        //    }
      
        $(function () {
            $('#btnNotification').addClass('expand');
            $('#btnNewUser').addClass('mybtn');
        });
        // This is used to click and send notification.
        $(document).ready(function () {
            $('#btnNewUser').click(function () {
                $('#chkMobile').prop('checked');
                $('#divSendEmailAnonymous').hide();
                $("#btnNotification").removeClass("expand").addClass("mybtn");
                $(this).removeClass("mybtn").addClass('expand');
                $("#<%=Panel1.ClientID%>").hide();
                $("#<%=Panel2.ClientID%>").hide();
                $("#<%=Panel3.ClientID%>").show();
                $("#<%=Panel4.ClientID%>").show();
                //$("#chkMobile").removeAttr('checked');
               // $("#chkEmail").removeAttr('checked');
                $('#checkBoxMobile').hide();
                $('#checkBoxEmail').hide();
            })
            $('#btnNotification').click(function () {
                $('#divSendEmailAnonymous').show();
                $('#divSendSmsAnonymous').show();
                $("#btnNewUser").removeClass("expand").addClass("mybtn");
                $(this).removeClass("mybtn").addClass('expand');
                $("#<%=MobileAddress.ClientID%>").removeAttr("disabled", "disabled");
                $("#<%=Email.ClientID%>").removeAttr("disabled", "disabled");
                $("#<%=Panel1.ClientID%>").show();
                $("#<%=Panel2.ClientID%>").show();
                $("#<%=Panel3.ClientID%>").hide();
                $("#<%=Panel4.ClientID%>").hide();
                $('#checkBoxMobile').show();
                $('#checkBoxEmail').show();
            })
        });

                $(document).ready(function () {
                    $("#<%=Panel3.ClientID%>").hide();
                    $("#<%=Panel4.ClientID%>").hide();
                    $("#chkMobile").click(function () {
                        if ($('#chkEmail').is(':checked')) {
                            $('#divSendEmailAnonymous').show();
                            $('#divSendSmsAnonymous').show();
                        }
                       
                        else {
                            $('#divSendEmailAnonymous').hide();
                            $('#divSendSmsAnonymous').show();
                        }
                       
                    });
                    $("#chkEmail").click(function () {
                        if ($('#chkMobile').is(':checked')) {
                            $('#divSendEmailAnonymous').show();
                            $('#divSendSmsAnonymous').show();
                        }
                       
                        else
                        {
                            $('#divSendEmailAnonymous').show();
                            $('#divSendSmsAnonymous').hide();
                        }
                    
                    });

                  
        
                });

        function validateEmail(email) {
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            // return re.test(email);
           return true;
        }

        //This function used Save data and send sms and Mail

        function sendNewUser()
        {
            if ($('#chkMobile').is(':checked'))
            {
                if ($("#<%=MobileAddress.ClientID%>").val() != '') {
                    if ($("#<%=txtMobileNumber.ClientID%>").val() != '') {
                        var data = {};
                        data.MobileMessage = $("#<%=MobileAddress.ClientId %>").val();
                        data.MobileType = ("MobileType");
                        data.MobileNumber = $("#<%=txtMobileNumber.ClientId %>").val();
                        $.ajax({
                            type: "POST",
                            url: "/SendNotificationMIP.aspx/SendNewUserNotification",
                            data: "{data:" + JSON.stringify(data) + "}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (response) {
                                var $data = $('#DisplayAllUser').empty();
                                var GetData = response.d;
                                $(GetData).each(function () {
                                    $("#lblSucessMessages").show();
                                    $('#lblSucessMessages').html(this.SuccessfullMessage);
                                    $("#spnMessageNotification").show();
                                    $("#spnMessageNotification").html(this.SuccessfullMessage);
                                    setTimeout(function () {
                                        $("#lblSucessMessages").hide();
                                        $("#spnMessageNotification").hide();
                                    }, 10000);
                                    $("#<%=Email.ClientId %>").val('');
                                    $("#<%=txtMobileNumber.ClientId %>").val('');
                                    <%--$("#<%=MobileAddress.ClientID%>").val('');--%>
                                })
                            }
                        });
                    }
                    else {
                        $("#NotValidEmail").show();
                        $('#NotValidEmail').html("Please Enter Your Mobile Number.");
                        setTimeout(function () { $("#NotValidEmail").hide(); }, 10000);
                    }
                }
                else {
                    $("#mobileMessage").show(); 
                    $('#mobileMessage').html("Please Enter Your Mobile Messages.");
                    setTimeout(function () { $("#mobileMessage").hide(); }, 10000);
                }
            }

            if ($('#chkEmail').is(':checked')) {
                if ($("#<%=Email.ClientID%>").val() != '') {
                    var email = $("#<%=txtEamilAddress.ClientID%>").val();
                    if (validateEmail(email)) {
                        var data = {};
                        data.EmailMessage = $("#<%=Email.ClientId %>").val();
                         data.EmailType = ("EmailType");
                         data.EamilID = $("#<%=txtEamilAddress.ClientId %>").val();
                    $.ajax({
                        type: "POST",
                        url: "/SendNotificationMIP.aspx/SendNewUserNotification",
                        data: "{data:" + JSON.stringify(data) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var $data = $('#DisplayAllUser').empty();
                            var GetData = response.d;
                            $(GetData).each(function () {
                                $("#lblSucessMessages").show();
                                $('#lblSucessMessages').html(this.SuccessfullMessage);
                                $("#spnMessageNotification").show();
                                $("#spnMessageNotification").html(this.SuccessfullMessage);
                                setTimeout(function () {
                                    $("#lblSucessMessages").hide();
                                    $("#spnMessageNotification").hide();
                                }, 10000);
                                $("#<%=Email.ClientId %>").val('');
                                <%--$("#<%=MobileAddress.ClientID%>").val('');--%>
                            })
                        }
                    });
                    } else {
                        $("#NotValidEmail").show();
                        $('#NotValidEmail').html("Eamil address is not valid");
                        setTimeout(function () { $("#NotValidEmail").hide(); }, 10000);
                    }
                    return false;
                  
                 }
                 else {
                    $("#emailMessage").show();
                    $('#emailMessage').html("Please Enter Your Email Messages.");
                    setTimeout(function () { $("#emailMessage").hide(); }, 10000);
                 }
             }
        }

        ///This function used count textbox value.
        function Count(text, long) {
            var maxlength = new Number(long); // Change number to your max length.  
            if (text.value.length > maxlength) {
                text.value = text.value.substring(0, maxlength);
                alert(" Only " + long + " characters");
            }
        }

        ///This fuction used to Get Mobile Message from data base.
        $(function () {
            $("#<%=drpMobileMessage.ClientID%>").change(function () {
               
                if ($("#<%=drpMobileMessage.ClientID%>").val() > 0) {
               
                    var data = {};
                    data.Category = $("#<%=drpMobileMessage.ClientID%>").val();
                  
                    $.ajax({
                        type: "POST",
                        url: "/SendNotificationMIP.aspx/GetMessageCategory",
                        data: "{data:" + JSON.stringify(data) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var GetData = response.d;
                            $(GetData).each(function () {
                                $("#<%=MobileAddress.ClientID%>").val(GetData.Message)
                                //$('#MobileAddress').html(GetData.Message);
                            })

                        },
                        failure: function (response) {

                        }
                    });

                }
                else {

                    $("#mobileMessage").show();
                    $('#mobileMessage').html("Please select Message Category.");
                    setTimeout(function () { $("#mobileMessage").hide(); }, 10000);


                }
            });
        });

        ///This fuction used to Get Email Message from data base.
        $(function () {
            $("#<%=drpEmailMessage.ClientID%>").change(function () {

                if ($("#<%=drpEmailMessage.ClientID%>").val() > 0) {
                
                    var data = {};
                    data.Category = $("#<%=drpEmailMessage.ClientID%>").val();
                  
                    $.ajax({
                        type: "POST",
                        url: "/SendNotificationMIP.aspx/GetMessageCategory",
                        data: "{data:" + JSON.stringify(data) + "}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function (response) {
                            var GetData = response.d;
                            $(GetData).each(function () {
                                $("#<%=Email.ClientID()%>").val(GetData.Message)
                                //$('#MobileAddress').html(GetData.Message);
                            })

                        },
                        failure: function (response) {

                        }
                    });

                }
                else {

                    $("#emailMessage").show();
                    $('#emailMessage').html("Please select Message Category.");
                    setTimeout(function () { $("#emailMessage").hide(); }, 10000);


                }
            });
        });
    </script>
   <style>

       .activeTab { width:100%; padding:30px 0 20px 0; background:#fff; } 
.active { background: #f0f0f0; }

     .mybtn{
background-color:#428bca;
}

.expand{
background-color:red;
}
   </style>
</asp:Content>
