<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <jsp:include page="/getToolBar"/>
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
                <div class="row" style="padding:10px;margin-top:20px;">
                    <table border="1" class="shdz">
                        <tr style="width:100%;">
                            <td><input id="receiverName" type="text" class="form-control" placeholder="姓名"></td>
                            <td><input id="receiverAddress" type="text" class="form-control" placeholder="地址"></td>
                            <td><input id="receiverPhoneNumber" type="text" class="form-control" placeholder="手机号"></td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- 商品信息 -->
            <div style="margin-top:1%;">
                <div class="" style="border:1px solid #E2E2E2;background-color:#F9F9F9;border-left:2px solid #F3168A;padding:5px;">
                    <h4 style="padding-top:5px;">商品信息</h4>
                </div>
                <div class="row" style="padding:10px;margin-top:20px;">
                    <div class="col-md-4" >
                        <a id="commodityDetails" value="${commodity.id}" href="#"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                    </div>
                    <div class="col-md-4" style="margin-top:20px;padding:20px;">
                        <h4 id="commodityName">商品名:${commodity.name}</h4>
                    </div>
                    <div class="col-md-1" style="margin-top:25px;padding:20px;">
                        <h4 id="commodityType" value="${type.id}">型号:${type.name}</h4>
                    </div>
                    <div class="col-md-2" style="margin-top:25px;padding:20px;">
                        <h4 id="commodityPrice">价格:￥${commodity.price}</h4>
                    </div>
                    <div class="col-md-1" style="margin-top:25px;padding:20px;">
                        <h4 id="commodityCount" value="${count}">数量:${count}</h4>
                    </div>
                </div>
            </div>

            <!-- 付款方式 -->
            <div style="margin-top:14%;">
                <div class="" style="border:1px solid #E2E2E2;background-color:#F9F9F9;border-left:2px solid #F3168A;padding:5px;">
                    <h4 style="padding-top:5px;">付款方式</h4>
                </div>
                <div class="" style="padding:10px;margin-top:20px;">
                    <div class="list-group">
                          <a  class="list-group-item">在线支付</a>
                    </div>  
                </div>
            </div>

            <div class="" style="border:1px solid #E2E2E2;background-color:#F9F9F9;border-left:2px solid #F3168A;padding:5px;">
                <span>合计</span><h4 style="padding-top:5px;">￥49</h4>
                </div>

            <!-- 付款二维码 -->
            <button type="button" class="btn btn-default" style="width:10%;height:30px;margin:0 auto;margin-top:30px;background-color:#F10180;color:#fff;border-radius:5px;font-size:15px;" data-toggle="modal" data-target="#myModal" onclick="pay()">
                结算
            </button>
            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" style="margin-left:20%;margin-top:60px;">
                <div class="modal-dialog" role="document">
                    <div class="modal-content" style="width:340px;">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" ><span aria-hidden="true" >&times;</span></button>
                            <h5 class="modal-title" id="myModalLabel" style="margin-left:20px;">支付宝 扫一扫 付款</h5>
                        </div>
                        <div class="modal-body">
                            <img src="${pageContext.request.contextPath}/static/images/qrcode.png" style="width:300px;height:300px;">
                        </div>
                    </div>
                </div>
            </div>
            <!-- 付款二维码结束************************************ -->

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
    <!-- Load Cookies -->
    <script src="${pageContext.request.contextPath}/static/js/loginAndRegister/cookie.js"></script>
    <!-- Load Search -->
    <script src="${pageContext.request.contextPath}/static/js/request/search.js"></script>
    <!-- Load Toolbar -->
    <script src="${pageContext.request.contextPath}/static/js/request/toolBar.js"></script>
    <!--Load Pay-->
    <script src="${pageContext.request.contextPath}/static/js/request/pay.js"></script>
</body>

</html>
