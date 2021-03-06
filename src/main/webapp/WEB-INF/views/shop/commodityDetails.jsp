<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>${commodity.name}</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- jquery latest version -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
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

    <!-- 评论 -->
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet">
    <!-- 发表评论与评论显示 -->
    <link  rel="stylesheet" href="${pageContext.request.contextPath}/static/css/main.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/sinaFaceAndEffec.css" />
    <!-- 发表评论与评论展示 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/main.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/sinaFaceAndEffec.js"></script>

    <!-- Modernizr JS -->
    <script src="${pageContext.request.contextPath}/static/js/modernizr-2.8.3.min.js"></script>

    <script type="text/javascript">
        window.onload = function(){
            $(".buyBtn").click(function(){
                var buyGoodsOri=$(".buyGoodsOri");
                buyGoodsOri.animate({
                    top:'-400px',
                    left:'-650px',
                    height:'40px',
                    width:'30px'
                },"slow");
                buyGoodsOri.animate({
                    top:'-400px',
                    left:'-650px',
                    height:'0px',
                    width:'0px'
                },"slow");
                buyGoodsOri.animate({
                    top:'420px',
                    left:'300px',
                    height:'0px',
                    width:'0px'
                },"slow");
                buyGoodsOri.animate({
                    top:'420px',
                    left:'300px',
                    height:'40px',
                    width:'30px'
                },"slow");
            });
        }
    </script>

    <style>
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
    </header>

    <div class="container" style="margin-top:30px;">
        <div class="row">
            <div class="col-md-6">
                <img id="commodityPicture" name="${commodity.image}" cid="${commodity.id}" src="" style="width:80%;height:70%;">
            </div>
            <div class="col-md-6" style="margin-top:10px;">
                <h4><strong>${commodity.name}</strong></h4>
                <div class="price" style="background-color:#FAF5F8;padding-left:10px;padding-bottom:10px;">
                    <span style="color:#F10180;font-size:20px;">￥</span><span style="color:#F10180;font-size:60px;">${commodity.price}</span>
                </div>
                <div style="border-top:1px solid #FAF5F8;border-bottom:1px solid #FAF5F8;margin-top:20px;padding-top:5px;">
                    <div style="margin-top:5px;"><span>商品描述：</span><span>${commodity.details}</span></div>
                    <!--<div style="margin-top:5px;"><span>洗涤规则：</span><span>手洗，不可漂白，悬挂晾干，低温熨烫，常规干洗</span></div>-->
                    <div style="margin-top:5px;"><span>店铺：</span><span><a href="#">${commodity.shop.name} (点击进入店铺)</a></span></div>
                </div>
                <div style="margin-top:20px;">
                    <span >运费：</span><span style="color:#fff;background-color:#F3B241;">免运费</span><span ></span>
                </div>
                <div style="margin-top:20px;">
                    <div id="type" value="" class="row">
                        <div class="col-md-2" style="width: 10%;">
                            <span>型号</span>
                        </div>
                    </div>
                </div>
                <div style="margin-top:20px;">
                    <span >数量：</span>
                    <span style="">
                            <button id="numSub" style="width:5%;padding:5px;background-color: #fff;border:1px solid #ccc;">-</button>
                            <span id="count" style="width:30px;padding:10px;">1</span>
                            <button id="numAdd" style="width:5%;padding:5px;background-color: #fff;border:1px solid #ccc;">+</button>
                        </span>

                </div>
                <div style="margin-top:20px;">
                    <a href="#"><button style="color:#fff;background-color:#F10180;font-size:25px;padding:10px;border-radius:5px;" onclick="pay()">立即购买</button></a>
                    <a href="want"><button style="color:#fff;background-color:#F10180;font-size:25px;padding:10px;margin-left:10px;border-radius:5px;" class="buyBtn">加入购物车</button></a>
                    <img id="thumbs" src="${pageContext.request.contextPath}/static/images/product/arrival/3.jpg"  class="buyGoodsOri" style="margin-left:-100px;z-index:-1;position:absolute;width:30px;height:40px;margin-top:-50px;">
                </div>
            </div>
        </div>
    </div>

    <!-- 评论部分 -->
    <div class="container" style="margin-top:20px;width:87%;">
        <div class="row bg-pinglun">
            <!-- 列表部分 -->
            <div class="pinglun">
                <p style="background-color:#FAF5F8;height:40px;padding:10px;">用户评论<span style="float:right;"><a href="#">更多</a></span></p>
                <!-- 发表评论与评论显示 -->
                <div id="content" style="width: 100%; height: auto;">
                    <div class="wrap">

                        <!-- 评论的内容，初始设置为两条 -->
                        <div id="info-show">
                            <ul></ul>
                        </div>
                    </div>
                </div>

                <!-- 分页 -->
                <nav aria-label="Page navigation" class="text-center">
                    <ul class="pagination" style="">
                        <li style="width:30px;">
                            <a href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;上一页</span>
                            </a>
                        </li>
                        <li><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">...</a></li>
                        <li>
                            <a href="#" aria-label="Next">
                                <span aria-hidden="true">下一页&raquo;</span>
                            </a>
                        </li>
                        <span style="margin-top:10px;margin-left:20px;">共<span>100</span>页,</span>
                        <span style="margin-top:10px;">跳转到<input style="width:40px;height:30px;margin:0 5px;" value="1">页<input type="button" value="确定" style="width:40px;height:30px;margin:0 5px;padding:3px;background-color:#eee;"></span>
                    </ul>
                </nav>
                <!-- 分页结束************************************* -->

            </div>
        </div>
    </div>

    <!-- 相关商品 -->
    <div class="new-arrival-area" style="margin-top:30px;">
        <div class="container">
            <div class="row rp-style-2">
                <div class="col-md-12">
                    <div class="section-title text-center mb-35">
                        <h2 class="text-uppercase"><strong>特别推荐</strong></h2>
                        <p class="text-defualt">新品上市</p>
                        <img alt="" src="${pageContext.request.contextPath}/static/images/section-border.png">
                    </div>
                </div>
            </div>
            <div class="row rp-style-2">
                <div class="featured-carousel indicator-style">
                    <div class="product-container cp-style-2">
                        <div class="product-inner">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <!--
                            <span class="product-tag text-uppercase orang-bg">-20%</span>
                            -->
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                    <!--
                                    <li class="text-right p-price">$190</li>
                                    -->
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="commodityDetails.jsp" title="Eletria ostma"></a>
                                </h6>
                            </div>
                        </div>
                        <div class="product-inner mt-35">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                    <!--
                                    <li class="text-right p-price">$180</li>
                                    -->
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="commodityDetails.jsp" title="Eletria ostma"></a>
                                </h6>
                            </div>
                        </div>
                    </div>
                    <div class="product-container cp-style-2">
                        <div class="product-inner">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="#" title="Wetria postma"></a>
                                </h6>
                            </div>
                        </div>
                        <div class="product-inner mt-35">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="#" title="Eletria ostma"></a>
                                </h6>
                            </div>
                        </div>
                    </div>
                    <div class="product-container cp-style-2">
                        <div class="product-inner">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="#" title="Kelletria ostma"></a>
                                </h6>
                            </div>
                        </div>
                        <div class="product-inner mt-35">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="#" title="Eletria ostma"></a>
                                </h6>
                            </div>
                        </div>
                    </div>
                    <div class="product-container cp-style-2">
                        <div class="product-inner">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="#" title="Celletria ostma"></a>
                                </h6>
                            </div>
                        </div>
                        <div class="product-inner mt-35">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="#" title="Eletria ostma"></a>
                                </h6>
                            </div>
                        </div>
                    </div>
                    <div class="product-container cp-style-2">
                        <div class="product-inner">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="#" title="Wetria postma"></a>
                                </h6>
                            </div>
                        </div>
                        <div class="product-inner mt-35">
                            <a href="commodityDetails.jsp">
                                <div class="product-img b-img">
                                    <img src="" alt="">
                                </div>
                            </a>
                            <ul class="quick-veiw text-center">
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                <li><a href="#"><i class="fa fa-eye"></i></a></li>
                                <li><a href="#"><i class="fa fa-refresh"></i></a></li>
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                            <div class="product-text">
                                <ul class="pull-left list-inline ratings">
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                    <li><i class="rated fa fa-star"></i></li>
                                </ul>
                                <ul class="pricing list-inline pull-right">
                                    <li class="text-right c-price"></li>
                                </ul>
                                <div class="clear"></div>
                                <h6 class="product-name">
                                    <a href="#" title="Eletria ostma"></a>
                                </h6>
                            </div>
                        </div>
                    </div>
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

<!-- Bootstrap framework js -->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<!-- All js plugins included in this file. -->
<script src="${pageContext.request.contextPath}/static/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="${pageContext.request.contextPath}/static/js/main.js"></script>

<script src="${pageContext.request.contextPath}/static/js/request/search.js"></script>

<script src="${pageContext.request.contextPath}/static/js/loginAndRegister/cookie.js"></script>

<script src="${pageContext.request.contextPath}/static/js/request/toolBar.js"></script>

<script>
    $(function(){
        $("#numAdd").click(function(){
            var span = $(this).prev();
            var num = span.text();
            var n = parseInt(num);
            n++;
            span.text(n);
        });

        $("#numSub").click(function(){
            var span = $(this).next();
            var num = span.text();
            var n = parseInt(num);
            if(n<2){
                n=1;
            }else{
                n--;
            }
            span.text(n);
        });

    });
</script>

</body>

</html>

<script src="${pageContext.request.contextPath}/static/js/request/picture.js"></script>
<script src="${pageContext.request.contextPath}/static/js/request/commodityDetails.js"></script>