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
            <div class="header-bottom">
                <div class="container">
                    <div class="row header-middle-content">
                        <div class="col-md-5 col-sm-4 hidden-xs">
                        </div>
                        <div class="col-md-2 col-sm-4 col-xs-12">
                            <div class="header-logo text-center">
                                <a href="../index.jsp"><h4 style="color:#CD6289;">评价</h4></a>
                            </div>
                        </div>
                        <div class="col-md-offset-0 col-md-5 col-sm-offset-0 col-sm-4 col-xs-offset-3 col-xs-6">
                        </div>
                    </div>
                </div>
            </div>       
        </header>

        <div class="container">
            <div class="row bg-pinglun">
                <!-- 列表部分 -->
                <div class="pinglun">
                    <!-- 发表评论与评论显示 -->
                    <div id="content" style="width: 100%; height: auto;">
                        <div class="wrap">
                            <div class="comment">
                                <div class="content1">
                                    <div class="cont-box">
                                        <textarea class="text" placeholder="我来说两句"></textarea>
                                    </div>
                                    <div class="tools-box">
                                        <div class="operator-box-btn">
                                            <span class="face-icon"  >☺</span>
                                            <span class="img-icon">▧</span>
                                            <!-- 评星级 -->
                                            <div class="demo">
                                                <div id="function-demo1" class="target-demo"></div>
                                                <!-- 可以显示有星星的数值，暂时在样式中先隐藏掉了 -->
                                                <div id="function-hint1" class="hint"></div>
                                            </div>
                                        </div>
                                        <div class="submit-btn"><input type="button" onClick="out()"value="发表留言" /></div>
                                    </div>
                                </div>
                            </div>
                            <!-- 评论的内容，初始设置为两条 -->
                            <div id="info-show">
                                <ul>
                                    <li>
                                        <div class="head-face">
                                            <a href=""><img src="${pageContext.request.contextPath}/static/images/huoying.jpg" /></a>
                                        </div>
                                        <div class="reply-cont">
                                            <a href=""><p class="username">王思聪</p></a>
                                            <p class="comment-body">样式很好！</p>
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
                                            <p class="comment-body">好评</p>
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

    <!-- 评价 -->
    <script type="text/javascript">
        // 绑定表情
        $('.face-icon').SinaEmotion($('.text'));
        // 测试本地解析
        function out() {
            var inputText = $('.text').val();
            $('#info-show ul').append(reply(AnalyticEmotion(inputText)));
        }
        
        var html;
        function reply(content){
            html  = '<li>';
            html += '<div class="head-face">';
            html += '<a href=""><img src="/static/images/huoying.jpg" /></a>';
            html += '</div>';
            html += '<div class="reply-cont">';
            html += '<a href=""><p class="username">紫罗兰</p></a>';
            html += '<p class="comment-body">'+content+'</p>';
            html += '<p class="comment-footer">2016年10月5日　回复　点赞0　转发0</p>';
            html += '</div>';
            html += '</li>';
            return html; 
        }
    </script>
    <!-- 评论部分 ///////////////////////////////////////////////////////////////////////////////////////////-->

</body>

</html>
