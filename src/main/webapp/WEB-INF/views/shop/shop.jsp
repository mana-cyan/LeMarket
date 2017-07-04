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

        <div class="container">
            <div class="new-arrival-area" style="margin-top:30px;">
                <div class="container">
                    <div class="row rp-style-2">
                        <div class="col-md-12">
                            <div class="section-title text-center mb-35">
                                <h2 class="text-uppercase"><strong>美特斯邦威</strong></h2>
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
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/9.jpg" alt="">
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
                                            <a href="#" title="Celletria ostma">Celletria ostma</a>
                                        </h6>
                                    </div>
                                </div>
                                <div class="product-inner mt-35">
                                    <a href="#">
                                        <div class="product-img b-img">
                                            <img src="${pageContext.request.contextPath}/static/images/product/arrival/10.jpg" alt="">
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
                                            <a href="#" title="Eletria ostma">Teletria ostma</a>
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

    <script src="${pageContext.request.contextPath}/static/js/request/search.js"></script>

    <script src="${pageContext.request.contextPath}/static/js/loginAndRegister/cookie.js"></script>

    <script src="${pageContext.request.contextPath}/static/js/request/toolBar.js"></script>

</body>

</html>
