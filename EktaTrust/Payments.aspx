<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="Payments.aspx.vb" Inherits="EktaTrust.Payments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!--event registration -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

    <!-- jQuery easing plugin -->
    <script src="Js/js/jquery.easing.min.js"></script>
    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
    <script type="text/javascript" src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/additional-methods.js"></script>
     <style>
        /*custom font*/

        @import url(https://fonts.googleapis.com/css?family=Montserrat);
        /*basic reset*/

        .clsBackImage {
            height: 800px;
            background: linear-gradient(rgba(196, 102, 0, 0.2), rgba(155, 89, 182, 0.2)), url('test.jpg');
        }

        /*form styles*/
        #msform {
           
            position: relative;
        }

        fieldset {
        }

        #msform fieldset {
            background: white;
            border: 0 none;
            border-radius: 3px;
            box-shadow: 0 0 15px 1px rgba(0, 0, 0, 0.4);
            padding: 20px 30px;
            box-sizing: border-box;
            width: 80%;
            margin: 0 10%;
            /*stacking fieldse
    ts above each other*/
            position: absolute;
            opacity: 0.85;
        }
            /*Hide all except first fieldset*/
            #msform fieldset:not(:first-of-type) {
                display: none;
                opacity: 0.85;
            }
        /*inputs*/
        #msform input, #msform textarea {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
            margin-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
            font-family: montserrat;
            color: #2C3E50;
            font-size: 13px;
        }
        /*buttons*/
        #msform .action-button {
            width: 100px;
            color: #fff;
            background-color: #5cb85c !important;
            border-color: #4cae4c !important;
            font-weight: bold;
            color: white;
            /* border: 0 none; */
            border-radius: 6px;
            cursor: pointer;
            padding: 14px 6px;
            margin: 10px 5px;
        }

            #msform .action-button:hover, #msform .action-button:focus {
                box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
            }
        /*headings*/
        .fs-title {
            font-size: 15px;
            text-transform: uppercase;
            color: #2C3E50;
            margin: 0px;
            text-align:center;
        }

        .fs-subtitle {
            font-weight: normal;
            font-size: 13px;
            color: #666;
            margin: 0px;
        }
        /*progressbar*/
        #progressbar {
            margin-bottom: 30px;
            overflow: hidden;
            /*CSS counters to number the steps*/
            counter-reset: step;
        }

            #progressbar li {
                margin-top:2%;
                list-style-type: none;
                color: white;
                text-transform: uppercase;
                font-size: 9px;
                width: 24%;
                float: left;
                position: relative;
                text-align:center;
            }

                #progressbar li:before {
                    content: counter(step);
                    counter-increment: step;
                    width: 20px;
                    line-height: 20px;
                    display: block;
                    font-size: 10px;
                    color: #333;
                    background: white;
                    border-radius: 3px;
                    margin: 0 auto 5px auto;
                }
                /*progressbar connectors*/
                #progressbar li:after {
                    content: '';
                    width: 100%;
                    height: 2px;
                    background: white;
                    position: absolute;
                    left: -50%;
                    top: 9px;
                    z-index: -1; /*put it behind the numbers*/
                }

                #progressbar li:first-child:after {
                    /*connector not needed before the first step*/
                    content: none;
                }
                /*marking active/completed steps green*/
                /*The number of the step and the connector before it = green*/
                #progressbar li.active:before, #progressbar li.active:after {
                    background: #27AE60;
                    color: white;
                }

        #PaymentTab {
            margin-top: 1%;
        }
        #TermCondition
        {
            width:10% !important;
        }
        #TermCondition-error
        {
   float: right;
    margin: 0%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="clsBackImage">

          <div style="width:83%;    padding-left: 19%; ">
        <ul id="progressbar">
            <li class="active">Basic Information</li>
            <li class="active">Payment</li>
        </ul>
        </div>
        <!--First fieldsets to colect basic information -->
        <div>
            <div class="col-sm-2">
            </div>
            <div id="PaymentTab" class="col-sm-12">
               
                <fieldset id="Payment">
                    <h2 class="fs-title">Payment</h2>
                    <h3 class="fs-subtitle">Please provide payment information.</h3>
                    <%--<iframe src="https://in.explara.com/widget-new/10-km-run-for-equality" frameborder="0" style="width: 100%;" height="610" scrolling="yes"></iframe>--%>
                    <iframe src="https://in.explara.com/e/run-for-equality" frameborder="0" style="width: 100%;" height="610" scrolling="yes"></iframe>
                </fieldset>
            </div>
            <div class="col-sm-2">
            </div>
        </div>  
    </div>
</asp:Content>
