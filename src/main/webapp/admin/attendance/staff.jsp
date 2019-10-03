<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>AI云考勤服务系统</title>
    <link rel="shortcut icon" href="http://placehold.it/64.png/000/fff">
    <link rel="apple-touch-icon" sizes="144x144" href="http://placehold.it/144.png/000/fff">
    <link rel="apple-touch-icon" sizes="114x114" href="http://placehold.it/114.png/000/fff">
    <link rel="apple-touch-icon" sizes="72x72" href="http://placehold.it/72.png/000/fff">
    <link rel="apple-touch-icon" sizes="57x57" href="http://placehold.it/57.png/000/fff">
    <link href="assets/css/lib/calendar2/pignose.calendar.min.css" rel="stylesheet">
    <link href="assets/fontAwesome/css/fontawesome-all.min.css" rel="stylesheet">
    <link href="assets/css/lib/themify-icons.css" rel="stylesheet">
    <link href="assets/css/lib/mmc-chat.css" rel="stylesheet" />
    <link href="assets/css/lib/sidebar.css" rel="stylesheet">
    <link href="assets/css/lib/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/lib/nixon.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>

<body>
<div class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
    <div class="nano">
        <div class="nano-content">
            <ul>
                <li><a href="profile.jsp"><i class="ti-user"></i> 个人信息</a></li>
                <li><a href="contact.jsp"><i class="ti-layout-grid2-alt"></i> 通讯录</a></li>
                <li><a href="message.jsp"><i class="ti-email"></i> 消息管理</a></li>
                <li>
                    <a class="sidebar-sub-toggle"><i class="ti-layout"></i> 考勤打卡 <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="record-add.jsp">打卡</a></li>
                        <li><a href="record-find.jsp">考勤信息查询</a></li>
                        <li><a href="record-manage.jsp">考勤信息管理</a></li>
                    </ul>
                </li>
                <li>
                    <a class="sidebar-sub-toggle"><i class="ti-bar-chart-alt"></i>  申请/审批  <span class="sidebar-collapse-icon ti-angle-down"></span></a>
                    <ul>
                        <li><a href="application-submit.jsp">提交申请</a></li>
                        <li><a href="application.jsp">审批申请</a></li>
                    </ul>
                </li>
                <li><a href="calendar.jsp"><i class="ti-calendar"></i> 我的日历 </a></li>
                <li><a href="checkinrule.jsp"><i class="ti-panel"></i> 打卡设置 </a></li>
                <li><a href="staff.jsp"><i class="ti-layout-grid4-alt"></i> 员工管理 </a></li>
                <li><a href="department.jsp"><i class="ti-heart"></i> 部门管理 </a></li>
                <li><a href="authority.jsp"><i class="ti-target"></i> 权限管理 </a></li>
                <li><a href="schedule.jsp"><i class="ti-view-list-alt"></i> 排班管理 </a></li>
                <li><a href="company.jsp"><i class="ti-files"></i> 企业信息管理 </a></li>
                <li><a href="settings.jsp"><i class="ti-settings"></i> 系统信息设置 </a></li>
                <li><a onclick="exit()"><i class="ti-close"></i> 退出登录</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- 顶部横幅 -->
