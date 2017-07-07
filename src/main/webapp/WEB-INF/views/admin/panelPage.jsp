<%--
  Created by IntelliJ IDEA.
  User: gxw
  Date: 2017/7/6
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<!-- 分页 -->
<input id="data" type="hidden" value=${data} />
<nav aria-label="Page navigation" class="text-center">
    <ul class="pagination" style="">
        <li id="previousPage" name=${nowPage} style="width:30px;">
            <a id="previousPageLeap" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;上一页</span>
            </a>
        </li>
        <li class="page" href><a href="#">1</a></li>
        <li class="page"><a href="#">2</a></li>
        <li class="page"><a href="#">3</a></li>
        <li class="page"><a href="#">4</a></li>
        <li class="page"><a href="#">...</a></li>
        <li id="nextPage" name=${totalPage}>
            <a id="nextPageLeap" href="#" aria-label="Next">
                <span aria-hidden="true">下一页&raquo;</span>
            </a>
        </li>
        <span style="margin-top:10px;margin-left:20px;">共<span id="count">100</span>页,</span>
        <span style="margin-top:10px;">跳转到<input id="leapPage" style="width:40px;height:30px;margin:0 5px;" value="1">页<input type="button" value="确定" style="width:40px;height:30px;margin:0 5px;padding:3px;background-color:#eee;"></span>
    </ul>
</nav>
<!-- 分页结束************************************* -->
</body>
</html>
