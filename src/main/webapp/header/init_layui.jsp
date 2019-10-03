<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>江西联微软件技术有限公司统一开发平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width; initial-scale=1.0">
    <link href="<%= basePath %>/plugins/layui/css/layui.css" rel="stylesheet" />
    <script src="<%= basePath %>/script/common/jquery-1.8.2.min.js"></script>
    <script src="<%= basePath %>/plugins/easyui/jquery.easyui.min.js"></script>
    <script src="<%= basePath %>/plugins/layui/layui.js"></script>
    <script src="<%= basePath %>/script/common/public.js"></script>
    <script src="<%= basePath %>/script/common/kb.js"></script>
    <script src="<%= basePath %>/script/common/clientStorage.js"></script>
    <script src="<%= basePath %>/script/business/myproject.js"></script>
    <style type="text/css">
        .mask {
            position: absolute; top: 0px; filter: alpha(opacity=60); background-color: #777;
            z-index: 1002; left: 0px;
            opacity:0.5; -moz-opacity:0.5;
            width: 100%;
            display:none;
            vertical-align: middle;
            text-align: center;
        }
    </style>
    <script>
        function getUserOrg() {
            return "${user.org}";
        }
    </script>
</head>
<body>
<div id="mask" class="mask">
    <img src="<%=basePath%>/images/loading.gif"/>
</div>
</body>
</html>
