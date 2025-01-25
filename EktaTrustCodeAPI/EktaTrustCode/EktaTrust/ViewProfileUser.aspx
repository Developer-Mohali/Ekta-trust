<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/ProfileMaster.Master" CodeBehind="ViewProfileUser.aspx.vb" Inherits="EktaTrust.ViewProfileUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        .ImagePhoto {
            margin-top: 10px;
            margin-bottom: 10px;
            height: 150px;
            width: 150px;
            border-radius: 50%;
            box-shadow: 0px 0px 10px 5px #999;
        }

        .labelCapital {
            text-transform:capitalize;
        }

        .box {
            border: 5px solid #eee;
            background: #FFF;
            border-radius:10px !important;
            box-shadow: 0px 0px 10px 2px #999;
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

        .trBack {
            background-color: #d9edf7;
        }

        .tdHeads {
            text-align:left;
            font-size:large;
            color:dodgerblue;
        }

        .labelfont {
            font-weight:bold;
        }

        .labelCapital {
            text-transform:capitalize;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row" style="background-color:#F1F1F2 !important">

        <div class="col-sm-2">
            <div class="col-sm-12"></div>
                <div class="col-sm-12 divDisgn box">
                    <div class="show-image">
                        <asp:Image CssClass="ImagePhoto" ID="imgProfilePhoto" runat="server" />
                    </div>
                    <hr style="border:2px inset" />
                    <asp:Label ID="lblUserName" CssClass="labelCapital" runat="server" Text="Label" Font-Size="Large"></asp:Label><br />
                    <asp:HiddenField ID="HiddenViewUserId" runat="server" />
                    <asp:HiddenField ID="HiddenEmailId" runat="server" />
                    <a href="#" onclick="ContectForMatrimonial();" title="Send Email Or Connect"><b><asp:Label runat="server" Font-Size="Large" ForeColor="Blue">Send Mail</asp:Label></b></a>
                    <br />
                </div>

            </div>

        <div class="col-sm-10">

            <div class="col-lg-12">
                 <table class="col-sm-12 table-hover box divDisgn">
                     <!------Basic information------------->

                     <tr class="trBack">
                         <td class="tdHeads" colspan="3">
                             Basic Information
                         </td>
                         <td class="tdstyle">
                             &nbsp;
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
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblMaritalStatus" runat="server" Text="Label"></asp:Label>
                         </td>
                    </tr>

                    <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Permanent Address</asp:Label>
                         </td>
                         <td class="col-sm-3" colspan="2">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblPermanentAddress" runat="server" Text="Label"></asp:Label>
                         </td>
                    </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!------Qualification------->

                     <tr class="trBack">
                         <td class="tdHeads" colspan="4">
                             Qualification
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!-----fifth row----->

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
                         <td class="tdHeads" colspan="4">
                             Occupation
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Occupation</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblOccupation" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
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
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblPostingUpdate" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
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
                         
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <!-------- family information ------>

                     <tr class="trBack">
                         <td class="tdHeads" colspan="4">
                             Family Information
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
                             
                         </td>
                     </tr>

                     <tr><td colspan="4">&nbsp;</td></tr>

                     <tr>
                         <td class="col-sm-3">
                             <asp:Label CssClass="labelfont" runat="server" Text="Label">Language</asp:Label>
                         </td>
                         <td class="col-sm-3">
                             <b>:</b>&nbsp;&nbsp;<asp:Label ID="lblLanguage" CssClass="labelCapital" runat="server" Text="Label"></asp:Label>
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
                         <td class="tdHeads" colspan="4">
                             Partner Preference
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
        </div>
    </div>

    <script type="text/javascript">

        // This function is used to send request or her information to that person

        function ContectForMatrimonial()
        {
            var data = {
                "id": $('#<%=HiddenViewUserId.ClientID%>').val(),
                "emailTo": $('#<%=HiddenEmailId.ClientID%>').val()
            };
            console.log(data);
            $.ajax({
                url: "/ViewProfileUser.aspx/ContectForMatrimonialRequest",
                data: JSON.stringify(data),
                type: "POST",
                dataType: "json",
                contentType: "application/json",
                success: function (msg) {
                    alert(msg.d);
                    //window.location.href = "/Profile.aspx";
                },
                error: function () {
                    alert("Please try again later!");
                }
            });
        }

    </script>
</asp:Content>