<div class="header">
    <div class="pull-left">
        <div class="logo">
            <a href="index.jsp" style="color: white;height: 50px;font-size: 20px;">AI云考勤服务系统</a>
        </div>
        <div class="hamburger sidebar-toggle">
            <span class="ti-menu"></span>
        </div>
    </div>
    <div class="pull-right p-r-15">
        <ul>
            <%--通知--%>
            <li class="header-icon dib"><i class="ti-bell"></i>
                <div class="drop-down">
                    <div class="dropdown-content-heading">
                        <span class="text-left"></span>
                    </div>
                    <div class="dropdown-content-body">
                        <ul>
                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">2019-6-27 08:20</small>
                                        <div class="notification-heading">打卡提醒</div>
                                        <div class="notification-text">08:30 上午上班打卡 </div>
                                    </div>
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/3.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">2019-6-27 17:20</small>
                                        <div class="notification-heading">打卡提醒</div>
                                        <div class="notification-text">17:30 下午下班打卡</div>
                                    </div>
                                </a>
                            </li>
                            <li class="text-center">
                                <a href="#" class="more-link">查看全部</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <%--电子邮件--%>
            <li class="header-icon dib"><i class="ti-email"></i>
                <div class="drop-down">
                    <div class="dropdown-content-heading">
                        <span class="text-left">2 封新邮件</span>
                        <a href="app-email.jsp"><i class="ti-pencil-alt pull-right"></i></a>
                    </div>
                    <div class="dropdown-content-body">
                        <ul>
                            <li class="notification-unread">
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/1.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">2019-06-27 09:25</small>
                                        <div class="notification-heading">孙浩然</div>
                                        <div class="notification-text">你好，我是程序员，请叫我shuai哥...</div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <img class="pull-left m-r-10 avatar-img" src="assets/images/avatar/2.jpg" alt="" />
                                    <div class="notification-content">
                                        <small class="notification-timestamp pull-right">2019-06-27 09:23</small>
                                        <div class="notification-heading">刘轩宇</div>
                                        <div class="notification-text">你好，我是程序员，上面那位是shuai哥...</div>
                                    </div>
                                </a>
                            </li>
                            <li class="text-center">
                                <a href="#" class="more-link">查看全部</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </li>
            <%--联系人--%>
            <li class="header-icon dib chat-sidebar-icon"><i class="ti-comments"></i></li>
            <%--个人信息--%>
            <li class="header-icon dib"><img class="avatar-img" src="assets/images/avatar/1.jpg" alt="" /> <span class="user-avatar"><span id="right-top-username">${sessionScope.username}</span> <i class="ti-angle-down f-s-10"></i></span>
                <div class="drop-down dropdown-profile">
                    <div class="dropdown-content-body">
                        <ul>
                            <li><a href="profile.jsp"><i class="ti-user"></i> <span>个人信息</span></a></li>
                            <li><a href="calendar.jsp"><i class="ti-calendar"></i> <span>我的日历</span></a></li>
                            <li><a href="#"><i class="ti-settings"></i> <span>系统设置</span></a></li>
                            <li><a onclick="exit()"><i class="ti-power-off"></i> <span>退出登录</span></a></li>
                            <li><a href="#"><i class="ti-help-alt"></i> <span>帮助</span></a></li>
                            <li><a href="#"><i class="ti-lock"></i> <span>锁屏</span></a></li>
                        </ul>
                    </div>
                </div>
            </li>
        </ul>
    </div>

