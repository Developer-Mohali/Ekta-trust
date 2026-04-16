<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/Admin.Master" CodeBehind="RunForEquality2026.aspx.vb" Inherits="EktaTrust.RunForEquality2026" %>
<%@ Register Src="~/Controls/GallerySideMenuControl.ascx" TagPrefix="uc" TagName="GallerySideMenuControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CssGallery/src/jquery.littlelightbox.css" rel="stylesheet" />
    <link href="Css/css/Gallery.css?v=1" rel="stylesheet" />

    <section class="page">
        <!-- Page Content -->
        <div class="container">
            <div class="jquery-script-ads" style="margin: 6px auto;">
                <p class="gallery">
                    Run For Equality 2026
            <hr class="row marginImage" style="border: 1px dotted orange;" />
                </p>
            </div>

            <div class="row marginImage" style="margin-left: 15px">
            </div>

            <%-- gallery event menu --%>
            <uc:GallerySideMenuControl runat="server" ID="GallerySideMenuControl" />

            <div class="col-md-9 col-sm-10 col-xs-12" style="padding-right: 0px; padding-left: 0px; top: 10px;">

                <!--one row-->
                <div class="row marginImage" style="margin-left: 15px">
                       <div id="box" class="burst-side strawberry">
                        <div class="caption"></div>
                        <img class="thumbnail" id="dd" src="RunForEqualityGallery/RunForEquality2026_1.jpeg" alt="Run For Equality 2026" />
                        <div>
                            <a class="lightbox" href="RunForEqualityGallery/RunForEquality2026_1.jpeg" data-littlelightbox-group="gallery">
                                <h1>View Image</h1>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row" style="padding-left: 22px; padding-top: 25px">
                    <div class="col-sm-6">
                        <video class="desktop-video" controls="" style="cursor: pointer">
                            <source src="RunForEqualityGallery/RunForEquality2026_video1.mp4" type="video/mp4" />
                        </video>
                    </div>
                    <div class="col-sm-6">
                        <video class="desktop-video" controls="" style="cursor: pointer">
                            <source src="RunForEqualityGallery/RunForEquality2026_video2.mp4" type="video/mp4" />
                        </video>
                    </div>
                </div>
            </div>

        </div>


    </section>


    <script src="CssGallery/src/jquery.littlelightbox.js"></script>
    <script>
        $('.lightbox').littleLightBox();
    </script>
    <style>
       /* .span {
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            font-size: small;
        }*/

        .hovereffect {
            width: 100%;
            height: 100%;
            float: left;
            overflow: hidden;
            position: relative;
            text-align: center;
            cursor: default;
            background: -webkit-linear-gradient(45deg, #ff89e9 0%, #05abe0 100%);
            background: linear-gradient(45deg, #ff89e9 0%,#05abe0 100%);
        }

            .hovereffect .overlay {
                width: 100%;
                height: 100%;
                position: absolute;
                overflow: hidden;
                top: 0;
                left: 0;
                padding: 3em;
                text-align: left;
            }

            .hovereffect img {
                display: block;
                position: relative;
                max-width: none;
                width: calc(100% + 60px);
                -webkit-transition: opacity 0.35s, -webkit-transform 0.45s;
                transition: opacity 0.35s, transform 0.45s;
                -webkit-transform: translate3d(-40px,0,0);
                transform: translate3d(-40px,0,0);
            }

            .hovereffect h2 {
                text-transform: uppercase;
                color: #fff;
                position: relative;
                font-size: 17px;
                background-color: transparent;
                padding: 15% 0 10px 0;
                text-align: left;
            }

            .hovereffect .overlay:before {
                position: absolute;
                top: 20px;
                right: 20px;
                bottom: 20px;
                left: 20px;
                border: 1px solid #fff;
                content: '';
                opacity: 0;
                filter: alpha(opacity=0);
                -webkit-transition: opacity 0.35s, -webkit-transform 0.45s;
                transition: opacity 0.35s, transform 0.45s;
                -webkit-transform: translate3d(-20px,0,0);
                transform: translate3d(-20px,0,0);
            }

            .hovereffect a, .hovereffect p {
                color: #FFF;
                opacity: 0;
                filter: alpha(opacity=0);
                -webkit-transition: opacity 0.35s, -webkit-transform 0.45s;
                transition: opacity 0.35s, transform 0.45s;
                -webkit-transform: translate3d(-10px,0,0);
                transform: translate3d(-10px,0,0);
            }

            .hovereffect:hover img {
                opacity: 0.6;
                filter: alpha(opacity=60);
                -webkit-transform: translate3d(0,0,0);
                transform: translate3d(0,0,0);
            }

            .hovereffect:hover .overlay:before,
            .hovereffect:hover a, .hovereffect:hover p {
                opacity: 1;
                filter: alpha(opacity=100);
                -webkit-transform: translate3d(0,0,0);
                transform: translate3d(0,0,0);
            }
/*
        .container {
            padding-left: 40px;
        }

        .p {
            padding-top: 9px;
        }*/
    </style>

    <link href="CssGallery/style.css?v=1" rel="stylesheet" />
    <link href="CssGallery/figure.css?v=1" rel="stylesheet" />

</asp:Content>