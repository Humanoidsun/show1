<%--
  Created by IntelliJ IDEA.
  User: Mr.sun
  Date: 2019/6/24
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
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
<%--左边列表--%>
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
<!-- 正文-->
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
                                <li class="active"><a href="index.jsp"> 主页</a></li>
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
            <!-- /# row -->
            <div class="main-content">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>职业混子</h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>

                                    </ul>
                                </div>
                            </div>
                            <div class="datamap">
                                <div id="world-datamap"></div>
                            </div>
                        </div><!-- /# card -->
                    </div><!-- /# column -->
                </div><!-- /# row -->     </div>
        </div>
        <!-- /# container-fluid -->
    </div>
    <!-- /# main -->
</div>
<!-- /# content wrap -->
<script src="assets/js/lib/jquery.min.js"></script>
<!-- jquery vendor -->
<script src="assets/js/lib/jquery.nanoscroller.min.js"></script>
<!-- nano scroller -->
<script src="assets/js/lib/sidebar.js"></script>
<!-- sidebar -->
<script src="assets/js/lib/bootstrap.min.js"></script>
<!-- bootstrap -->
<script src="assets/js/lib/mmc-common.js"></script>
<script src="assets/js/lib/mmc-chat.js"></script>
<!--  Chart js -->
<script src="assets/js/lib/chart-js/Chart.bundle.js"></script>
<script src="assets/js/lib/chart-js/chartjs-init.js"></script>
<!-- // Chart js -->
<!--  Datamap -->
<script src="assets/js/lib/datamap/d3.min.js"></script>
<script src="assets/js/lib/datamap/topojson.js"></script>
<script src="assets/js/lib/datamap/datamaps.world.min.js"></script>
<script src="assets/js/lib/datamap/datamap-init.js"></script>
<script src="assets/lib/lobipanel/js/lobipanel.js"></script>
<!-- // Datamap -->
<script src="assets/js/scripts.js"></script>
<!-- scripit init-->
<script>
    $(document).ready(function() {
        $('#lobipanel-custom-control').lobiPanel({
            reload: false,
            close: false,
            editTitle: false
        });
    });
</script>
</body>

</html>