</div>
<%--对话框--%>
<div class="chat-sidebar">
    <!-- BEGIN chat -->
    <div id="mmc-chat" class="color-default">
        <!-- ？？？？ -->
        <div class="chat-box">
            <!-- BEGIN CHAT BOXS -->
            <ul class="boxs"></ul>
            <!-- END CHAT BOXS -->
            <div class="icons-set">
                <div class="stickers">
                    <div class="had-container">
                        <div class="row">
                            <div class="s12">
                                <ul class="tabs" style="width: 100%;height: 60px;">
                                    <li class="tab col s3">
                                        <a href="#tab1" class="active">
                                            <img src="assets/images/1.png" alt="" />
                                        </a>
                                    </li>
                                    <li class="tab col s3"><a href="#tab2">Test 2</a></li>
                                </ul>
                            </div>
                            <div id="tab1" class="s12 tab-content">
                                <ul>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                    <li><img src="assets/images/1.png" alt="" /></li>
                                </ul>
                            </div>
                            <div id="tab2" class="s12 tab-content">Test 2</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END CHAT BOX -->
        <!-- 联系人列表-->
        <div id="sidebar" class="right scroll">
            <div class="had-container">
                <!-- BEGIN USERS -->
                <div class="users">
                    <ul class="user-list">
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="1" data-status="online" data-username="Rufat Askerov" data-position="left" data-filter-item data-filter-name="rufat askerov">
                            <!-- BEGIN USER IMAGE-->
                            <div class="user-image">
                                <img src="assets/images/avatar/1.jpg" class="avatar" alt="Rufat Askerov" />
                            </div>
                            <!-- END USER IMAGE-->
                            <!-- BEGIN USERNAME-->
                            <span class="user-name">孙浩然</span>
                            <span class="user-show"></span>
                            <!-- END USERNAME-->
                        </li>
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="5" data-status="online" data-username="Irina Shayk" data-position="left" data-filter-item data-filter-name="irina shayk">
                            <div class="user-image">
                                <img src="assets/images/avatar/1.jpg" class="avatar" alt="Irina Shayk" />
                            </div>
                            <span class="user-name">吴润涛</span>
                            <span class="user-show"></span>
                        </li>
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="6" data-status="online" data-username="Sara Tancredi" data-position="left" data-filter-item data-filter-name="sara tancredi">
                            <div class="user-image">
                                <img src="assets/images/avatar/1.jpg" class="avatar" alt="Sara Tancredi" />
                            </div>
                            <span class="user-name">刘轩宇</span>
                            <span class="user-show"></span>
                        </li>
                        <!-- BEGIN USER-->
                        <li class="user-tooltip" data-id="7" data-status="online" data-username="Jane" data-position="left" data-filter-item data-filter-name="Jane">
                            <div class="user-image">
                                <img src="assets/images/avatar/1.jpg" class="avatar" alt="Jane" />
                            </div>
                            <span class="user-name">龙子鸣</span>
                            <span class="user-show"></span>
                        </li>
                    </ul>
                    <div class="chat-user-search">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="ti-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search" data-search />
                        </div>
                    </div>
                </div>
                <!-- END USERS -->
            </div>
        </div>
        <!-- END SIDEBAR -->
    </div>
    <!-- END chat -->
</div>
<!-- END chat Sidebar-->



<div class="content-wrap">
    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <!-- /# column -->
                <div class="col-lg-4 p-0">
                    <div class="page-header">
                        <div class="page-title">
                            <ol class="breadcrumb text-left">
                                <li><a>当前目录</a></li>
                                <li class="active"><a href="staff.jsp"> 员工管理</a></li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 p-0">
                    <div class="page-header">
                        <div class="page-title"></div>
                    </div>
                </div>
                <!-- /# column -->
            </div>

            <div class="main-content">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>员工信息管理 </h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="row">
                                <form class="form-inline" role="form" id="recordfind">
                                    <div class="row">
                                        <div class="form-group col-sm-offset-2">
                                            <%--<label for="txt"></label>--%>
                                            <div class="input-group input-group-default">
                                                <input type="text" id="txt"  name="endtime" class="form-control" placeholder="请输入员工姓名">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-info btn-outline" type="button" onclick="show()"><i class="ti-search"></i></button>
                                                </span>
                                            </div>
                                                <div class="input-group input-group-default">
                                                    <button  data-toggle="modal" data-target="#addDialog" class="btn btn-info btn-outline btn-rounded m-l-5" type="button">新增</button>
                                                </div>
                                        </div>
                                    <%--</div>--%>
                                </form>
                            </div>
                            <div id="card-body">
                            <table class="table table-responsive table-striped">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>姓名</th>
                                    <th>性别</th>
                                    <%--<th>密码</th>--%>
                                    <th>手机号码</th>
                                    <th>出生日期</th>
                                    <th>住址</th>
                                    <th>邮箱</th>
                                    <th>所属部门</th>
                                    <%--<th>登录名</th>--%>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="iuser">
                                </tbody>
                            </table>
                        </div>
