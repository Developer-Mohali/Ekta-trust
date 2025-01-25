<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/ProfileMaster.Master" CodeBehind="Profile.aspx.vb" Inherits="EktaTrust.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Css/css/bootstrap-select.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="Js/bootstrap-select.js"></script>

    <style>

        .trBack {
            background-color: #d9edf7;
        }

        table {
            border-collapse: collapse !important;
        }
        .tdHeads {
            text-align:left;
            font-size:large;
            color:dodgerblue;
            
        }

        .box {
            border: 5px solid #eee;
            background: #FFF;
            border-radius:10px !important;
            box-shadow: 0px 0px 10px 2px #999;
        }

        .tdHeadsModel {
            font-size:x-large;
            color:dodgerblue;
        }

        .tableModele {
            padding-left:0px !important;
            border:2px outset;
        }

        label {
            font-size:large;
        }

        .IconDelete {
            font-size:xx-large; 
            color:dodgerblue;
            margin-top:5px;
            text-align:right;
            margin-right:10px;
        }

        .IconEdit {
            font-size:large; 
            color:dodgerblue;
            margin-top:5px;
            text-align:right;
            margin-right:10px;
        }

        .labelfont {
            font-weight:bold;
        }

        .ImagePhoto {
            margin-top: 10px;
            margin-bottom: 10px;
            height: 150px;
            width: 150px;
            border-radius: 50%;
            cursor:pointer;
            box-shadow: 0px 0px 10px 5px #999;
        }

        .matchesImagePhoto {
            margin-left: 20px;
            margin-top: 10px;
            margin-bottom: 10px;
            height: 80px;
            width: 80px;
            border-radius: 50%;
            box-shadow: 0px 0px 10px 5px #999;
        }

        .divDisgn {
            margin-top:60px;
            margin-left:8px;
            margin-right:8px;
            margin-bottom:20px;
            border-top: 8px solid lightblue;
            overflow-x:auto;
            overflow-y:auto;
        }

        .lablePading {
                padding-left:110px;
        }

        .divMatchesDesign {
            margin-left: 8px;
            margin-right: 18px;
            margin-bottom: 20px;
            height:250px !important;
            border-top: 8px solid lightblue;
            border: 5px solid #eee;
            background: #FFF;
            border-radius: 10px !important;
            box-shadow: 0px 0px 10px 2px #999;
            overflow-x:auto;
            overflow-y:auto;
        }

        .labelCapital {
            word-break: break-word;
            text-transform: capitalize;
        }

        .labelCapitalLanguage {
            word-break: break-all;
            text-transform: capitalize;
        }

        .tdstyle {
            text-align:right;
        }

        /* for image */

        div.show-image {
            position: relative;
            float: left;
            margin: 5px;
        }
            div.show-image:hover img {
                opacity: 0.5;
            }
            div.show-image:hover input {
                display: block;
            }
            div.show-image:hover a {
                display: block;
            }
            div.show-image input {
                position: absolute;
                display: none;
            }
             div.show-image a {
                position: absolute;
                display: none;
            }
                div.show-image input.update {
                    
                    top: 20%;
                    left: 50%;
                }
                  div.show-image a.update {
                    bottom: 5px;
                    left: 40%;
                }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<nav class="navbar navbar-inverse">
        <div class="container nopadding">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                <a href="#" class=" navbar-brand2 margin visible-xs hidden-lg hidden-sm hidden-md">Navigation</a>
            </div>
            <div class="collapse navbar-collapse navbar-left">
                <ul class="nav navbar-nav">
                    <li>
                        <%--<asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server">Home</asp:LinkButton>
                    </li>
                    <li class="active">
                        <a href="../Profile.aspx">Profile</a>
                    </li>
                    <li>
                        <a href="#" data-toggle="modal" data-target="#ChangePassword">Change Password</a>
                    </li>
                    <li>
                        <a href="#">Delete Account</a>
                    </li>
                    <li>
                        <asp:LinkButton ID="LinkButton2" OnClick="LinkButton2_Click" runat="server">Logout</asp:LinkButton>
                    </li>
                </ul>
            </div>
        </div>
        <!--/.container-->
    </nav>--%>
   

    <div class="row" style="background-color:#F1F1F2 !important">
        <div class="col-sm-2">
            <div class="col-sm-12"></div>
                <div class="col-sm-12 divDisgn box">
                    <div class="show-image">
                        <asp:Image CssClass="ImagePhoto" ID="imgProfilePhoto" runat="server" data-toggle="modal" data-target="#UploadImage" ToolTip="Profile photo" />
                        
                        <a href="#" title="Change Profile Photo" class="update" data-toggle="modal" data-target="#UploadImage">
                            
                                <%--<span class="glyphicon glyphicon-camera" style="font-size:larger"></span>--%>
                            </a>
                    </div>
                    <hr style="border:2px inset" />
                    <asp:Label ID="lblUserName" CssClass="labelCapital" runat="server" Text="Label" Font-Size="Large"></asp:Label><br />
                    <asp:Label ID="lblMobileNoprofile" runat="server" Text="Label" Font-Size="Medium"></asp:Label><br />
                    <asp:Label ID="lblEmailId" runat="server" Text="Label" Font-Size="Medium"></asp:Label>
                </div>

            </div>

        <div class="col-sm-6">
             <div class="col-lg-12">
                 <table class="col-sm-12 table-hover box divDisgn">
                     <!------Basic information------------->
                     <!-----title row----->

                     <tr class="trBack">
                         <td class="tdHeads" colspan="3">
                             Basic Information
                         </td>
                         <td class="tdstyle">
                             &nbsp;
                             <%--<a href="#" title="Edit Basic Information" data-toggle="modal" data-target="#BasicInformation">
                                <span class="glyphicon glyphicon-edit IconEdit"></span>
                            </a>--%>
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!-----first row----->

                     <tr style="border:none">
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Name</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblName" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Last Name</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblLastName" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont"  runat="server" Text="Label">Mobile No</asp:Label>
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

                     <!-----second row----->

                     <tr>
                         <td class="col-sm-3">
                              <asp:Label CssClass="labelfont" runat="server" Text="Label">Present Address</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblAddress" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont"  runat="server" Text="Label">Date Of Birth</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblDateOfBirth" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label runat="server" CssClass="labelfont"  Text="Label">Gender</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblGender" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont"  runat="server" Text="Label">Category</asp:Label>
                         </td>
                          <td class="col-sm-3">
                              <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblCategory" runat="server" Text="Label"></asp:Label>
                          </td>
                     </tr>

                     <!-----third row----->

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Height</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblHeight" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Weight</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblWeight" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <!-----forth row----->

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Native Place</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblNativePlace" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Marital Status</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblSelfMaritalStatus" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Permanent Address</asp:Label>
                         </td>
                         <td class="col-sm-3" colspan="3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblPermanentAddress" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!------Qualification------->

                     <tr class="trBack">
                         <td class="tdHeads" colspan="3">
                             Qualification
                         </td>
                         <td class="tdstyle">
                             <a href="#" title="Edit Qualification" data-toggle="modal" data-target="#UpdateEducation">
                                <span class="glyphicon glyphicon-edit IconEdit"></span>
                            </a>
                         </td>
                     </tr>
                     
                     <tr><td colspan="4">&nbsp;</td></tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Qualification</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblQualification" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Education</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblEducation" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                        
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!------Qualification------->

                     <tr class="trBack">
                         <td class="tdHeads" colspan="3">
                             Occupation
                         </td>
                         <td class="tdstyle">
                             <a href="#" title="Edit Qualification" data-toggle="modal" data-target="#UpdateOccupation">
                                <span class="glyphicon glyphicon-edit IconEdit"></span>
                            </a>
                         </td>
                     </tr>


                     <tr><td colspan="4">&nbsp;</td></tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Occupation</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblWork" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Occupation Type</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblOccupationType" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Posting</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblPosting" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                             
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Annual Income</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblAnnualIncome" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Job Description</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblJobDiscription" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td colspan="2">
                             &nbsp;
                         </td>
                         
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!-------- family information ------>

                     <tr class="trBack">
                         <td class="tdHeads" colspan="3">
                             Family Information
                         </td>
                         <td class="tdstyle">
                             <a href="#" title="Edit Family Information" data-toggle="modal" data-target="#FamilyInformation">
                                <span class="glyphicon glyphicon-edit IconEdit"></span>
                            </a>
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Father Name</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblFatherName" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Father Profession</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblFatherProfession" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td class="col-sm-3">
                              <asp:Label CssClass="labelfont" runat="server" Text="Label">Mother Name</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblMotherName" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Mother Profession</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblMotherProfession" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <!-----eight row----->

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">GrandFather</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblGrandFather" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">GrandMother</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblGrandMother" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <!-----nine row----->

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">No Of Brothers</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblNoOfBrothers" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Married Brothers</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblMarriedBrothers" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">No Of Sisters</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblNoOfSisters" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Married Sisters</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblMarriedSisters" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <!-----ten row----->

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Family Food Type</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblFamilyFoodType" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Family Social Work</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblfamilySocialWork" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <!-----eleven row----->

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Family Disease</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblFamilyDisease" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Family Achievement</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblFamilyAchievement" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!-----------lifestyle information --------------->

                     <tr class="trBack">
                         <td class="tdHeads" colspan="3">
                             Lifestyle
                         </td>
                         <td class="tdstyle">
                             <a href="#" title="Edit LifeStyle" data-toggle="modal" data-target="#UpdateLifestyle">
                                <span class="glyphicon glyphicon-edit IconEdit"></span>
                            </a>
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!-----five row----->
                     
                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Language</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblLanguage" CssClass="labelCapitalLanguage" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Food Habbit</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblFoodHabbit" runat="server" Text="Label"></asp:Label>
                         </td>
                         
                     </tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Smoke</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblSmoke" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Drink</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblDrink" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!------------- Partner preference information ------------->

                     <tr class="trBack">
                         <td class="tdHeads" colspan="3">
                             Partner Preference
                         </td>
                         <td class="tdstyle">
                             <a href="#" title="Edit Partner Preference" data-toggle="modal" data-target="#UpdatePartnerPreference">
                                <span class="glyphicon glyphicon-edit IconEdit"></span>
                            </a>
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                    <!-----twleve row----->

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Marital Status</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblPartnerMaritalStatus" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Qualifaication</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblPartnerQualification" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>

                     <!-----thirteen row----->

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Age</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblPartnerAgeRange" runat="server" Text="Label"></asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Height</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblPartnerHeightRange" runat="server" Text="Label"></asp:Label>
                         </td>
                     </tr>
                     <tr><td colspan="4">&nbsp;</td></tr>
                 </table>
            </div>

            <!----Edit information here from popup model----->
           

              <!-- Modal basic information -->
            <div class="modal fade" id="BasicInformation" role="dialog">
                <div class="modal-dialog">
    
                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                      <h4 class="modal-title tdHeadsModel">Basic Information</h4>
                    </div>
                    <div class="modal-body" style="height:580px">
                        <div class="col-lg-12 modal-body">
                        <table class="col-sm-12 table table-hover tableModele">

                                <!-----first row--->
                
                            <asp:HiddenField ID="HiddenUserId" runat="server" />

                                 <tr class="trBack">
                                     <td>
                                         <asp:Label runat="server" Text="Label">Name</asp:Label>
                                     </td>
                                     <td>
                                         <asp:Label runat="server" Text="Label">Last Name</asp:Label>
                                     </td>
                                 </tr>

                                 <tr>
                                     <td>
                                         <asp:TextBox CssClass="form-control" MaxLength="15" ID="txtName" runat="server"></asp:TextBox>
                                     </td>
                                     <td>
                                         <asp:TextBox CssClass="form-control" MaxLength="15" ID="txtLastName" runat="server"></asp:TextBox>
                                     </td>
                                 </tr>

                                <!-----second row--->

                                 <tr class="trBack">
                                     <td>
                                         <asp:Label runat="server" Text="Label">Mobile No</asp:Label>
                                     </td>
                                     <td>
                                         <asp:Label runat="server" Text="Label">Native Place</asp:Label>
                                     </td>
                                 </tr>

                                 <tr>
                                     <td>
                                         <asp:TextBox CssClass="form-control" ID="txtMobile" MaxLength="10" runat="server"></asp:TextBox>
                                     </td>
                                     <td>
                                         <asp:TextBox CssClass="form-control" ID="txtNativePlace" MaxLength="25" runat="server"></asp:TextBox>
                                     </td>
                                 </tr>

                                <!-----third row--->

                                 <tr class="trBack">
                                     <td>
                                         <asp:Label runat="server" Text="Label">Gender</asp:Label>
                                     </td>
                                     <td>
                                         <asp:Label runat="server" Text="Label">Category</asp:Label>
                                     </td>
                                 </tr>

                                 <tr>
                                     <td>
                                         <asp:DropDownList CssClass="form-control" ID="drpGender" runat="server">
                                             <asp:ListItem>Male</asp:ListItem>
                                             <asp:ListItem>Female</asp:ListItem>
                                         </asp:DropDownList>
                                     </td>
                                     <td>
                                         <asp:DropDownList CssClass="form-control" ID="drpCategory" runat="server">
                                             <asp:ListItem>SC</asp:ListItem>
                                             <asp:ListItem>ST</asp:ListItem>
                                             <asp:ListItem>OBC</asp:ListItem>
                                             <asp:ListItem>OTHER</asp:ListItem>
                                         </asp:DropDownList>
                                     </td>
                                 </tr>

                                 <!-----forth row----->

                                 <tr class="trBack">
                                     <td>
                                         <asp:Label runat="server" Text="Label">Occupation</asp:Label>
                                     </td>
                                     <td>
                                         <asp:Label runat="server" Text="Label">Posting</asp:Label>
                                     </td>
                                 </tr>

                                 <tr>
                                     <td>
                                         <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtWork" runat="server"></asp:TextBox>
                                     </td>
                                     <td>
                                         <asp:TextBox CssClass="form-control" MaxLength="25" ID="txtPosting" runat="server"></asp:TextBox>
                                     </td>
                                 </tr>

                                <tr class="trBack">
                                     <td>
                                         <asp:Label runat="server" Text="Label">Height</asp:Label>
                                     </td>
                                     <td>
                                         <asp:Label runat="server" Text="Label">Weight</asp:Label>
                                     </td>
                                 </tr>

                                 <tr>
                                     <td>
                                         <asp:DropDownList CssClass="form-control" ID="drpHeight" runat="server">
                                             <asp:ListItem>4ft 5in - 134cm</asp:ListItem>
                                             <asp:ListItem>4ft 6in - 137cm</asp:ListItem>
                                             <asp:ListItem>4ft 7in - 139cm</asp:ListItem>
                                             <asp:ListItem>4ft 8in - 142cm</asp:ListItem>
                                             <asp:ListItem>4ft 9in - 144cm</asp:ListItem>
                                             <asp:ListItem>4ft 10in - 147cm</asp:ListItem>
                                             <asp:ListItem>4ft 11in - 149cm</asp:ListItem>
                                             <asp:ListItem>5ft - 152cm</asp:ListItem>
                                             <asp:ListItem>5ft 1in - 154cm</asp:ListItem>
                                             <asp:ListItem>5ft 2in - 157cm</asp:ListItem>
                                             <asp:ListItem>5ft 3in - 160cm</asp:ListItem>
                                             <asp:ListItem>5ft 4in - 162cm</asp:ListItem>
                                             <asp:ListItem>5ft 5in - 165cm</asp:ListItem>
                                             <asp:ListItem>5ft 6in - 167cm</asp:ListItem>
                                             <asp:ListItem>5ft 7in - 170cm</asp:ListItem>
                                             <asp:ListItem>5ft 8in - 172cm</asp:ListItem>
                                             <asp:ListItem>5ft 9in - 175cm</asp:ListItem>
                                             <asp:ListItem>5ft 10in - 177cm</asp:ListItem>
                                             <asp:ListItem>5ft 11in - 180cm</asp:ListItem>
                                             <asp:ListItem>6ft - 182cm</asp:ListItem>
                                             <asp:ListItem>6ft 1in - 185cm</asp:ListItem>
                                             <asp:ListItem>6ft 2in - 187cm</asp:ListItem>
                                             <asp:ListItem>6ft 3in - 190cm</asp:ListItem>
                                             <asp:ListItem>6ft 4in - 193cm</asp:ListItem>
                                             <asp:ListItem>6ft 5in - 195cm</asp:ListItem>
                                             <asp:ListItem>6ft 6in - 198cm</asp:ListItem>
                                             <asp:ListItem>6ft 7in - 200cm</asp:ListItem>
                                             <asp:ListItem>6ft 8in - 203cm</asp:ListItem>
                                             <asp:ListItem>6ft 9in - 205cm</asp:ListItem>
                                             <asp:ListItem>6ft 10in - 208cm</asp:ListItem>
                                             <asp:ListItem>6ft 11in - 210cm</asp:ListItem>
                                             <asp:ListItem>7ft - 213cm</asp:ListItem>
                                         </asp:DropDownList>
                                     </td>
                                     <td>
                                         <asp:TextBox CssClass="form-control" MaxLength="3" ID="txtWeight" runat="server"></asp:TextBox>
                                     </td>
                                 </tr>

                                <tr class="trBack">
                                    <td colspan="2">
                                        <asp:Label runat="server" Text="Label">Address</asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:TextBox CssClass="form-control" MaxLength="50" ID="txtAddress" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                             </table>
                        </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" id="btnUpdateBasicInformation" class="btn btn-success">Update</button>
                      <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                  </div>
                </div>
              </div>

                <!-- Modal family information -->

            <div class="modal fade" id="FamilyInformation" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title tdHeadsModel">Family Information</h4>
            
        </div>
        <div class="modal-body" style="height:645px">
          
            <div class="col-lg-12" style="padding:0px !important">
            <table class="col-sm-12 table table-hover tableModele">

          
                <!-----seven row----->

                     <tr class="trBack">
                         <td>
                             <asp:Label runat="server" Text="Label">Father Name</asp:Label>
                         </td>
                         <td>
                             <asp:Label runat="server" Text="Label">Father Profession</asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             <asp:TextBox CssClass="form-control" ID="txtFatherName" MaxLength="20" runat="server"></asp:TextBox>
                         </td>
                         <td>
                              <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtFatherProfession" runat="server"></asp:TextBox>
                         </td>
                     </tr>

                    <tr class="trBack">
                        <td>
                             <asp:Label runat="server" Text="Label">Mother Name</asp:Label>
                        </td>
                        <td>
                             <asp:Label runat="server" Text="Label">Mother Profession</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtMotherName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                             <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtMotherProfession" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                     <!-----eight row----->

                     <tr class="trBack">
                         
                         <td>
                             <asp:Label runat="server" Text="Label">GrandFather</asp:Label>
                         </td>
                         <td>
                             <asp:Label runat="server" Text="Label">GrandMother</asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtGrandFather" runat="server"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtGrandMother" runat="server"></asp:TextBox>
                         </td>
                     </tr>

                     <!-----nine row----->

                     <tr class="trBack">
                         <td>
                             <asp:Label runat="server" Text="Label">No Of Brothers</asp:Label>
                         </td>
                         <td>
                             <asp:Label runat="server" Text="Label">Married Brothers</asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpNoOfBrothers" runat="server">
                                 <asp:ListItem>0</asp:ListItem>
                                 <asp:ListItem>1</asp:ListItem>
                                 <asp:ListItem>2</asp:ListItem>
                                 <asp:ListItem>3</asp:ListItem>
                                 <asp:ListItem>4</asp:ListItem>
                                 <asp:ListItem>5</asp:ListItem>
                                 <asp:ListItem>6</asp:ListItem>
                                 <asp:ListItem>7</asp:ListItem>
                                 <asp:ListItem>8</asp:ListItem>
                                 <asp:ListItem>9</asp:ListItem>
                                 
                             </asp:DropDownList>
                         </td>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpMarriedBrother" runat="server">
                                 <asp:ListItem>0</asp:ListItem>
                                 <asp:ListItem>1</asp:ListItem>
                                 <asp:ListItem>2</asp:ListItem>
                                 <asp:ListItem>3</asp:ListItem>
                                 <asp:ListItem>4</asp:ListItem>
                                 <asp:ListItem>5</asp:ListItem>
                                 <asp:ListItem>6</asp:ListItem>
                                 <asp:ListItem>7</asp:ListItem>
                                 <asp:ListItem>8</asp:ListItem>
                                 <asp:ListItem>9</asp:ListItem>
                                 
                             </asp:DropDownList>
                         </td>
                     </tr>

                    <tr class="trBack">
                        <td>
                             <asp:Label runat="server" Text="Label">No Of Sisters</asp:Label>
                        </td>
                        <td>
                             <asp:Label runat="server" Text="Label">Married Sisters</asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td>
                             <asp:DropDownList CssClass="form-control" ID="drpNoOfSisters" runat="server">
                                 <asp:ListItem>0</asp:ListItem>
                                 <asp:ListItem>1</asp:ListItem>
                                 <asp:ListItem>2</asp:ListItem>
                                 <asp:ListItem>3</asp:ListItem>
                                 <asp:ListItem>4</asp:ListItem>
                                 <asp:ListItem>5</asp:ListItem>
                                 <asp:ListItem>6</asp:ListItem>
                                 <asp:ListItem>7</asp:ListItem>
                                 <asp:ListItem>8</asp:ListItem>
                                 <asp:ListItem>9</asp:ListItem>
                                 
                             </asp:DropDownList>
                         </td>
                        <td>
                             <asp:DropDownList CssClass="form-control" ID="drpMarriedSisters" runat="server">
                                 <asp:ListItem>0</asp:ListItem>
                                 <asp:ListItem>1</asp:ListItem>
                                 <asp:ListItem>2</asp:ListItem>
                                 <asp:ListItem>3</asp:ListItem>
                                 <asp:ListItem>4</asp:ListItem>
                                 <asp:ListItem>5</asp:ListItem>
                                 <asp:ListItem>6</asp:ListItem>
                                 <asp:ListItem>7</asp:ListItem>
                                 <asp:ListItem>8</asp:ListItem>
                                 <asp:ListItem>9</asp:ListItem>
                                 
                             </asp:DropDownList>
                        </td>
                    </tr>

                     <!-----ten row----->

                     <tr class="trBack">
                         
                         <td>
                             <asp:Label runat="server" Text="Label">Family Food Type</asp:Label>
                         </td>
                         <td>
                             <asp:Label runat="server" Text="Label">family Social Work</asp:Label>
                         </td>
                     </tr>

                     <tr>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpFamilyFoodType" runat="server">
                                 <asp:ListItem></asp:ListItem>
                                 <asp:ListItem>Vegetarian</asp:ListItem>
                                 <asp:ListItem>Non-Veg</asp:ListItem>
                                 <asp:ListItem>Eggetarian</asp:ListItem>
                             </asp:DropDownList>
                         </td>
                         <td>
                             <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtFamilySocialWork" runat="server"></asp:TextBox>
                         </td>
                     </tr>

                     <!-----eleven row----->

                     <tr class="trBack">
                         <td>
                             <asp:Label runat="server" Text="Label">Family Disease</asp:Label>
                         </td>
                         <td>
                             <asp:Label runat="server" Text="Label">Family Achievement</asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td>
                             <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtFamilyDisease" runat="server"></asp:TextBox>
                         </td>
                         <td>
                             <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtAchievement" runat="server"></asp:TextBox>
                         </td>
                     </tr>
                </table>
                </div>

        </div>
        <div class="modal-footer">
          <button type="button" id="btnUpdateFamilyInformation" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

            <!----pop up model for change password---->

             <div class="modal fade" id="ChangePassword" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title tdHeadsModel">Change Password</h4>
        </div>
        <div class="modal-body" style="height:210px">
            <div class="col-lg-12 modal-body">
            <table class="col-sm-12 table table-hover">

                    <!-----first row--->
                    
                <asp:HiddenField ID="HiddenPassword" runat="server" />
                     <tr>
                         <td>
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Old Password :</asp:Label>
                         </td>
                         <td>
                             <asp:TextBox TextMode="Password" CssClass="form-control" MaxLength="15" ID="txtOldPassword" runat="server"></asp:TextBox>
                         </td>
                     </tr>
                    <tr>
                         <td>
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">New Password :</asp:Label>
                         </td>
                         <td>
                             <asp:TextBox TextMode="Password" CssClass="form-control" MaxLength="15" ID="txtNewPassword" runat="server"></asp:TextBox>
                         </td>
                     </tr>
                    <tr>
                         <td>
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Confirm Password :</asp:Label>
                         </td>
                         <td>
                             <asp:TextBox TextMode="Password" CssClass="form-control" MaxLength="15" ID="txtReEnterPassword" runat="server"></asp:TextBox>
                         </td>
                     </tr>
                 </table>
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" id="btnChangePassword" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-default" onclick="clearpopUpModel();" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>

            <!----pop up model for update education---->

             <div class="modal fade" id="UpdateEducation" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title tdHeadsModel">Qualification</h4>
        </div>
        <div class="modal-body" style="height:150px">
          
            <div class="col-lg-12 modal-body">
            <table class="col-sm-12 table table-hover tableModele">

                    <tr class="trBack">
                        <td>
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Qualification</asp:Label>
                        </td>
                        <td>
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Education</asp:Label>
                         </td>
                     </tr>

                    <tr>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpQualification" runat="server">
                                 <asp:ListItem>Less Than High School</asp:ListItem>
                                 <asp:ListItem>High School</asp:ListItem>
                                 <asp:ListItem>Undergraduate</asp:ListItem>
                                 <asp:ListItem>Bachelor's Degree</asp:ListItem>
                                 <asp:ListItem>Engineering Degree</asp:ListItem>
                                 <asp:ListItem>Masters Degree</asp:ListItem>
                                 <asp:ListItem>Doctorate</asp:ListItem>
                                 <asp:ListItem>Others</asp:ListItem>

                             </asp:DropDownList>
                         </td>
                         <td>
                             <asp:TextBox CssClass="form-control" MaxLength="100" ID="txtEducation" runat="server"></asp:TextBox>
                         </td>
                         
                     </tr>

                 </table>
                
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" id="btnUpdateEducation" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

            <!----pop up model for update Occupation---->

             <div class="modal fade" id="UpdateOccupation" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title tdHeadsModel">Occupation</h4>
        </div>
        <div class="modal-body" style="height:315px">
          
            <div class="col-lg-12 modal-body">
            <table class="col-sm-12 table table-hover tableModele">

                <tr class="trBack">
                    <td>
                         <asp:Label CssClass="labelfont" runat="server" Text="Label">Occupation</asp:Label>
                    </td>
                    <td>
                            <asp:Label CssClass="labelfont" runat="server" Text="Label">Occupation Type</asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>
                            <asp:TextBox CssClass="form-control" MaxLength="20" ID="txtOccupation" runat="server"></asp:TextBox>
                    </td>
                    <td>
                            <asp:DropDownList CssClass="form-control" ID="drpOccupationType" runat="server">
                                <asp:ListItem>Government</asp:ListItem>
                                <asp:ListItem>Private</asp:ListItem>
                                <asp:ListItem>Bussiness</asp:ListItem>
                                <asp:ListItem>Others</asp:ListItem>
                            </asp:DropDownList>
                    </td>
                </tr>

                <tr class="trBack">
                    <td>
                        <asp:Label CssClass="labelfont" runat="server" Text="Label">Posting</asp:Label>
                    </td>
                    <td>
                        <asp:Label CssClass="labelfont" runat="server" Text="Label">Annual Income</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                         <asp:TextBox CssClass="form-control" MaxLength="25" ID="txtPostingUpdate" runat="server"></asp:TextBox>
                    </td>
                    <td>
                         <asp:TextBox CssClass="form-control" MaxLength="7" ID="txtAnnualIncome" runat="server"></asp:TextBox>
                    </td>
                </tr>

                 <tr class="trBack">
                        <td>
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Job Description</asp:Label>
                        </td>
                        <td>
                             &nbsp;
                         </td>
                     </tr>
                 <tr>
                    <td>
                         <asp:TextBox CssClass="form-control" MaxLength="25" ID="txtJobDiscription" runat="server"></asp:TextBox>
                    </td>
                    <td>
                         &nbsp;
                    </td>
                </tr>

            </table>
                
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" id="btnUpdateOccupation" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

            <!----pop up model for Update life style---->

             <div class="modal fade" id="UpdateLifestyle" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title tdHeadsModel">Life Style</h4>
        </div>
        <div class="modal-body" style="height:210px">
          
            <div class="col-lg-12 modal-body">
            <table class="col-sm-12 table table-hover tableModele">

                    <!-----first row--->
                    
                     <tr class="trBack">
                         <td>
                             <asp:Label runat="server" Text="Label">Food Habbit</asp:Label>
                         </td>
                         <td>
                             <asp:Label runat="server" Text="Label">Language</asp:Label>
                         </td>

                     </tr>

                     <tr>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpFoodHabbit" runat="server">
                                 <asp:ListItem></asp:ListItem>
                                 <asp:ListItem>Vegetarian</asp:ListItem>
                                 <asp:ListItem>Non-Veg</asp:ListItem>
                                 <asp:ListItem>Eggetarian</asp:ListItem>
                             </asp:DropDownList>
                         </td>
                         <td>
                            <select class="selectpicker form-control" id="drpLanguage" multiple="multiple" data-max-options="5">
                            <option value="Aka">Aka</option>
                            <option value="Arabic">Arabic</option>
                            <option value="Arunachali">Arunachali</option>
                            <option value="Assamese">Assamese</option>
                            <option value="Awadhi">Awadhi</option>
                            <option value="Baluchi">Baluchi</option>
                            <option value="Bengali">Bengali</option>
                            <option value="Bhojpuri">Bhojpuri</option>
                            <option value="Bhutia">Bhutia</option>
                            <option value="Brahui">Brahui</option>
                            <option value="Brij">Brij</option>
                            <option value="Burmese">Burmese</option>
                            <option value="Chattisgarhi">Chattisgarhi</option>
                            <option value="Chinese">Chinese</option>
                            <option value="Coorgi">Coorgi</option>
                            <option value="Dogri">Dogri</option>
                            <option value="English">English</option>
                            <option value="French">French</option>
                            <option value="Garhwali">Garhwali</option>
                            <option value="Garo">Garo</option>
                            <option value="Gujarati">Gujarati</option>
                            <option value="Haryanavi">Haryanavi</option>
                            <option value="Himachali/Pahari">Himachali/Pahari</option>
                            <option value="Hindi">Hindi</option>
                            <option value="Hindko">Hindko</option>
                            <option value="Kakbarak">Kakbarak</option>
                            <option value="Kanauji">Kanauji</option>
                            <option value="Kannada">Kannada</option>
                            <option value="Kashmiri">Kashmiri</option>
                            <option value="Khandesi">Khandesi</option>
                            <option value="Khasi">Khasi</option>
                            <option value="Konkani">Konkani</option>
                            <option value="Koshali">Koshali</option>
                            <option value="Kumaoni">Kumaoni</option>
                            <option value="Kutchi">Kutchi</option>
                            <option value="Ladakhi">Ladakhi</option>
                            <option value="Lepcha">Lepcha</option>
                            <option value="Magahi">Magahi</option>
                            <option value="Maithili">Maithili</option>
                            <option value="Malay">Malay</option>
                            <option value="Malayalam">Malayalam</option>
                            <option value="Manipuri">Manipuri</option>
                            <option value="Marathi">Marathi</option>
                            <option value="Marwari">Marwari</option>
                            <option value="Miji">Miji</option>
                            <option value="Mizo">Mizo</option>
                            <option value="Monpa">Monpa</option>
                            <option value="Nepali">Nepali</option>
                            <option value="Odia">Odia</option>
                            <option value="Pashto">Pashto</option>
                            <option value="Persian">Persian</option>
                            <option value="Punjabi">Punjabi</option>
                            <option value="Rajasthani">Rajasthani</option>
                            <option value="Russian">Russian</option>
                            <option value="Sanskrit">Sanskrit</option>
                            <option value="Santhali">Santhali</option>
                            <option value="Seraiki">Seraiki</option>
                            <option value="Sindhi">Sindhi</option>
                            <option value="Sinhala">Sinhala</option>
                            <option value="Sourashtra">Sourashtra</option>
                            <option value="Spanish">Spanish</option>
                            <option value="Swedish">Swedish</option>
                            <option value="Tagalog">Tagalog</option>
                            <option value="Tamil">Tamil</option>
                            <option value="Telugu">Telugu</option>
                            <option value="Tulu">Tulu</option>
                            <option value="Urdu">Urdu</option>
                            <option value="Other">Other</option>
                              
                        </select>
                         </td>
                         
                     </tr>

                     <!-----six row----->

                     <tr class="trBack">
                         
                        <td>
                             <asp:Label runat="server" Text="Label">Smoke</asp:Label>
                         </td>
                         <td>
                             <asp:Label runat="server" Text="Label">Drink</asp:Label>
                         </td> 
                     </tr>

                     <tr>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpSmoke" runat="server">
                                 <asp:ListItem></asp:ListItem>
                                 <asp:ListItem>Yes</asp:ListItem>
                                 <asp:ListItem>No</asp:ListItem>
                                 <asp:ListItem>Smoking</asp:ListItem>
                             </asp:DropDownList>
                         </td>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpDrink" runat="server">
                                 <asp:ListItem></asp:ListItem>
                                 <asp:ListItem>Yes</asp:ListItem>
                                 <asp:ListItem>No</asp:ListItem>
                                 <asp:ListItem>Occasionally</asp:ListItem>
                             </asp:DropDownList>
                         </td>

                     </tr>

                 </table>
                
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" id="btnUpdateLifestyle" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

            <!----pop up model for Update Partner Preference---->

             <div class="modal fade" id="UpdatePartnerPreference" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width:700px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title tdHeadsModel">Partner Preference</h4>
        </div>
        <div class="modal-body" style="height:280px">
          
            <div class="col-lg-12 modal-body">
            <table class="col-sm-12 table table-hover tableModele">

                    <!-----first row--->
                    
                     <tr class="trBack">
                         <td colspan="3">
                             <asp:Label runat="server" Text="Label">Marital Status</asp:Label>
                         </td>
                         <td colspan="3">
                             <asp:Label CssClass="lablePading" runat="server" Text="Label">Qualification</asp:Label>
                         </td>

                     </tr>

                     <tr>
                         <td colspan="3">
                             <asp:DropDownList CssClass="form-control" ID="drpMaritalStatus" runat="server">
                                 <asp:ListItem>Never Married</asp:ListItem>
                                 <asp:ListItem>Divorced</asp:ListItem>
                                 <asp:ListItem>Widowed</asp:ListItem>
                                 <asp:ListItem>Awaiting Divorce</asp:ListItem>
                                 <asp:ListItem>Annulled</asp:ListItem>
                             </asp:DropDownList>
                         </td>
                         <td colspan="3">
                             <select id="drpPartnerEducationType" name="EducationType" class="form-control selectpicker" multiple="multiple" data-max-options="3">
								<option value="Less Than High School">Less Than High School</option>
								<option value="High School">High School</option>
								<option value="Undergraduate">Undergraduate</option>
								<option value="Bachelor's Degree">Bachelor's Degree</option>
								<option value="Engineering Degree">Engineering Degree</option>
								<option value="Masters Degree">Masters Degree</option>
								<option value="Doctorate">Doctorate</option>
								<option value="Others">Others</option>
							</select>
                         </td>
                         
                     </tr>

                     <!-----six row----->

                     <tr class="trBack">
                         
                        <td colspan="3">
                             <asp:Label runat="server" Text="Label">Age</asp:Label>
                         </td>

                         <td colspan="3">
                             <asp:Label CssClass="lablePading" runat="server" Text="Label">Height</asp:Label>
                         </td> 
                     </tr>

                     <tr>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpAgeFrom" runat="server">
                                 
                                 <asp:ListItem>18</asp:ListItem>
                                 <asp:ListItem>19</asp:ListItem>
                                 <asp:ListItem>20</asp:ListItem>
                                 <asp:ListItem>21</asp:ListItem>
                                 <asp:ListItem>22</asp:ListItem>
                                 <asp:ListItem>23</asp:ListItem>
                                 <asp:ListItem>24</asp:ListItem>
                                 <asp:ListItem>25</asp:ListItem>
                                 <asp:ListItem>26</asp:ListItem>
                                 <asp:ListItem>27</asp:ListItem>
                                 <asp:ListItem>28</asp:ListItem>
                                 <asp:ListItem>29</asp:ListItem>
                                 <asp:ListItem>30</asp:ListItem>
                                 <asp:ListItem>31</asp:ListItem>
                                 <asp:ListItem>32</asp:ListItem>
                                 <asp:ListItem>33</asp:ListItem>
                                 <asp:ListItem>34</asp:ListItem>
                                 <asp:ListItem>35</asp:ListItem>
                                 <asp:ListItem>36</asp:ListItem>
                                 <asp:ListItem>37</asp:ListItem>
                                 <asp:ListItem>38</asp:ListItem>
                                 <asp:ListItem>39</asp:ListItem>
                                 <asp:ListItem>40</asp:ListItem>
                                 <asp:ListItem>41</asp:ListItem>
                                 <asp:ListItem>42</asp:ListItem>
                                 <asp:ListItem>43</asp:ListItem>
                                 <asp:ListItem>44</asp:ListItem>
                                 <asp:ListItem>45</asp:ListItem>
                                 <asp:ListItem>46</asp:ListItem>
                                 <asp:ListItem>47</asp:ListItem>
                                 <asp:ListItem>48</asp:ListItem>
                                 <asp:ListItem>49</asp:ListItem>
                                 <asp:ListItem>50</asp:ListItem>
                                 <asp:ListItem>51</asp:ListItem>
                                 <asp:ListItem>52</asp:ListItem>
                                 <asp:ListItem>53</asp:ListItem>
                                 <asp:ListItem>54</asp:ListItem>
                                 <asp:ListItem>55</asp:ListItem>
                                 <asp:ListItem>56</asp:ListItem>
                                 <asp:ListItem>57</asp:ListItem>
                                 <asp:ListItem>58</asp:ListItem>
                                 <asp:ListItem>59</asp:ListItem>
                                 <asp:ListItem>60</asp:ListItem>
                                 <asp:ListItem>61</asp:ListItem>
                                 <asp:ListItem>62</asp:ListItem>
                                 <asp:ListItem>63</asp:ListItem>
                                 <asp:ListItem>64</asp:ListItem>
                                 <asp:ListItem>65</asp:ListItem>
                                 <asp:ListItem>66</asp:ListItem>
                                 <asp:ListItem>67</asp:ListItem>
                                 <asp:ListItem>68</asp:ListItem>
                                 <asp:ListItem>69</asp:ListItem>
                                 <asp:ListItem>70</asp:ListItem>
                                 <asp:ListItem>71</asp:ListItem>

                             </asp:DropDownList>
                             </td> 
                             <td>
                                 <asp:Label Font-Size="Large" runat="server" Text="Label">To</asp:Label>
                             </td>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpAgeTo" runat="server">
                                 
                                 <asp:ListItem>18</asp:ListItem>
                                 <asp:ListItem>19</asp:ListItem>
                                 <asp:ListItem>20</asp:ListItem>
                                 <asp:ListItem>21</asp:ListItem>
                                 <asp:ListItem>22</asp:ListItem>
                                 <asp:ListItem>23</asp:ListItem>
                                 <asp:ListItem>24</asp:ListItem>
                                 <asp:ListItem>25</asp:ListItem>
                                 <asp:ListItem>26</asp:ListItem>
                                 <asp:ListItem>27</asp:ListItem>
                                 <asp:ListItem>28</asp:ListItem>
                                 <asp:ListItem>29</asp:ListItem>
                                 <asp:ListItem>30</asp:ListItem>
                                 <asp:ListItem>31</asp:ListItem>
                                 <asp:ListItem>32</asp:ListItem>
                                 <asp:ListItem>33</asp:ListItem>
                                 <asp:ListItem>34</asp:ListItem>
                                 <asp:ListItem>35</asp:ListItem>
                                 <asp:ListItem>36</asp:ListItem>
                                 <asp:ListItem>37</asp:ListItem>
                                 <asp:ListItem>38</asp:ListItem>
                                 <asp:ListItem>39</asp:ListItem>
                                 <asp:ListItem>40</asp:ListItem>
                                 <asp:ListItem>41</asp:ListItem>
                                 <asp:ListItem>42</asp:ListItem>
                                 <asp:ListItem>43</asp:ListItem>
                                 <asp:ListItem>44</asp:ListItem>
                                 <asp:ListItem>45</asp:ListItem>
                                 <asp:ListItem>46</asp:ListItem>
                                 <asp:ListItem>47</asp:ListItem>
                                 <asp:ListItem>48</asp:ListItem>
                                 <asp:ListItem>49</asp:ListItem>
                                 <asp:ListItem>50</asp:ListItem>
                                 <asp:ListItem>51</asp:ListItem>
                                 <asp:ListItem>52</asp:ListItem>
                                 <asp:ListItem>53</asp:ListItem>
                                 <asp:ListItem>54</asp:ListItem>
                                 <asp:ListItem>55</asp:ListItem>
                                 <asp:ListItem>56</asp:ListItem>
                                 <asp:ListItem>57</asp:ListItem>
                                 <asp:ListItem>58</asp:ListItem>
                                 <asp:ListItem>59</asp:ListItem>
                                 <asp:ListItem>60</asp:ListItem>
                                 <asp:ListItem>61</asp:ListItem>
                                 <asp:ListItem>62</asp:ListItem>
                                 <asp:ListItem>63</asp:ListItem>
                                 <asp:ListItem>64</asp:ListItem>
                                 <asp:ListItem>65</asp:ListItem>
                                 <asp:ListItem>66</asp:ListItem>
                                 <asp:ListItem>67</asp:ListItem>
                                 <asp:ListItem>68</asp:ListItem>
                                 <asp:ListItem>69</asp:ListItem>
                                 <asp:ListItem>70</asp:ListItem>
                                 <asp:ListItem>71</asp:ListItem>
                                 
                             </asp:DropDownList>
                         </td>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpHeihtFrom" runat="server">
                                 
                                 <asp:ListItem>4ft 5in - 134cm</asp:ListItem>
                                 <asp:ListItem>4ft 6in - 137cm</asp:ListItem>
                                 <asp:ListItem>4ft 7in - 139cm</asp:ListItem>
                                 <asp:ListItem>4ft 8in - 142cm</asp:ListItem>
                                 <asp:ListItem>4ft 9in - 144cm</asp:ListItem>
                                 <asp:ListItem>4ft 10in - 147cm</asp:ListItem>
                                 <asp:ListItem>4ft 11in - 149cm</asp:ListItem>
                                 <asp:ListItem>5ft - 152cm</asp:ListItem>
                                 <asp:ListItem>5ft 1in - 154cm</asp:ListItem>
                                 <asp:ListItem>5ft 2in - 157cm</asp:ListItem>
                                 <asp:ListItem>5ft 3in - 160cm</asp:ListItem>
                                 <asp:ListItem>5ft 4in - 162cm</asp:ListItem>
                                 <asp:ListItem>5ft 5in - 165cm</asp:ListItem>
                                 <asp:ListItem>5ft 6in - 167cm</asp:ListItem>
                                 <asp:ListItem>5ft 7in - 170cm</asp:ListItem>
                                 <asp:ListItem>5ft 8in - 172cm</asp:ListItem>
                                 <asp:ListItem>5ft 9in - 175cm</asp:ListItem>
                                 <asp:ListItem>5ft 10in - 177cm</asp:ListItem>
                                 <asp:ListItem>5ft 11in - 180cm</asp:ListItem>
                                 <asp:ListItem>6ft - 182cm</asp:ListItem>
                                 <asp:ListItem>6ft 1in - 185cm</asp:ListItem>
                                 <asp:ListItem>6ft 2in - 187cm</asp:ListItem>
                                 <asp:ListItem>6ft 3in - 190cm</asp:ListItem>
                                 <asp:ListItem>6ft 4in - 193cm</asp:ListItem>
                                 <asp:ListItem>6ft 5in - 195cm</asp:ListItem>
                                 <asp:ListItem>6ft 6in - 198cm</asp:ListItem>
                                 <asp:ListItem>6ft 7in - 200cm</asp:ListItem>
                                 <asp:ListItem>6ft 8in - 203cm</asp:ListItem>
                                 <asp:ListItem>6ft 9in - 205cm</asp:ListItem>
                                 <asp:ListItem>6ft 10in - 208cm</asp:ListItem>
                                 <asp:ListItem>6ft 11in - 210cm</asp:ListItem>
                                 <asp:ListItem>7ft - 213cm</asp:ListItem>

                            </asp:DropDownList>

                             </td> 
                             <td>
                                <asp:Label Font-Size="Large" runat="server" Text="Label">To</asp:Label>
                             </td>
                         <td>
                             <asp:DropDownList CssClass="form-control" ID="drpHeightTo" runat="server">
                                 
                                 <asp:ListItem>4ft 5in - 134cm</asp:ListItem>
                                 <asp:ListItem>4ft 6in - 137cm</asp:ListItem>
                                 <asp:ListItem>4ft 7in - 139cm</asp:ListItem>
                                 <asp:ListItem>4ft 8in - 142cm</asp:ListItem>
                                 <asp:ListItem>4ft 9in - 144cm</asp:ListItem>
                                 <asp:ListItem>4ft 10in - 147cm</asp:ListItem>
                                 <asp:ListItem>4ft 11in - 149cm</asp:ListItem>
                                 <asp:ListItem>5ft - 152cm</asp:ListItem>
                                 <asp:ListItem>5ft 1in - 154cm</asp:ListItem>
                                 <asp:ListItem>5ft 2in - 157cm</asp:ListItem>
                                 <asp:ListItem>5ft 3in - 160cm</asp:ListItem>
                                 <asp:ListItem>5ft 4in - 162cm</asp:ListItem>
                                 <asp:ListItem>5ft 5in - 165cm</asp:ListItem>
                                 <asp:ListItem>5ft 6in - 167cm</asp:ListItem>
                                 <asp:ListItem>5ft 7in - 170cm</asp:ListItem>
                                 <asp:ListItem>5ft 8in - 172cm</asp:ListItem>
                                 <asp:ListItem>5ft 9in - 175cm</asp:ListItem>
                                 <asp:ListItem>5ft 10in - 177cm</asp:ListItem>
                                 <asp:ListItem>5ft 11in - 180cm</asp:ListItem>
                                 <asp:ListItem>6ft - 182cm</asp:ListItem>
                                 <asp:ListItem>6ft 1in - 185cm</asp:ListItem>
                                 <asp:ListItem>6ft 2in - 187cm</asp:ListItem>
                                 <asp:ListItem>6ft 3in - 190cm</asp:ListItem>
                                 <asp:ListItem>6ft 4in - 193cm</asp:ListItem>
                                 <asp:ListItem>6ft 5in - 195cm</asp:ListItem>
                                 <asp:ListItem>6ft 6in - 198cm</asp:ListItem>
                                 <asp:ListItem>6ft 7in - 200cm</asp:ListItem>
                                 <asp:ListItem>6ft 8in - 203cm</asp:ListItem>
                                 <asp:ListItem>6ft 9in - 205cm</asp:ListItem>
                                 <asp:ListItem>6ft 10in - 208cm</asp:ListItem>
                                 <asp:ListItem>6ft 11in - 210cm</asp:ListItem>
                                 <asp:ListItem>7ft - 213cm</asp:ListItem>

                            </asp:DropDownList>
                         </td>

                     </tr>

                 </table>
                
            </div>
        </div>
        <div class="modal-footer">
          <button type="button" id="btnPartnerPreference" class="btn btn-success">Update</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

            <!----pop up model for Update Profile image---->

             <div class="modal fade" id="UploadImage" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="width:440px">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title tdHeadsModel">Profile Photo</h4>
        </div>
        <div class="modal-body" style="height:330px">
          
            <div class="col-lg-12 modal-body">
                <div class="row">
                    <div class="col-sm-12">
                        <asp:Image ID="imgShowBig" runat="server" Height="250px" Width="360px" BorderWidth="2px" />
                    </div>
                    </div>
                     <div class="row">

                         <div class="col-sm-5">
                             <a href="#" title="Delete Profile Image" onclick="removeProfilePhoto();">
                                <span class="glyphicon glyphicon-trash IconEdit"></span>
                            </a>
                         </div>
                    <div class="col-sm-6">
                             <%--<asp:Label runat="server" Text="Label">Profile Image</asp:Label>--%>
                         <br />
                             <asp:FileUpload ID="ProfileImageUpload" runat="server" />
                        <br />
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            
            <asp:Button ID="Button1" CssClass="btn btn-success" OnClick="UploadFile" runat="server" Text="Update" />
          <button type="button" id="btnClose" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

        </div>

        <div class="col-sm-4">
            
           <%--<div id="Matches" class="col-sm-12 divDisgn box" style="height:800px; overflow:auto">--%>
            <div id="Matches" class="col-sm-12 divDisgn box" style="height:845px; overflow:hidden">
            
               <div class="col-sm-12" style="padding-top:20px">
                   <ul class="nav nav-tabs">
                      <li class="active"><a id="2" href="#"><b>Suitable Matches</b></a></li>
                      <li><a id="3" href="#" onclick="OtherMathes();"><b>Other Matches</b></a></li>
                    </ul>
                </div>
             
               <div class="col-sm-12" style="height:750px; overflow:auto"">      
                    <div class="tabContent" id="tabContent2">
                        <div id = "dvMatches" style="padding-top:20px">
                
                        </div>
                    </div>
                 
                    <div class="tabContent" id="tabContent3">
                        <div id = "dvMatchesOther" style="padding-top:20px">
                
                        </div>
                    </div>

                </div>
            </div>
    </div>
