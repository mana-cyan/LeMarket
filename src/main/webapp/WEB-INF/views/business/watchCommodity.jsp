<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>leMarket</title>

    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/static/css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/static/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index">首页</a>
            </div>

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="搜索商品、订单">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i>店铺管理</a>
                        </li>
                        <li>
                            <a ><i class="fa fa-bar-chart-o fa-fw"></i> 订单管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="newOrderList.jsp">新订单</a>
                                </li>
                                <li>
                                    <a href="historyOrderList.jsp">已发货</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-wrench fa-fw"></i> 商品管理<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="watchCommodity.jsp">查看商品</a>
                                </li>
                                <li>
                                    <a href="publishCommodity.jsp">发布商品</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row" style="padding-top:10px;">
                <div class="col-sm-4 col-md-3">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/product/arrival/1.jpg" alt="...">
                        <div class="caption" style="text-align: center">
                            <h5>女装连衣裙净黑色</h5>
                            <p>S M L 黑 白 灰</p>
                            <p >
                                <a href="publishCommodity.jsp" class="btn" role="button" style="background-color:#F10180;color:#fff;">修改</a>
                                <a href="comments.jsp" class="btn btn-default" role="button">评论</a>
                                <a href="#" class="btn btn-default" role="button">下架</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/product/arrival/2.jpg" alt="...">
                        <div class="caption" style="text-align: center">
                            <h4>女装连衣裙净黑色</h4>
                            <p>S M L 黑 白 灰</p>
                            <p >
                                <a href="publishCommodity.jsp" class="btn" role="button" style="background-color:#F10180;color:#fff;">修改</a>
                                <a href="comments.jsp" class="btn btn-default" role="button">评论</a>
                                <a href="#" class="btn btn-default" role="button">下架</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/product/arrival/3.jpg" alt="...">
                        <div class="caption" style="text-align: center">
                            <h4>女装连衣裙净黑色</h4>
                            <p>S M L 黑 白 灰</p>
                            <p >
                                <a href="publishCommodity.jsp" class="btn" role="button" style="background-color:#F10180;color:#fff;">修改</a>
                                <a href="comments.jsp" class="btn btn-default" role="button">评论</a>
                                <a href="#" class="btn btn-default" role="button">下架</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/product/arrival/4.jpg" alt="...">
                        <div class="caption" style="text-align: center">
                            <h4>女装连衣裙净黑色</h4>
                            <p>S M L 黑 白 灰</p>
                            <p >
                                <a href="publishCommodity.jsp" class="btn" role="button" style="background-color:#F10180;color:#fff;">修改</a>
                                <a href="comments.jsp" class="btn btn-default" role="button">评论</a>
                                <a href="#" class="btn btn-default" role="button">下架</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/product/arrival/5.jpg" alt="...">
                        <div class="caption" style="text-align: center">
                            <h4>女装连衣裙净黑色</h4>
                            <p>S M L 黑 白 灰</p>
                            <p >
                                <a href="publishCommodity.jsp" class="btn" role="button" style="background-color:#F10180;color:#fff;">修改</a>
                                <a href="comments.jsp" class="btn btn-default" role="button">评论</a>
                                <a href="#" class="btn btn-default" role="button">下架</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/product/arrival/6.jpg" alt="...">
                        <div class="caption" style="text-align: center">
                            <h4>女装连衣裙净黑色</h4>
                            <p>S M L 黑 白 灰</p>
                            <p >
                                <a href="publishCommodity.jsp" class="btn" role="button" style="background-color:#F10180;color:#fff;">修改</a>
                                <a href="comments.jsp" class="btn btn-default" role="button">评论</a>
                                <a href="#" class="btn btn-default" role="button">下架</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/product/arrival/7.jpg" alt="...">
                        <div class="caption" style="text-align: center">
                            <h4>女装连衣裙净黑色</h4>
                            <p>S M L 黑 白 灰</p>
                            <p >
                                <a href="publishCommodity.jsp" class="btn" role="button" style="background-color:#F10180;color:#fff;">修改</a>
                                <a href="comments.jsp" class="btn btn-default" role="button">评论</a>
                                <a href="#" class="btn btn-default" role="button">下架</a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 col-md-3">
                    <div class="thumbnail">
                        <img src="${pageContext.request.contextPath}/static/images/product/arrival/8.jpg" alt="...">
                        <div class="caption" style="text-align: center">
                            <h4>女装连衣裙净黑色</h4>
                            <p>S M L 黑 白 灰</p>
                            <p >
                                <a href="publishCommodity.jsp" class="btn" role="button" style="background-color:#F10180;color:#fff;">修改</a>
                                <a href="comments.jsp" class="btn btn-default" role="button">评论</a>
                                <a href="#" class="btn btn-default" role="button">下架</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/static/js/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/static/js/sb-admin-2.js"></script>

</body>

</html>
