<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="EventPrize.aspx.vb" Inherits="EktaTrust.EventPrize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="clsBackImage wow fadeInDown animated">
        <div class="col-sm-12">

            <h2 style="padding-bottom: 12px;">Run For Equality 2018 - Prize money for winners</h2>
        </div>

        <div class="col-sm-12">
            <div class="col-sm-3">


                <table class="table table-striped" style="box-shadow: 0px 1px 10px 2px lightgrey;">
                    <tr>
                        <td colspan="2">
                            <h6>21K ( Male/Female )</h6>
                        </td>
                    </tr>
                    <tr>
                        <td>First</td>
                        <td>Rs. 11,000</td>
                    </tr>
                    <tr>
                        <td>Second</td>
                        <td>Rs. 5,100</td>
                    </tr>
                    <tr>
                        <td>Third</td>
                        <td>Rs. 3,100</td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <h6>10K ( Male/Female )</h6>
                        </td>
                    </tr>
                    <tr>
                        <td>First</td>
                        <td>Rs. 5,100</td>
                    </tr>
                    <tr>
                        <td>Second</td>
                        <td>Rs. 3,100</td>
                    </tr>
                    <tr>
                        <td>Third</td>
                        <td>Rs. 2,100</td>
                    </tr>

                    <tr>
                        <td colspan="2">
                            <h6>5K ( Male/Female )</h6>
                        </td>
                    </tr>
                    <tr>
                        <td>First</td>
                        <td>Rs. 3,100</td>
                    </tr>
                    <tr>
                        <td>Second</td>
                        <td>Rs. 2,100</td>
                    </tr>
                    <tr>
                        <td>Third</td>
                        <td>Rs. 1,100</td>
                    </tr>

                </table>
            </div>
            <div class="col-sm-9">
                <img src="RunForEquality2018/Ekta%20Banner.jpeg" class="img-responsive" style="box-shadow: 0px 1px 10px 2px lightgrey;" />
            </div>
        </div>
        <div class="row">
            <center>
            <a href="../EventRegistrationDetails">
        <input type="button" style="margin-bottom:15px;margin-top:10px;font-size:larger;" id="EventRegistration" class="btn btn-success" value="Continue" />
        </a>
            </center>
        </div>
    </div>

     <video src="RunForEqualityGallery/RunForEqualityFMAds.mpeg" height="0" width="0" id="FMaudio" autoplay="autoplay"></video>

    <script>
        $(document).ready(function () {
            var vid = document.getElementById("FMaudio");
            vid.volume = 0.2;
        });
</script> 

</asp:Content>
