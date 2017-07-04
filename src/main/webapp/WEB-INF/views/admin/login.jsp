<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/static/images/favicon.jpg">

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
</head>

<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Body main wrapper start -->
<div class="wrapper">
    <!-- Start of header area -->
    <header>
        <div class="header-top gray-bg">
            <div class="container">
                <div class="row">
                    <div class="col-sm-5 hidden-xs">
                        <div class="header-top-left">
                            <ul class="header-top-style text-capitalize mr-25">
                                <li><a href="../userPage/index.html"><span class="mr-10">首页</span></a>
                                </li>
                            </ul>
                            <ul class="header-top-style text-capitalize mr-25">
                                <li><a href="../userPage/grzx.html"><span class="mr-10">个人中心</span><i class="fa fa-angle-down"></i></a>
                                    <ul class="ul-style currency box-shadow white-bg">
                                        <li><a href="../userPage/login.html"><i class="fa fa-usd"></i><span>登录</span></a></li>
                                        <li><a href="../userPage/sign.html"><i class="fa fa-euro"></i><span>注册</span></a></li>
                                        <li><a href="../userPage/grzx.html"><i class="fa fa-gbp"></i><span>我的</span></a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="header-top-style pl-10">
                                <li>
                                    <a href="../userPage/grzx.html"><span class="mr-10">我的订单</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-3 col-xs-6">
                    </div>
                    <div class="col-sm-4 col-xs-6">
                        <div class="header-top-right">
                            <span class="mr-20"><a href="#"><img alt="" src="${pageContext.request.contextPath}/static/images/header/search-icon.png"></a></span>
                            <span><input type="text" class="pl-10" placeholder="请输入店铺名、商品"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-bottom">
            <div class="container">
                <div class="row header-middle-content">
                    <div class="col-md-5 col-sm-4 hidden-xs">
                    </div>
                    <div class="col-md-2 col-sm-4 col-xs-12">
                        <div class="header-logo text-center">
                            <a href="index.jsp"><img alt="" src="${pageContext.request.contextPath}/static/images/logo.png"></a>
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
            <div class="col-md-4">
            </div>
            <div class="col-md-3">
                <form action="" >
                    <div class="form-group">
                        <input type="text" name="username" placeholder="请输入用户名" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <input type="text" name="stuemail" placeholder="请输入密码" class="form-control" />
                    </div>
                    <button type="submit" class="btn btn-default" class="form-control" style="width:100%;height:60px;background-color:#383838;color:#fff;font-weight:bold;font-size:20px;"><a href="index.jsp">登录</a></button>
                </form>
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
                        <p>Copyright &copy; 2017.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/"></a></p>
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
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>

</body>

</html>
