<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js" lang="zxx">

<body>
<div class="header-top gray-bg">
    <div class="container">
        <div class="row">
            <div class="col-sm-5 hidden-xs">
                <div class="header-top-left">
                    <ul class="header-top-style text-capitalize mr-25">
                        <li><a href="index"><span class="mr-10">首页</span></a>
                        </li>
                    </ul>
                    <ul class="header-top-style text-capitalize mr-25">
                        <li><a href="userPage"><span class="mr-10">个人中心</span><i class="fa fa-angle-down"></i></a>
                            <ul class="ul-style currency box-shadow white-bg">
                                <li id="barLogin"><a href="login"><i class="fa fa-usd"></i><span>登录</span></a></li>
                                <li id="barRegister" ><a href="register"><i class="fa fa-euro"></i><span>注册</span></a></li>
                                <li id="barMyRoom"><a href="userPage"><i class="fa fa-gbp"></i><span>我的</span></a></li>
                                <li id="barExit" ><i class="fa fa-euro"></i><span>退出</span></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="header-top-style pl-10">
                        <li id="barMyOrder">
                            <a href="userPage"><span class="mr-10">我的订单</span></a>
                        </li>
                    </ul>
                    <ul class="header-top-style pl-10">
                        <li id="barAdmin">
                            <a href="admin"><span class="mr-10">管理员</span></a>
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
                            <select id="userSearch">
                                <option value=0>搜店铺</option>
                                <option value=1>搜商品</option>
                            </select>
                        </label>
                    </form>
                </div>
                <div class="col-md-7" >
                    <span><input id="searchString" type="text" class="pl-10" placeholder="请输入店铺名、商品" style="border-left:0;color:#fff;"></span>
                </div>
                <div class="col-md-2">
                    <span class="mr-20" ><a id="search_href" ><img alt="" src="${pageContext.request.contextPath}/static/images/header/search-icon.png" style="width:20px;height:20px;margin-top:5px;margin-left:-15px;"></a></span>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>