<div class="modal fade" id="crmstaffEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改员工信息</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="edit_crmstaff_form">
                    <div class="form-group">
                        <label for="edit_id" class="col-sm-1 control-label">
                            员工ID
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_id" placeholder="员工ID" name="id" disabled>
                        </div>
                        <label for="edit_name" class="col-sm-2 control-label">
                            员工名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_name" placeholder="员工名称" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_sex" class="col-sm-1 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_sex" placeholder="性别" name="sex">
                        </div>
                        <label for="edit_depid" class="col-sm-2 control-label">
                            所属部门
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_depid" placeholder="所属部门" name="depid">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_phone" class="col-sm-1 control-label">
                            手机号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_phone" placeholder="手机号码" name="phone">
                        </div>
                        <label for="edit_birthday" class="col-sm-2 control-label">
                            生日
                        </label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="edit_birthday" placeholder="生日" name="birthday">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_address" class="col-sm-1 control-label">
                            住址
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_address" placeholder="住址" name="address">
                        </div>
                        <label for="edit_email" class="col-sm-2 control-label">
                            电子邮箱
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_email" placeholder="电子邮箱" name="email">
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="edit_loginid" class="col-sm-1 control-label">
                            登录名
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_loginid" placeholder="登录名" name="loginid">
                        </div>
                        <label for="edit_password" class="col-sm-2 control-label">
                            密码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_password" placeholder="密码" name="password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_face" class="col-sm-1 control-label">
                            人脸识别
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_face" placeholder="人脸识别" name="face">
                        </div>
                        <label for="edit_fingerprint" class="col-sm-2 control-label">
                            指纹识别
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="edit_fingerprint" placeholder="指纹识别" name="fingerprint">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="updatecrmstaff()">保存修改</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="addDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe2">新增员工信息</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="add_from">
                    <div class="form-group">
                        <label for="add_id" class="col-sm-1 control-label">
                            员工ID
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_id" placeholder="员工ID" name="id">
                        </div>
                        <label for="add_name" class="col-sm-2 control-label">
                            员工名称
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_name" placeholder="员工名称" name="name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_sex" class="col-sm-1 control-label">
                            性别
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_sex" placeholder="性别" name="sex">
                        </div>
                        <label for="add_password" class="col-sm-2 control-label">
                            密码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_password" placeholder="密码" name="password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_phone" class="col-sm-1 control-label">
                            手机号码
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_phone" placeholder="手机号码" name="phone">
                        </div>
                        <label for="add_birthday" class="col-sm-2 control-label">
                            生日
                        </label>
                        <div class="col-sm-4">
                            <input type="date" class="form-control" id="add_birthday" placeholder="生日" name="birthday">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_address" class="col-sm-1 control-label">
                            住址
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_address" placeholder="住址" name="address">
                        </div>
                        <label for="add_email" class="col-sm-2 control-label">
                            电子邮箱
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_email" placeholder="电子邮箱" name="email">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_depid" class="col-sm-1 control-label">
                            所属部门
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_depid" placeholder="所属部门" name="depid">
                        </div>
                        <label for="add_face" class="col-sm-2 control-label">
                            人脸识别
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_face" placeholder="人脸识别" name="face">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_fingerprint" class="col-sm-1 control-label">
                            指纹识别
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_fingerprint" placeholder="指纹识别" name="fingerprint">
                        </div>
                        <label for="add_loginid" class="col-sm-2 control-label">
                            登录名
                        </label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="add_loginid" placeholder="登录名" name="loginid">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="save()">添加</button>
            </div>
        </div>
    </div>
</div>
                        </div><!-- /# card -->
                    </div><!-- /# column -->
                </div><!-- /# row -->     </div>
        </div><!-- /# container-fluid -->
    </div><!-- /# main -->
</div><!-- /# content wrap -->


