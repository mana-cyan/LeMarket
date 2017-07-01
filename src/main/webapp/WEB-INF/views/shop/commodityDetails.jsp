<!doctype html>
<%@ page pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Home</title>
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
                                    <li><a href="../user/userPage.jsp"><span class="mr-10">个人中心</span><i class="fa fa-angle-down"></i></a>
                                        <ul class="ul-style currency box-shadow white-bg">
                                            <li><a href="login.html"><i class="fa fa-usd"></i><span>登录</span></a></li>
                                            <li><a href="../user/register.jsp"><i class="fa fa-euro"></i><span>注册</span></a></li>
                                            <li><a href="../user/userPage.jsp"><i class="fa fa-gbp"></i><span>我的</span></a></li>
                                        </ul>
                                    </li>
                                </ul> 
                                <ul class="header-top-style pl-10">
                                    <li>
                                        <a href="../user/userPage.jsp"><span class="mr-10">我的订单</span></a>
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
        </header>

        <div class="container" style="margin-top:30px;">
            <div class="row">
                <div class="col-md-6">
                    <img src="${pageContext.request.contextPath}/static/images/product/arrival/3.jpg" style="width:80%;height:80%;">
                </div>
                <div class="col-md-6" style="margin-top:10px;">
                    <p>糖果</p>
                    <h4><strong>时尚潮流无袖连衣裙</strong></h4>
                    <div class="price" style="background-color:#FAF5F8;padding-left:10px;padding-bottom:10px;">
                        <span style="color:#F10180;font-size:20px;">￥</span><span style="color:#F10180;font-size:60px;">391</span>
                        <h5>原价：￥599</h5>
                    </div>
                    <div style="border-top:1px solid #FAF5F8;border-bottom:1px solid #FAF5F8;margin-top:20px;padding-top:5px;">
                        <div style="margin-top:5px;"><span>商品描述：</span><span>身：100%聚酯纤维；后担干：100%锦纶；里布：100%聚酯纤维</span></div>
                        <!--<div style="margin-top:5px;"><span>洗涤规则：</span><span>手洗，不可漂白，悬挂晾干，低温熨烫，常规干洗</span></div>-->
                        <div style="margin-top:5px;"><span>店铺：</span><span><a href="shop.jsp">良品铺子 (点击进入店铺)</a></span></div>
                    </div>
                    <div style="margin-top:20px;">
                        <span >运费：</span><span style="color:#fff;background-color:#F3B241;">免运费</span><span >（订单满288免运费）</span>
                    </div>
                    <div style="margin-top:20px;">
                        <div class="row">
                            <div class="col-md-2">
                                <span>尺码</span>
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-default" data-toggle="tooltip">S</button>
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-default" data-toggle="tooltip" >M</button>
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-default" data-toggle="tooltip" >L</button>
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-default" data-toggle="tooltip" >XL</button>
                            </div>
                        </div>
                    </div>
                    <div style="margin-top:20px;">
                        <span >数量：</span>
                        <span style="">
                            <button id="numSub" style="width:5%;padding:5px;background-color: #fff;border:1px solid #ccc;">-</button>
                            <span id="" style="width:30px;padding:10px;">1</span>
                            <button id="numAdd" style="width:5%;padding:5px;background-color: #fff;border:1px solid #ccc;">+</button>
                        </span>

                    </div>
                    <div style="margin-top:20px;">
                        <button style="color:#fff;background-color:#F10180;font-size:25px;padding:10px;border-radius:5px;"><a href="../user/pay.jsp">立即购买</a></button>
                        <button style="color:#fff;background-color:#F10180;font-size:25px;padding:10px;margin-left:10px;border-radius:5px;" class="buyBtn">加入购物车</button>
                        <img src="../images/product/arrival/3.jpg"  class="buyGoodsOri" style="margin-left:-100px;z-index:-1;position:absolute;width:30px;height:50px;">
                    </div>
                </div>
            </div>   
        </div>

        <!-- 评论部分 -->
        <div class="container" style="margin-top:20px;width:80%;">
            <div class="row bg-pinglun">
                <!-- 列表部分 -->
                <div class="pinglun">
                    <p style="background-color:#FAF5F8;height:40px;padding:10px;">用户评论<span style="float:right;"><a href="#">更多</a></span></p>
                    <!-- 发表评论与评论显示 -->
                    <div id="content" style="width: 100%; height: auto;">
                        <div class="wrap">
                            
                            <!-- 评论的内容，初始设置为两条 -->
                            <div id="info-show">
                                <ul>
                                    <li>
                                        <div class="head-face">
                                            <a href=""><img src="${pageContext.request.contextPath}/static/images/huoying.jpg" /></a>
                                        </div>
                                        <div class="reply-cont">
                                            <a href=""><p class="username">王思聪</p></a>
                                            <p class="comment-body">样式非常好！</p>
                                            <p class="comment-footer">2016年8月5日</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="head-face">
                                            <a href=""><img src="${pageContext.request.contextPath}/static/images/huoying.jpg" /></a>
                                        </div>
                                        <div class="reply-cont">
                                            <a href=""><p class="username">马云</p></a>
                                            <p class="comment-body">板凳</p>
                                            <p class="comment-footer">2016年8月6日</p>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="head-face">
                                            <a href=""><img src="${pageContext.request.contextPath}/static/images/huoying.jpg" /></a>
                                        </div>
                                        <div class="reply-cont">
                                            <a href=""><p class="username">李建林</p></a>
                                            <p class="comment-body">很好</p>
                                            <p class="comment-footer">2016年8月6日</p>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
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
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" alt="">
                                        </div>
                                    </a>
                                    <span class="product-tag text-uppercase orang-bg">-20%</span>
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
                                            <li class="text-right c-price">$170</li>
                                            <li class="text-right p-price">$190</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="commodityDetails.jsp" title="Eletria ostma">Teletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="product-inner mt-35">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/2.jpg" alt="">
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
                                            <li class="text-right c-price">$160</li>
                                            <li class="text-right p-price">$180</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="commodityDetails.jsp" title="Eletria ostma">Eletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div class="product-container cp-style-2">
                                <div class="product-inner">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/3.jpg" alt="">
                                        </div>
                                    </a>
                                    <span class="product-tag text-uppercase black-bg">new</span>
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
                                            <li class="text-right c-price">$170</li>
                                            <li class="text-right p-price">$190</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Wetria postma">Wetria postma</a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="product-inner mt-35">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/4.jpg" alt="">
                                        </div>
                                    </a>
                                    <span class="product-tag text-uppercase orang-bg">-20%</span>
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
                                            <li class="text-right c-price">$160</li>
                                            <li class="text-right p-price">$180</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Eletria ostma">Eletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div class="product-container cp-style-2">
                                <div class="product-inner">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/5.jpg" alt="">
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
                                            <li class="text-right c-price">$170</li>
                                            <li class="text-right p-price">$190</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Kelletria ostma">Kelletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="product-inner mt-35">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/6.jpg" alt="">
                                        </div>
                                    </a>
                                    <span class="product-tag text-uppercase black-bg">new</span>
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
                                            <li class="text-right c-price">$160</li>
                                            <li class="text-right p-price">$180</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Eletria ostma">Eletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div class="product-container cp-style-2">
                                <div class="product-inner">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/7.jpg" alt="">
                                        </div>
                                    </a>
                                    <span class="product-tag text-uppercase orang-bg">-20%</span>
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
                                            <li class="text-right c-price">$170</li>
                                            <li class="text-right p-price">$190</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Celletria ostma">Celletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="product-inner mt-35">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/8.jpg" alt="">
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
                                            <li class="text-right c-price">$160</li>
                                            <li class="text-right p-price">$180</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Eletria ostma">Eletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                           
                           
                            <div class="product-container cp-style-2">
                                <div class="product-inner">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/3.jpg" alt="">
                                        </div>
                                    </a>
                                    <span class="product-tag text-uppercase black-bg">new</span>
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
                                            <li class="text-right c-price">$170</li>
                                            <li class="text-right p-price">$190</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Wetria postma">Wetria postma</a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="product-inner mt-35">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/4.jpg" alt="">
                                        </div>
                                    </a>
                                    <span class="product-tag text-uppercase orang-bg">-20%</span>
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
                                            <li class="text-right c-price">$160</li>
                                            <li class="text-right p-price">$180</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Eletria ostma">Eletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                            <div class="product-container cp-style-2">
                                <div class="product-inner">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/5.jpg" alt="">
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
                                            <li class="text-right c-price">$170</li>
                                            <li class="text-right p-price">$190</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Kelletria ostma">Kelletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="product-inner mt-35">
                                    <a href="commodityDetails.jsp">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/6.jpg" alt="">
                                        </div>
                                    </a>
                                    <span class="product-tag text-uppercase black-bg">new</span>
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
                                            <li class="text-right c-price">$160</li>
                                            <li class="text-right p-price">$180</li>
                                        </ul>
                                        <div class="clear"></div>
                                        <h6 class="product-name">
                                            <a href="#" title="Eletria ostma">Eletria ostma</a>
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
