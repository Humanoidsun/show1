<%--
  Created by IntelliJ IDEA.
  User: Mr.sun
  Date: 2019/6/23
  Time: 19:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../../header/init_bootstrap.jsp"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Letter - Simple Sign Up Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">  <!-- Google web font "Open Sans" -->
    <link rel="stylesheet" href="../../css/login/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/login/bootstrap.min.css">

    <link rel="stylesheet" href="../../css/login/demo.css" />
    <link rel="stylesheet" href="../../css/login/templatemo-style.css">

    <script type="text/javascript" src="../../script/business/attendance/login/modernizr.custom.86080.js"></script>

</head>

<body>

<div id="particles-js"></div>

<ul class="cb-slideshow">
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
    <li></li>
</ul>

<div class="container-fluid">
    <div class="row">
        <div class= "tm-content col-md-4 col-sm-8 col-xs-8 col-md-offset-4" style="padding-top: 180px;padding-bottom: 50px;">
            <center><header class="mb-5"><h1>AI云考勤服务系统</h1></header></center>

            <form action="#" method="get" class="subscribe-form">
                <div class="row form-section1">
                    <label for="loginid" class="col-md-3 col-sm-2 col-xs-2 col-md-offset-1">用户名</label>
                    <div class="col-md-7 col-sm-7 col-xs-7">
                        <input name="loginid" type="text" class="form-control" id="loginid" placeholder="请输入用户名或手机号" required/>
                    </div>
                </div>
                <div class="row form-section">
                    <label for="password" class="col-md-3 col-sm-2 col-xs-2 col-md-offset-1">密&nbsp&nbsp码</label>
                    <div class="col-md-7 col-sm-7 col-xs-7">
                        <input name="password" type="password" class="form-control" id="password" placeholder="请输入密码" required/>
                    </div>
                </div>

                <div class="row form-section">
                    <label for="checkpassword" class="col-md-3 col-sm-2 col-xs-2 col-md-offset-1">确认密码</label>
                    <div class="col-md-7 col-sm-7 col-xs-7">
                        <input name="checkpassword" type="password" class="form-control" id="checkpassword" placeholder="请再次输入密码" required/>
                    </div>
                </div>

                <div class="row form-section">
                    <div class="col-md-4 col-sm-6 col-xs-6 col-md-offset-3">
                        <button type="button" class="tm-btn-subscribe" onclick="back()">登录</button>
                    </div>
                    <div class="col-md-5 col-sm-6 col-xs-6">
                        <button type="button" class="tm-btn-subscribe" onclick="save()">注册</button>
                    </div>
                </div>

            </form>

            <div class="tm-social-icons-container text-xs-center" style="text-align: center;">
                <a href="#" class="tm-social-link"><i class="fa fa-facebook"></i></a>
                <a href="#" class="tm-social-link"><i class="fa fa-google-plus"></i></a>
                <a href="#" class="tm-social-link"><i class="fa fa-twitter"></i></a>
                <a href="#" class="tm-social-link"><i class="fa fa-linkedin"></i></a>
            </div>

        </div>
    </div>
    <div class="footer-link">
        <!-- <p>Copyright © 2018 Your Company

             - Design: <a rel="nofollow" href="#" target="_parent">Templatemo</a></p>
         <p>More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
     --></div>
</div>
</body>

<script type="text/javascript" src="../../script/business/attendance/login/particles.js"></script>
<script type="text/javascript" src="../../script/business/attendance/login/app.js"></script>
<script type="text/javascript" src="../../script/business/attendance/login/user.js"></script>
</html>