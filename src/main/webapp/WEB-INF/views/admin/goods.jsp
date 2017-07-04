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

    <!-- Morris Charts CSS -->
    <link href="${pageContext.request.contextPath}/static/css/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


    <style>
        .shdz td{
            width:200px;
            padding:10px;
        }
    </style>

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
            <a class="navbar-brand" href="index.jsp">超级管理员</a>
        </div>
        <!-- /.navbar-header -->

        <ul class="nav navbar-top-links navbar-right">

            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="login.jsp"><i class="fa fa-user fa-fw"></i> 登录</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 设置</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="../index.jsp"><i class="fa fa-sign-out fa-fw"></i> 退出账户</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
        <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="搜索商品、用户">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                        </div>
                        <!-- /input-group -->
                    </li>
                    <li>
                        <a href="index.jsp"><i class="fa fa-wrench fa-fw"></i>用户管理</a>
                    </li>
                    <li>
                        <a href="report.jsp"><i class="fa fa-bar-chart-o fa-fw"></i>举报管理</a>
                    </li>
                    <li>
                        <a href="goods.jsp"><i class="fa fa-dashboard fa-fw"></i>商品管理</a>
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>


    <div id="page-wrapper">
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        商品管理
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>商品名</th>
                                <th>操作</th>

                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>颜池</td>
                                <td><button>删除</button></td>
                            </tr>

                            </tbody>
                        </table>

                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
    </div>

</div>
<!-- /#wrapper -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="${pageContext.request.contextPath}/static/js/metisMenu.min.js"></script>

<!-- Morris Charts JavaScript -->
<script src="${pageContext.request.contextPath}/static/js/raphael.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/morris-data.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${pageContext.request.contextPath}/static/js/sb-admin-2.min.js"></script>

</body>

</html>
