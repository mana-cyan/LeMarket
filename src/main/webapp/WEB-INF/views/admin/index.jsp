﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                        <li><a href="../../userPage/index.html"><i class="fa fa-sign-out fa-fw"></i> 退出账户</a>
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
                            <a href="/admin"><i class="fa fa-wrench fa-fw"></i>用户管理</a>
                        </li>
                        <li>
                            <a href="/admin/report"><i class="fa fa-bar-chart-o fa-fw"></i>举报管理</a>
                        </li>
                        <li>
                            <a href="/admin/goods"><i class="fa fa-dashboard fa-fw"></i>商品管理</a>
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
                            用户管理
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                <thead>
                                <tr>
                                    <th>id</th>
                                    <th>用户名</th>
                                    <th>操作</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>4</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>5</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>6</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>7</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>8</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>9</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>10</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>11</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>12</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>13</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>14</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>15</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>16</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>17</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>18</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                <tr>
                                    <td>19</td>
                                    <td>颜池</td>
                                    <td colspan=""><button>重置密码</button></td>

                                </tr>
                                </tbody>
                            </table>

                        </div>
                        <!-- /.panel-body -->
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
