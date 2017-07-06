<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>个人中心</title>
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
            width:200px;
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
            <div class="row rp-style-2" style="margin-top:30px;">
                <div class="col-md-12">
                    <div class="section-title text-center mb-35">
                        <h2 class="text-uppercase"><strong>个人中心</strong></h2>
                        <img alt="" src="${pageContext.request.contextPath}/static/images/section-border.png">
                    </div>
                </div>
            </div>
        </header>

        <div class="container">
            <!-- Nav tabs -->
            <ul id="nav-list" class="nav nav-tabs" role="tablist" style="border-bottom:1px solid #ccc;">
                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">订单管理</a></li>
                <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">收货地址</a></li>
                <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">我的资料</a></li>
                <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">我要开店</a></li>
                <li role="presentation"><a href="#shoucang" aria-controls="shoucang" role="tab" data-toggle="tab">我的收藏</a></li>
                
            </ul>
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home" style="margin-top:20px;">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#dfk" aria-controls="dfk" role="tab" data-toggle="tab">待付款</a></li>
                        <li role="presentation"><a href="#dsh" aria-controls="dsh" role="tab" data-toggle="tab">待收货</a></li>
                        <li role="presentation"><a href="#dpj" aria-controls="dpj" role="tab" data-toggle="tab">待评价</a></li>
                        <li role="presentation"><a href="#qbdd" aria-controls="qbdd" role="tab" data-toggle="tab">全部订单</a></li>
                    </ul>

                  <!-- Tab panes -->
                    <div class="tab-content" style="margin-top:20px;padding:20px;">
                        <!-- 待付款 -->
                         <div role="tabpanel" class="tab-pane active" id="dfk"></div>

                         <!-- 待收货 -->
                         <div role="tabpanel" class="tab-pane" id="dsh">
                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default">确认收货</button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default">确认收货</button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default">确认收货</button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>

                         </div>

                         <!-- 待评价 -->
                         <div role="tabpanel" class="tab-pane" id="dpj">
                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default"><a href="commentPage">去评价</a></button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default"><a href="commentPage">去评价</a></button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default"><a href="commentPage">去评价</a></button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>

                         </div>


                         <!-- 全部订单 -->
                         <div role="tabpanel" class="tab-pane" id="qbdd">
                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default">交易成功</button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default">交易成功</button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>

                            <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                <div class="col-md-3" >
                                    <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                </div>
                                <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                    <span>女装连衣裙净黑色</span>
                                </div>
                                <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                    <h4>￥49</h4>
                                </div>
                                <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                    <div class="btn-group" role="group" aria-label="...">
                                         <button type="button" class="btn btn-default">交易成功</button>
                                         <button type="button" class="btn btn-default">删除订单</button>
                                    </div>
                                </div>
                            </div>


                         </div>
                    </div>
                </div>
                <div role="tabpanel" class="tab-pane" id="profile" style="margin-top:20px;padding:20px;">
                    <div style="border-bottom:1px solid #ccc;padding:10px;">
                        <h5 style="border-bottom:1px solid #ccc;padding:10px;"><strong>已保存的收货地址</strong></h5>
                        <div style="margin-top:20px;">
                            <table border="1" class="shdz">
                                <tr style="width:100%;">
                                    <td>1</td>
                                    <td>颜池</td>
                                    <td>湖北省 武汉市 洪山区 珞南街道 152华中师范大学</td>
                                    <td>13437256907</td>
                                    <td><button type="button" class="btn btn-default">修改</button></td>
                                </tr>
                                <tr style="width:100%;">
                                    <td>2</td>
                                    <td>颜池</td>
                                    <td>湖北省 武汉市 洪山区 珞南街道 152华中师范大学</td>
                                    <td>13437256907</td>
                                    <td><button type="button" class="btn btn-default">修改</button></td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div style="margin-top:30px;">
                        <h5 style="border-bottom:1px solid #ccc;padding:10px;"><strong>新增收货地址</strong></h5>
                        <div style="margin-top:20px;border-bottom:1px solid #ccc;padding-bottom:20px;">
                            <table style="" class="shdz">
                                <tr style="width:100%;">
                                    <td>姓名：</td>
                                    <td><input type="text" class="form-control" placeholder="收货人姓名"></td>
                                    
                                </tr>
                                <tr style="width:100%;">
                                    <td>地址：</td>
                                    <td colspan="2" ><input type="text" class="form-control" placeholder="详细地址" ></td>
                                </tr>
                                <tr style="width:100%;">
                                    <td>电话号码：</td>
                                    <td colspan="2"><input type="text" class="form-control" placeholder="手机号"></td>      
                                </tr>
                            </table> 
                        </div>
                        <button type="button" class="btn btn-default" style="width:20%;height:60%;margin:0 auto;margin-top:30px;background-color:#F10180;color:#fff;border-radius:5px;">保存收货地址</button>
                    </div>

                </div>
                <div role="tabpanel" class="tab-pane" id="settings" style="margin-top:20px;padding:20px;">
                    <!-- 我的资料 -->
                    <div style="margin-top:30px;">
                        <h5 style="border-bottom:1px solid #ccc;padding:10px;"><strong>基本资料</strong></h5>
                        <div style="margin-top:20px; padding-bottom:20px; border-bottom:1px solid #ccc;">
                            <table style="" class="shdz">
                                <tr style="width:100%;">
                                    <td>姓名：</td>
                                    <td><input id="name" type="text" class="form-control" placeholder="姓名"></td>
                                </tr>
                                <tr style="width:100%;">
                                    <td>姓别：</td>
                                    <td><input id="gender" type="text" class="form-control" placeholder="性别"></td>
                                </tr>
                                <tr style="width:100%;">
                                    <td>生日：</td>
                                    <td><input id="year" type="text" class="form-control" placeholder="年"></td>
                                    <td><input id="month" type="text" class="form-control" placeholder="月"></td>
                                    <td><input id="day" type="text" class="form-control" placeholder="日"></td>
                                </tr>
                                <tr style="width:100%;">
                                    <td>地址：</td>
                                    <td colspan="3"><input id="address" type="text" class="form-control" placeholder="详细地址"></td>
                                </tr>
                                <tr style="width:100%;">
                                    <td>身份证号：</td>
                                    <td colspan="2"><input id="identityNumber" type="text" class="form-control" placeholder="身份证号"></td>
                                </tr>
                                <tr style="width:100%;">
                                    <td>电话号码：</td>
                                    <td colspan="2"><input id="phoneNumber" type="text" class="form-control" placeholder="手机号"></td>
                                </tr>
                            </table> 
                        </div>
                        <button type="button" class="btn btn-default" style="width:20%;height:60%;margin:0 auto;margin-top:30px;background-color:#F10180;color:#fff;border-radius:5px;" onclick="setUserInfo()">保存</button>
                    </div>


                </div>

                <!--我要开店的登录注册-->
                <div role="tabpanel" class="tab-pane" id="messages" style="margin-top:20px;padding:20px;">
                    <div style="margin-top:20px;">
                        <a href="addShop"><button style="color:#fff;background-color:#F10180;font-size:20px;padding:10px;border-radius:5px;">进入我的店铺</button></a>
                        <a href="addShop"><button style="color:#fff;background-color:#F10180;font-size:20px;padding:10px;margin-left:10px;border-radius:5px;">注册新店铺</button></a>
                    </div>

                </div><!--我要开店的登录注册结束-->

                <div role="tabpanel" class="tab-pane" id="shoucang" style="margin-top:20px;padding:20px;">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#scsp" aria-controls="scsp" role="tab" data-toggle="tab">收藏商品</a></li>
                        <li role="presentation"><a href="#scdp" aria-controls="scdp" role="tab" data-toggle="tab">收藏店铺</a></li>
                        </ul>
                          <!-- Tab panes -->
                        <div class="tab-content">
                            <!-- 收藏商品 -->
                            <div role="tabpanel" class="tab-pane active" id="scsp">
                                <div class="row" style="border-top:1px solid #ccc;padding:10px;margin-top:25px;">
                                    <div class="col-md-3" >
                                        <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                    </div>
                                    <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                        <span>女装连衣裙净黑色</span>
                                    </div>
                                    <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                        <h4>￥49</h4>
                                    </div>
                                    <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                        <div class="btn-group" role="group" aria-label="...">
                                             <button type="button" class="btn btn-default"><a href="pay.jsp">去付款</a></button>
                                             <button type="button" class="btn btn-default">删除订单</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                    <div class="col-md-3" >
                                        <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                    </div>
                                    <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                        <span>女装连衣裙净黑色</span>
                                    </div>
                                    <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                        <h4>￥49</h4>
                                    </div>
                                    <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                        <div class="btn-group" role="group" aria-label="...">
                                             <button type="button" class="btn btn-default"><a href="pay.jsp">去付款</a></button>
                                             <button type="button" class="btn btn-default">删除订单</button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                    <div class="col-md-3" >
                                        <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                    </div>
                                    <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                        <span>女装连衣裙净黑色</span>
                                    </div>
                                    <div class="col-md-1" style="margin-top:25px;padding:20px;">
                                        <h4>￥49</h4>
                                    </div>
                                    <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                        <div class="btn-group" role="group" aria-label="...">
                                             <button type="button" class="btn btn-default"><a href="pay.jsp">去付款</a></button>
                                             <button type="button" class="btn btn-default">删除订单</button>
                                        </div>
                                    </div>
                                </div> 
                            </div>

                            <!-- 收藏店铺 -->
                            <div role="tabpanel" class="tab-pane" id="scdp">
                                <div class="row" style="border-top:1px solid #ccc;padding:10px;margin-top:30px;">
                                    <div class="col-md-3" >
                                        <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                    </div>
                                    <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                        <span>美特斯邦威</span>
                                    </div>
                                    <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                        <div class="btn-group" role="group" aria-label="...">
                                             <button type="button" class="btn btn-default"><a href="../shop/shop.jsp">去看看</a></button>
                                             <button type="button" class="btn btn-default">删除订单</button>
                                        </div>
                                    </div>
                                </div> 
                                <div class="row" style="border-top:1px solid #ccc;padding:10px;">
                                    <div class="col-md-3" >
                                        <a href="commodityDetails"><img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" style="width:30%;height:40%;"></a>
                                    </div>
                                    <div class="col-md-5" style="margin-top:20px;padding:20px;">
                                        <span>美特斯邦威</span>
                                    </div>
                                    <div class="col-md-3" style="margin-top:20px;padding:20px;">
                                        <div class="btn-group" role="group" aria-label="...">
                                             <button type="button" class="btn btn-default"><a href="../shop/shop.jsp">去看看</a></button>
                                             <button type="button" class="btn btn-default">删除订单</button>
                                        </div>
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

    <script src="${pageContext.request.contextPath}/static/js/request/userPage.js"></script>

</body>

</html>