</div>

    <script>

        //page loag mathod called here

        $(document).ready(function () {
             $("#ModalPopup").modal("Show");
            matrimonialMatches();

        });

        // this function get the image path and help to show that image
        function readIMG(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $("#<%=imgShowBig.ClientID%>").attr('src', e.target.result)
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        // this is show current and selected image into the file view

        $("#<%=ProfileImageUpload.ClientID%>").change(function () {
            readIMG(this);
        });

        // this function is user to manage Tab/Accordion on that page
        $('.nav a').click(function (e) {
            $(this).tab('show');
            var tabContent = '#tabContent' + this.id;
            $('#tabContent2').hide();
            $('#tabContent3').hide();
            $(tabContent).show();
        })

        // this function used to clear upload popup model
        $("#btnClose").click(function () {
            window.location.href = "/Profile.aspx";
        });

        // this function is used to get other mathes

        function OtherMathes()
        {
            $("#dvMatchesOther").empty();
            var GenderSend;
            if ($("#ContentPlaceHolder1_drpGender").val() == "Male") {
                GenderSend = "Female";
            }
            else {
                GenderSend = "Male";
            }
            var data = {
                "gender": GenderSend,
            };
            $.ajax({
                url: '/Profile.aspx/OtherMatches',
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",

                success: OnSuccessOtherMatches,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }

            });
        }

        // this function call on matches data other recived on success
        function OnSuccessOtherMatches(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var matches = xml.find("Matches");
            var table = $("#dvMatchesOther table").eq(0).clone(true);

            $("#dvMatchesOther table").eq(0).remove();
            $(matches).each(function () {
                var name = $(this).find("name").text();
                var Email = "'" + $(this).find("EmailId").text() + "'";
                var education = $(this).find("Education").text();
                var age = $(this).find("age").text();
                var id = $(this).find("ID").text();

                var image = $(this).find("ProfileImage").text();

                if (image == null || image == '') {
                    $("#dvMatchesOther").append('<div class="col-sm-5 divMatchesDesign labelCapital"><img class="matchesImagePhoto" src=\"/ProfilePhotos/NotAvailable.jpg" + "\" alt=\"\"/><br /><p><b>Name : </b>' + name + '<br><b>Education :</b><br>' + education + '<br><b>Age : </b>' + age + '</P><a href="#" onclick="ContectForMatrimonial(' + id + ')"><span class="glyphicon glyphicon-user" style="font-size:inherit" title="View user profile">View profile</span></a></div>').append();
                }
                else {
                    $("#dvMatchesOther").append('<div class="col-sm-5 divMatchesDesign labelCapital"><img class="matchesImagePhoto" src=\"ProfilePhotos/' + image + '\" alt=\"\" /><br /><p><b>Name : </b>' + name + '<br><b>Education : <br></b>' + education + '<br><b>Age : </b>' + age + '</P><a href="#" onclick="ContectForMatrimonial(' + id + ')"><span class="glyphicon glyphicon-user" style="font-size:inherit" title="View user profile">View profile</span></a></div>').append();
                }
                table = $("#dvMatchesOther table").eq(0).clone(true);
            });
        }

        // This is method get all matches which matches login requirements
        function matrimonialMatches() {
            var GenderSend;
            if ($("#ContentPlaceHolder1_drpGender").val() == "Male") {
                GenderSend = "Female";
            }
            else {
                GenderSend = "Male";
            }

            var data = {
                "partnerQualification": $('#<%=lblPartnerQualification.ClientID%>').text(),
                "maritalStatus": $("#<%=lblPartnerMaritalStatus.ClientID%>").text(),
                "ageFrom": $("#ContentPlaceHolder1_drpAgeFrom").val(),
                "ageTo": $("#ContentPlaceHolder1_drpAgeTo").val(),
                "gender": GenderSend
            };
            $.ajax({
                url: '/Profile.aspx/MatrimonialMatches',
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",

                success: OnSuccess,
                failure: function (response) {
                    alert(response.d);
                },
                error: function (response) {
                    alert(response.d);
                }
            });
        }

        // this function call on matches data recived on success
        function OnSuccess(response) {
            var xmlDoc = $.parseXML(response.d);
            var xml = $(xmlDoc);

            var matches = xml.find("Matches");
            var table = $("#dvMatches table").eq(0).clone(true);

            $("#dvMatches table").eq(0).remove();
            $(matches).each(function () {
                var name = $(this).find("name").text();
                var Email = "'" + $(this).find("EmailId").text() + "'";
                var education = $(this).find("Education").text();
                var age = $(this).find("age").text();
                var id = $(this).find("ID").text();
                var image = $(this).find("ProfileImage").text();
                if (image == null || image == '') {
                    $("#dvMatches").append('<div class="col-sm-5 divMatchesDesign labelCapital"><img class="matchesImagePhoto" src=\"/ProfilePhotos/NotAvailable.jpg" + "\" alt=\"\"/><br /><p><b>Name : </b>' + name + '<br><b>Education :</b><br>' + education + '<br><b>Age : </b>' + age + '</P><a href="#" onclick="ContectForMatrimonial(' + id + ')"><span class="glyphicon glyphicon-user" style="font-size:inherit" title="View user profile">View Profile</span></a></div>').append();
                }
                else {
                    $("#dvMatches").append('<div class="col-sm-5 divMatchesDesign labelCapital"><img class="matchesImagePhoto" src=\"ProfilePhotos/' + image + '\" alt=\"\" /><br /><p><b>Name : </b>' + name + '<br><b>Education : <br></b>' + education + '<br><b>Age : </b>' + age + '</P><a href="#" onclick="ContectForMatrimonial(' + id + ')"><span class="glyphicon glyphicon-user" style="font-size:inherit" title="View user profile">View Profile</span></a></div>').append();
                }
                table = $("#dvMatches table").eq(0).clone(true);
            });
        }

        $("#ContentPlaceHolder1_txtMobile").keydown(function (e) {
            
            // Allow: backspace, delete, tab, escape, enter and .
            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                // Allow: Ctrl+A, Command+A
                (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                // Allow: home, end, left, right, down, up
                (e.keyCode >= 35 && e.keyCode <= 40)) {
                // let it happen, don't do anything
                return;
            }
            // Ensure that it is a number and stop the keypress
            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                e.preventDefault();
            }
        });

        // This is on chanage value function

        $('#ContentPlaceHolder1_drpAgeTo').change(function () {

            if ($('#ContentPlaceHolder1_drpAgeTo').val() < $('#ContentPlaceHolder1_drpAgeFrom').val()) {
                alert("Age should be minmum to maximum!");
                $('#ContentPlaceHolder1_drpAgeTo').val($('#ContentPlaceHolder1_drpAgeFrom').val());
            }
            else { }
        });

        $('#ContentPlaceHolder1_drpMarriedBrother').change(function () {
            
            if ($('#ContentPlaceHolder1_drpMarriedBrother').val() > $('#ContentPlaceHolder1_drpNoOfBrothers').val()) {
                alert("You can't select more than, you have brothers")
                $('#ContentPlaceHolder1_drpMarriedBrother').val($('#ContentPlaceHolder1_drpNoOfBrothers').val());
            }
            else { }
        });

        $('#ContentPlaceHolder1_drpMarriedSisters').change(function () {

            if ($('#ContentPlaceHolder1_drpNoOfSisters').val() < $('#ContentPlaceHolder1_drpMarriedSisters').val()) {
                alert("You can't select more than, you have Sisters")
                $('#ContentPlaceHolder1_drpMarriedSisters').val($('#ContentPlaceHolder1_drpNoOfSisters').val());
            }
            else { }
        });

        // this function is used to view profile by the id
        function ContectForMatrimonial(id)
        {
            window.location.href = "ViewProfileUser.aspx?ProfileId=" + id;
        }

        // this function is used to clear values of the fileds
        function clearpopUpModel()
        {
            $("#ContentPlaceHolder1_txtOldPassword").val('');
            $("#ContentPlaceHolder1_txtNewPassword").val('');
            $("#ContentPlaceHolder1_txtReEnterPassword").val('');
        }

        // this function is used to update partner preference informatiom
        $("#btnPartnerPreference").click(function () {
            var partnerEducation = $("#drpPartnerEducationType").val();
            if (partnerEducation == null)
            {
                partnerEducation = $("#<%=lblPartnerQualification.ClientID%>").text();
                if (partnerEducation == null)
                {
                    partnerEducation = "Less Than High School";
                }
            }
            var data = {
                "id": $('#ContentPlaceHolder1_HiddenUserId').val(),
                "maritalStatus": $("#ContentPlaceHolder1_drpMaritalStatus").val(),
                "PartnerQualification": partnerEducation.toLocaleString(),
                "ageFrom": $("#ContentPlaceHolder1_drpAgeFrom").val(),
                "ageTo": $("#ContentPlaceHolder1_drpAgeTo").val(),
                "heightFrom": $("#ContentPlaceHolder1_drpHeihtFrom").val(),
                "heightTo": $("#ContentPlaceHolder1_drpHeightTo").val()
            };
            $.ajax({
                url: "/Profile.aspx/UpdatePartnerPreference",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",

                success: function (msg) {
                    alert(msg.d);
                    window.location.href = "/Profile.aspx";
                },
                error: function () {
                    alert("Please try again later!");
                }
            });
        });

        // This function is used to update qualification

        $("#btnUpdateEducation").click(function () {

            var data = {
                "id": $('#ContentPlaceHolder1_HiddenUserId').val(),
                "qualification":$("#ContentPlaceHolder1_drpQualification").val(),
                "education": $("#ContentPlaceHolder1_txtEducation").val()
            };
            $.ajax({
                url: "/Profile.aspx/UpdateEducation",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",

                success: function (msg) {
                    alert(msg.d);
                    window.location.href = "/Profile.aspx";
                },
                error: function () {
                    alert("Please try again later!");
                }
            });
        });

        // this function is used to remove profile photo

        function removeProfilePhoto() {
            var data = {
                "id": $('#ContentPlaceHolder1_HiddenUserId').val(),
            };
            $.ajax({
                url: "/Profile.aspx/RemoveProfileImage",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",

                success: function (msg) {
                    alert(msg.d);
                    window.location.href = "/Profile.aspx";
                },
                error: function () {
                    alert("Please try again later!");
                }
            });
        }
       
        // this function is used to update Occupation details

        $("#btnUpdateOccupation").click(function () {

            var data = {
                "id": $('#ContentPlaceHolder1_HiddenUserId').val(),
                "occupation": $("#ContentPlaceHolder1_txtOccupation").val(),
                "occupationType": $("#ContentPlaceHolder1_drpOccupationType").val(),
                "postingUpdate": $("#ContentPlaceHolder1_txtPostingUpdate").val(),
                "annualIncome": $("#ContentPlaceHolder1_txtAnnualIncome").val(),
                "jobDiscription": $("#ContentPlaceHolder1_txtJobDiscription").val()
            };
            $.ajax({
                url: "/Profile.aspx/UpdateOccupation",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",

                success: function (msg) {
                    alert(msg.d);
                    window.location.href = "/Profile.aspx";
                },
                error: function () {
                    alert("Please try again later!");
                }
            });
        });

        // this function is used to update life style information 

        $("#btnUpdateLifestyle").click(function () {

            var language = $("#drpLanguage").val();
            if (language == null)
            {
                language = $("#<%=lblLanguage.ClientID%>").text(); 
                if (language == null)
                {
                    language = "Hindi";
                }
            }
            var data = {
                "id": $('#ContentPlaceHolder1_HiddenUserId').val(),
                "smoke": $("#ContentPlaceHolder1_drpSmoke").val(),
                "language": language.toLocaleString(),
                "foodHabbit": $("#ContentPlaceHolder1_drpFoodHabbit").val(),
                "drink": $("#ContentPlaceHolder1_drpDrink").val(),
            };
            $.ajax({
                url: "/Profile.aspx/UpdateLifeStyle",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",

                success: function (msg) {
                    alert(msg.d);
                    window.location.href = "/Profile.aspx";
                },
                error: function () {
                    alert("Please try again later!");
                }
            });
        });

        // this function is used to upadate password

        $("#btnChangePassword").click(function () {

            if ($("#ContentPlaceHolder1_HiddenPassword").val() != $("#ContentPlaceHolder1_txtOldPassword").val())
            {
                alert("Your password is wrong please try again!");
            }
            else if ($("#ContentPlaceHolder1_txtNewPassword").val() == "" && $("#ContentPlaceHolder1_txtReEnterPassword").val() == "" || $("#ContentPlaceHolder1_txtOldPassword").val() == "") {
                alert("Fileds are empty!")
            }
            else if ($("#ContentPlaceHolder1_txtNewPassword").val() != $("#ContentPlaceHolder1_txtReEnterPassword").val()) {
                alert("New password not matched with confirm password!");
            }
            else {
                var data = {
                    "oldPassword": $("#ContentPlaceHolder1_txtOldPassword").val(),
                    "newPassword": $("#ContentPlaceHolder1_txtNewPassword").val(),
                    "id": $('#ContentPlaceHolder1_HiddenUserId').val()
                };
                $.ajax({
                    url: "/Profile.aspx/UpdatePassword",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                        alert(msg.d);
                        window.location.href = "/Profile.aspx";
                    },
                    error: function () {
                        alert("Please try again later!");
                    }
                });
            }
        });

        //Function is used to update basic information

        $("#btnUpdateBasicInformation").click(function () {

            var data = {
                "id": $('#ContentPlaceHolder1_HiddenUserId').val(),
                "name": $('#ContentPlaceHolder1_txtName').val(),
                "lastName": $("#ContentPlaceHolder1_txtLastName").val(),
                "nativePlace": $("#ContentPlaceHolder1_txtNativePlace").val(),
                "weight": $("#ContentPlaceHolder1_txtWeight").val(),
                "posting": $("#ContentPlaceHolder1_txtPosting").val(),
                "height": $("#ContentPlaceHolder1_drpHeight").val(),
                "phone": $("#ContentPlaceHolder1_txtMobile").val(),
                "address": $("#ContentPlaceHolder1_txtAddress").val(),
                "gender": $("#ContentPlaceHolder1_drpGender").val(),
                "category": $("#ContentPlaceHolder1_drpCategory").val(),
                "work": $("#ContentPlaceHolder1_txtWork").val(),
            };

            if (data.phone.length >= 10) {
                $.ajax({
                    url: "/Profile.aspx/UpdateBasicInformation",
                    data: JSON.stringify(data),
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json",
                    success: function (msg) {
                        alert(msg.d);
                        window.location.href = "/Profile.aspx";
                    },
                    error: function () {
                        alert("Please try again later!");
                    }
                });
            }
            else {
                alert("Mobile no is not valid, please fill at least 10 digits!");
            }
        });

        // This function is used to upadate family information

        $("#btnUpdateFamilyInformation").click(function () {

            var data = {
                "id": $('#ContentPlaceHolder1_HiddenUserId').val(),
                "grandMother": $("#ContentPlaceHolder1_txtGrandMother").val(),
                "grandFather": $("#ContentPlaceHolder1_txtGrandFather").val(),
                "brotherNo": $("#ContentPlaceHolder1_drpNoOfBrothers").val(),
                "brotherMarried": $("#ContentPlaceHolder1_drpMarriedBrother").val(),
                "sisterNo": $("#ContentPlaceHolder1_drpNoOfSisters").val(),
                "sisterMarried": $("#ContentPlaceHolder1_drpMarriedSisters").val(),
                "familyFood": $("#ContentPlaceHolder1_drpFamilyFoodType").val(),
                "fatherName": $("#ContentPlaceHolder1_txtFatherName").val(),
                "motherName": $("#ContentPlaceHolder1_txtMotherName").val(),
                "motherWork": $("#ContentPlaceHolder1_txtMotherProfession").val(),
                "fatherWork": $("#ContentPlaceHolder1_txtFatherProfession").val(),
                "socialWork": $("#ContentPlaceHolder1_txtFamilySocialWork").val(),
                "disease": $("#ContentPlaceHolder1_txtFamilyDisease").val(),
                "achievement": $("#ContentPlaceHolder1_txtAchievement").val()
            };
            $.ajax({
                url: "/Profile.aspx/UpdateFamilyInformation",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",

                success: function (msg) {
                    alert(msg.d);
                    window.location.href = "/Profile.aspx";
                },
                error: function () {
                    alert("Please try again later!");
                }
            });
        });

    </script>
</asp:Content>
