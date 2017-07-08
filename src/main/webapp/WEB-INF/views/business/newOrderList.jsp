<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            text-align: center;
        }
        .shdz tr{
            border-bottom: 1px solid #ccc;
        }
    </style>

</head>

<body>

<div id="wrapper">

    <jsp:include page="/shop/navigation"/>

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">新订单管理</h3>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->

        <div role="tabpanel" class="tab-pane active" id="dfk">
            <input type="hidden" id="shopId" value=${shopId}>
            <input type="hidden" id="data" value=${data}>
            <table id="table" style="padding:10px;" class="shdz">
            </table>


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

<script src="${pageContext.request.contextPath}/static/js/request/picture.js"></script>

<script src="${pageContext.request.contextPath}/static/js/request/order.js"></script>

<script src="${pageContext.request.contextPath}/static/js/request/newOrder.js"></script>

</body>

</html>
