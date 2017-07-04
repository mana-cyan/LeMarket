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

    <style>
        .shdz td{
            width:40%;
            padding:10px;
        }
         .selector .col-md-3 select{
             height:30px;border:1px solid #fff;color:#fff;font-size: 12px;
             -moz-appearance:none;
             -webkit-appearance:none;
             /*在选择框的最右侧中间显示小箭头图片*/
             background: transparent url("http://ourjs.github.io/static/2015/arrow.png") no-repeat scroll right center;
             /*为下拉小箭头留出一点位置，避免被文字覆盖*/
             padding-right: 14px;
             border-radius: 0;
         }

        .selector .col-md-3 select::-ms-expand { display: none; }
        .selector .col-md-3 option{
            background-color:#363636;color:#fff;
            font-size: 12px;
        }

        .selector .col-md-3 option:hover{
            background-color:#ccc;
        }
        .selector .col-md-7 input:focus{
            border:1px solid #fff;
        }
        .selector .col-md-7 input{
            height:30px;
        }

        .header-top {height:50px;padding-top:10px;}
    </style>
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
                                    <li><a href="../index.jsp"><span class="mr-10">首页</span></a>
                                    </li>
                                </ul>
                                 <ul class="header-top-style text-capitalize mr-25">
                                    <li><a href="userPage.jsp"><span class="mr-10">个人中心</span><i class="fa fa-angle-down"></i></a>
                                        <ul class="ul-style currency box-shadow white-bg">
                                            <li><a href="login.html"><i class="fa fa-usd"></i><span>登录</span></a></li>
                                            <li><a href="register.jsp"><i class="fa fa-euro"></i><span>注册</span></a></li>
                                            <li><a href="userPage.jsp"><i class="fa fa-gbp"></i><span>我的</span></a></li>
                                        </ul>
                                    </li>
                                </ul> 
                                <ul class="header-top-style pl-10">
                                    <li>
                                        <a href="userPage.jsp"><span class="mr-10">我的订单</span></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-3 col-xs-6">
                        </div>
                        <div class="col-sm-4 col-xs-6 selector">
                            <div class="col-md-3" style="margin-right:-30px;">
                                <form action="" >
                                    <label>
                                        <select name="">
                                            <option value="shop">搜店铺</option>
                                            <option value="commodity">搜商品</option>
                                        </select>
                                    </label>
                                </form>
                            </div>
                            <div class="col-md-7" >
                                <span><input type="text" class="pl-10" placeholder="请输入店铺名、商品" style="border-left:0;color:#fff;"></span>
                            </div>
                            <div class="col-md-2">
                                <span class="mr-20" ><a href="#"><img alt="" src="${pageContext.request.contextPath}/static/images/header/search-icon.png" style="width:20px;height:20px;margin-top:5px;margin-left:-15px;"></a></span>
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
                                <a href="../index.jsp"><h4 style="color:#CD6289;">确认订单信息</h4></a>
                            </div>
                        </div>
                        <div class="col-md-offset-0 col-md-5 col-sm-offset-0 col-sm-4 col-xs-offset-3 col-xs-6">
                        </div>
                    </div>
                </div>
            </div>       
        </header>

        <div class="container">
            <!-- 收货信息 -->
            <div>
                <div class="" style="border:1px solid #E2E2E2;background-color:#F9F9F9;border-left:2px solid #F3168A;padding:5px;">
                    <h4 style="padding-top:5px;">收货信息</h4>
                </div>
                <div calss="row" style="padding:10px;margin-top:20px;">
                    <table border="1" class="shdz">
                        <tr style="width:100%;">
                            <td>颜池</td>
                            <td>湖北省 武汉市 洪山区 珞南街道 152华中师范大学</td>
                            <td>13437256907</td>
                            <td><button type="button" class="btn btn-default"><a href="userPage.jsp">修改</a></button></td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- 商品清单 -->
            <div style="margin-top:1%;">
                <div class="" style="border:1px solid #E2E2E2;background-color:#F9F9F9;border-left:2px solid #F3168A;padding:5px;">
                    <h4 style="padding-top:5px;">商品清单</h4>
                </div>
                <div calss="row" style="padding:10px;margin-top:20px;">
                    <div class="col-md-4" >
                        <a href="../commodity/commodityDetails.jsp"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                    </div>
                    <div class="col-md-5" style="margin-top:20px;padding:20px;">
                        <span>女装连衣裙净黑色</span>
                    </div>
                    <div class="col-md-3" style="margin-top:25px;padding:20px;">
                        <h4>￥49</h4>
                    </div>
                </div>
            </div>

            <!-- 付款方式 -->
            <div style="margin-top:14%;">
                <div class="" style="border:1px solid #E2E2E2;background-color:#F9F9F9;border-left:2px solid #F3168A;padding:5px;">
                    <h4 style="padding-top:5px;">付款方式</h4>
                </div>
                <div calss="" style="padding:10px;margin-top:20px;">
                    <div class="list-group">
                          <a  class="list-group-item">在线支付</a>
                          <a  class="list-group-item">货到付款</a>
                    </div>  
                </div>
            </div>

            <div class="" style="border:1px solid #E2E2E2;background-color:#F9F9F9;border-left:2px solid #F3168A;padding:5px;">
                <span>合计</span><h4 style="padding-top:5px;"><span>￥</span>49</h4>
                </div>
            <button type="button" class="btn btn-default" style="width:10%;height:30px;margin:0 auto;margin-top:30px;background-color:#F10180;color:#fff;border-radius:5px;font-size:15px;">提交订单</button>
        </div>


        <!-- Start footer area -->
        <footer id="footer" class="footer-area" style="margin-top:30px;">
            <div class="footer-top-area text-center ptb-40">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="footer-top-content">
                                <a href="../index.jsp">
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
