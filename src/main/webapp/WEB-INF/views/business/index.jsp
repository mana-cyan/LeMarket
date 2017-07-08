<!doctype html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>店铺管理</title>

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
        <jsp:include page="/shop/navigation"/>
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">店铺信息管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div role="tabpanel" class="tab-pane" id="settings" >
                <!-- 我的资料 -->
                <div>
                    <div style="margin-top:20px;border-bottom:1px solid #ccc;">
                        <table style="" class="shdz">
                            <tr style="width:100%;">
                                <td>店铺名：</td>
                                <td><input id="shopName" type="text" class="form-control" placeholder="店铺名"></td>
                            </tr>
                            <tr style="width:100%;">
                                <td>店铺描述：</td>
                                <td colspan="4"><input id="shopDescription" type="text" class="form-control" placeholder="店铺描述"></td>
                            </tr>
                            <tr style="width:100%;">
                                <td>地址：</td>
                                <td colspan="4"><input id="shopAddress" type="text" class="form-control" placeholder="店铺地址"></td>
                            </tr>
                            <tr style="width:100%;">
                                <td>店主电话号码：</td>
                                <td colspan="2"><input id="ownerPhoneNumber" type="text" class="form-control" placeholder="手机号"></td>
                            </tr>
                            <tr style="width:100%;">
                                <td>店主邮箱：</td>
                                <td colspan="2"><input id="ownerEmail" type="text" class="form-control" placeholder="电子邮箱"></td>
                            </tr>
                        </table>
                    </div>
                    <button type="button" class="btn btn-default" style="width:20%;height:60%;margin:0 auto;margin-top:30px;background-color:#F10180;color:#fff;border-radius:5px;">保存</button>
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
    <!-- Morris Charts JavaScript -->
    <script src="${pageContext.request.contextPath}/static/js/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/morris.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/morris-data.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/static/js/sb-admin-2.min.js"></script>

    <script src="${pageContext.request.contextPath}/static/js/loginAndRegister/cookie.js"></script>

    <script src="${pageContext.request.contextPath}/static/js/request/shop.js"></script>

</body>

</html>