<script src="assets/js/lib/jquery.min.js"></script>
<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
<script src="assets/js/lib/sidebar.js"></script>
<script src="assets/js/lib/bootstrap.min.js"></script>
<script src="assets/js/lib/mmc-common.js"></script>
<script src="assets/js/lib/mmc-chat.js"></script>
<script src="assets/js/lib/calendar-2/moment.latest.min.js"></script>
<script src="assets/js/lib/calendar-2/semantic.ui.min.js"></script>
<script src="assets/js/lib/calendar-2/prism.min.js"></script>
<script src="assets/js/lib/calendar-2/pignose.calendar.min.js"></script>
<script src="assets/js/lib/calendar-2/pignose.init.js"></script>
<script src="../../script/common/public.js"></script>
<script src="assets/js/scripts.js"></script>
</body>
<script type="text/javascript">
    function show(){
        var con=new Object();
        con.name=$("#txt").val();
        $.ajax({
            type: 'post',
            url: "/UserManager/findForRow",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(con),
            success:function(result) {
                if (result.obj != undefined && result.obj != null){
                    var s="";
                    for (var i = 0; i < result.obj.length; i++) {
                        s += "<tr><td>";
                        s += + (i + 1) + "</td><td>"
                            + result.obj[i].name + "</td><td>"
                            + result.obj[i].sex+ "</td><td>"
                            // + result.obj[i].password +"</td><td>"
                            + result.obj[i].phone + "</td><td>"
                            + formatDatebox(result.obj[i].birthday)  +"</td><td>"
                            + result.obj[i].address + "</td><td>"
                            + result.obj[i].email+"</td><td>"
                            + result.obj[i].depid + "</td><td>"
                            // + result.obj[i].face +"</td><td>"
                            // + result.obj[i].fingerprint + "</td><td>"
                            // + result.obj[i].loginid + "</td><td>"
                            + "<button type='button' class='btn btn-danger btn-outline btn-rounded m-b-10 m-l-5' onclick='javascript:deletecrmstaff(\""+ result.obj[i].id +"\")'>删除</button>"
                            + "<button type='button' class='btn btn-info btn-outline btn-rounded m-b-10 m-l-5' data-toggle='modal' data-target='#crmstaffEditDialog' onclick='javascript:editcrmstaff(\"" + result.obj[i].id + "\")'>修改</button></td>"
                        s += "</tr>"
                    }
                    $("#iuser").html(s);
                }
            }
        });
    }
    window.onload=function () {
        show();
    }

    function save(){
        var obj = new Object();
        obj = getFormData($("#add_from"));
        $.ajax({
            type: 'post',
            url: "/UserManager/insert",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success: function (result) {
                alert(result.message);
                window.location.reload();
            },
            error: function () {
                alert("提交失败，请重试");
            }
        });
    }
    function deletecrmstaff(id) {
        if(confirm('确实要删除该员工吗?')) {
            $.post("/UserManager/deletebyid",{"id":id},
                function(data){
                    if(data=='"OK"'){
                        alert("员工删除成功！");
                        window.location.reload();
                    }else{
                        alert("删除员工失败！");
                        window.location.reload();
                    }
                });
        }
    }
    function editcrmstaff(id) {
        var obj=new Object();
        obj.id = id;
        $.ajax({
            type: 'post',
            url: "/UserManager/sssid",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success: function(data) {
                $("#edit_id").val(data.obj.id);
                $("#edit_name").val(data.obj.name);
                $("#edit_sex").val(data.obj.sex);
                $("#edit_phone").val(data.obj.phone);
                $("#edit_birthday").val(formatDatebox(data.obj.birthday));
                $("#edit_email").val(data.obj.email);
                $("#edit_password").val(data.obj.password);
                $("#edit_address").val(data.obj.address);
                $("#edit_depid").val(data.obj.depid);
                $("#edit_face").val(data.obj.face);
                $("#edit_fingerprint").val(data.obj.fingerprint);
                $("#edit_loginid").val(data.obj.loginid);
            }
        });
    }
    function updatecrmstaff() {
        doData("/UserManager/updatebyid",getFormData($("#edit_crmstaff_form")), function(data){
                    alert(data.message);
                    window.location.reload();
        },true);
    }

</script>
</html>