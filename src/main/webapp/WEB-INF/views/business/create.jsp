﻿﻿﻿
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}${pageContext.request.contextPath}/static/images/favicon.jpg">

    <!-- All css files are included here -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/custom.css">

    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/static/js/modernizr-2.8.3.min.js"></script>

    <style>
        .selector .col-md-3 select {
            height: 30px;
            border: 1px solid #fff;
            color: #fff;
            font-size: 12px;
            -moz-appearance: none;
            -webkit-appearance: none;
            /*在选择框的最右侧中间显示小箭头图片*/
            background: transparent url("http://ourjs.github.io/static/2015/arrow.png") no-repeat scroll right center;
            /*为下拉小箭头留出一点位置，避免被文字覆盖*/
            padding-right: 14px;
            border-radius: 0;
        }

        .selector .col-md-3 select::-ms-expand {
            display: none;
        }

        .selector .col-md-3 option {
            background-color: #363636;
            color: #fff;
            font-size: 12px;
        }

        .selector .col-md-3 option:hover {
            background-color: #ccc;
        }

        .selector .col-md-7 input:focus {
            border: 1px solid #fff;
        }

        .selector .col-md-7 input {
            height: 30px;
        }

        .header-top {
            height: 50px;
            padding-top: 10px;
        }
    </style>
</head>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Body main wrapper start -->
<div class="wrapper">
    <!-- Start of header area -->
    <header style="margin-top:-20px;">
        <jsp:include page="/getToolBar"/>
        <div class="header-bottom">
            <div class="container">
                <div class="row header-middle-content">
                    <div class="col-md-4 col-sm-4 hidden-xs">
                    </div>
                    <div class="col-md-3 col-sm-4 col-xs-12" style="margin-left:30px;">
                        <div class="header-logo text-center">
                            <a href="${pageContext.request.contextPath}/static/userPage/index.html"><img alt=""
                                                                                                         src="${pageContext.request.contextPath}/static/images/logo.png"></a>
                        </div>
                    </div>
                    <div class="col-md-offset-0 col-md-5 col-sm-offset-0 col-sm-4 col-xs-offset-3 col-xs-6">
                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="container">
        <div class="row" style="margin-top:20px;margin-left:70px;">
            <div class="col-md-4"></div>
            <div class="col-md-3">
                <!--
                <form action="createShop" method="post" >
                -->
                <div class="form-group">
                    <input type="text" id="name" placeholder="请输入店铺名" class="form-control"/>
                </div>
                <div class="form-group">
                    <input type="text" id="description" placeholder="请输入店铺描述" class="form-control"/>
                </div>
                <div class="form-group">
                    <input type="text" id="phoneNumber" placeholder="请输入手机号" class="form-control"/>
                </div>
                <!--
                <div class="form-group">
                    <span>上传店铺图片</span><input type="file" name="shoppicture" placeholder="上传店铺图片" class="form-control" style="padding:4px;"/>
                </div>
                -->
                <input type="submit" class="btn btn-default form-control" value="注册新店铺" onclick="createShop()"
                       style="width:100%;height:60px;background-color:#383838;color:#fff;font-weight:bold;font-size:20px;">
                <!--
                </form>
                -->
            </div>
            <div class="col-md-5">
            </div>
        </div>
    </div>

</div>


<!-- Start footer area -->
<footer id="footer" class="footer-area" style="margin-top:30px;">
    <div class="footer-top-area text-center ptb-40">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="footer-top-content">
                        <a href="index.jsp">
                            <img src="${pageContext.request.contextPath}/static/images/footer/logo.png" alt="">
                        </a>
                        <p class="pb-30">最好的商品购物平台，最优质的商品服务系统，满足你所有的购物心理</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-sm-6 col-xs-12" style="padding-left:40px;">
                    <div class="copyright">
                        <p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank"
                                                                                     href="http://sc.chinaz.com/moban/"></a>
                        </p>
                    </div>
                </div>
                <div class="col-md-5 hidden-sm hidden-xs">
                    <nav>
                        <ul class="footer-bottom-menu">
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="">Wish List</a></li>
                            <li><a href="#">Newsletter</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- End footer area -->
</div>
<!-- Body main wrapper end -->

<!-- Placed js at the end of the document so the pages load faster -->

<!-- jquery latest version -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<!-- Bootstrap framework js -->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<!-- All js plugins included in this file. -->
<script src="${pageContext.request.contextPath}/static/js/plugins.js"></script>
<!-- Load Cookies -->
<script src="${pageContext.request.contextPath}/static/js/loginAndRegister/cookie.js"></script>
<!-- Load create shop script -->
<script src="${pageContext.request.contextPath}/static/js/request/createShop.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>
</body>

</html>
