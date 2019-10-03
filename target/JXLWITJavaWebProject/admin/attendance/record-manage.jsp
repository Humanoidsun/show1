<%--
  Created by IntelliJ IDEA.
  User: ZERO
  Date: 2019/6/28
  Time: 9:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="../../script/common/macarons.js"></script>
    <script src="../../plugins/echarts/echarts.min.js"></script>
    <script src="../../plugins/echarts/echarts-gl.min.js"></script>
    <script src="../../plugins/echarts/ecStat.min.js"></script>
    <script src="../../plugins/echarts/dataTool.min.js"></script>
    <script src="../../plugins/echarts/china.js"></script>
    <script src="../../plugins/echarts/world.js"></script>
    <script src="../../plugins/echarts/api?v=2.0&ak=xfhhaTThl11qYVrqLZii6w8qE5ggnhrY&__ec_v__=20190126"></script>
    <script src="../../plugins/echarts/bmap.min.js"></script>
    <script src="../../plugins/echarts/simplex.js"></script>

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
                                <li class="active"><a href="record-manage.jsp"> 考勤信息管理/统计</a></li>
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
                    <div class="col-lg-12">
                        <div class="card alert">
                            <div class="card-header">
                                <h4>考勤信息管理/统计</h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                        <li class="card-option drop-menu"><i class="ti-settings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true" role="link"></i>
                                            <ul class="card-option-dropdown dropdown-menu">
                                                <li><a href="#"><i class="ti-loop"></i> Update data</a></li>
                                                <li><a href="#"><i class="ti-menu-alt"></i> Detail log</a></li>
                                                <li><a href="#"><i class="ti-pulse"></i> Statistics</a></li>
                                                <li><a href="#"><i class="ti-power-off"></i> Clear list</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label for="selecttype" class="col-sm-1 col-sm-offset-1 control-label">选择类别</label>
                                        <div class="col-sm-3">
                                            <select id="selecttype" class="form-control">
                                                <option value="1">员工</option>
                                                <option value="2">部门</option>
                                            </select>
                                        </div>
                                        <label for="Information" class="col-sm-1 control-label">输入名称</label>
                                        <div class="col-sm-3">
                                            <input type="text" class="form-control" id="Information" placeholder="请输入员工姓名或部门名称">
                                        </div>
                                        <div class="col-sm-2">
                                            <button type="button" class="btn btn-warning btn-rounded btn-block" data-toggle="modal" data-target="#newInfoDialog" onclick="clearInfo()">新建</button>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="begintime" class="col-sm-1 col-sm-offset-1 control-label">开始时间</label>
                                        <div class="col-sm-3" >
                                            <input type="datetime-local" id="begintime" name="begintime" class="form-control" step="1">
                                        </div>
                                        <label for="endtime" class="col-sm-1 control-label">结束时间</label>
                                        <div class="col-sm-3">
                                            <input type="datetime-local" id="endtime"  name="endtime" class="form-control" step="1">
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-pink btn-rounded" onclick="show(1)">列表显示</button>
                                        </div>
                                        <div class="col-sm-1">
                                            <button type="button" class="btn btn-pink btn-rounded" onclick="show(2)">图表显示</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-body">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel-default">
                                    <div id="showbody" style="height: 100%">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 创建模态框 -->
<div class="modal fade" id="newInfoDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="height: 600px;width: 700px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">新建考勤信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="new_info_form">
                    <div class="form-group">
                        <label for="new_infotype" class="col-sm-3 control-label">打卡类型</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="new_infotype" placeholder="打卡类型" name="type">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_infodatetime" class="col-sm-3 control-label">打卡产生时间</label>
                        <div class="col-sm-8">
                            <input type="datetime-local" step="1" class="form-control" id="new_infodatetime" placeholder="打卡产生时间" name="datetime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_infouserid" class="col-sm-3 control-label">用户ID</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="new_infouserid" placeholder="用户ID" name="userid">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_infostatus" class="col-sm-3 control-label">状态</label>
                        <div class="col-sm-8">
                            <select id="new_infostatus" class="form-control" name="status">
                                <option value="正常">正常</option>
                                <option value="迟到">迟到</option>
                                <option value="补卡">补卡</option>
                                <option value="缺勤">缺勤</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new_inforemark" class="col-sm-3 control-label">备注</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="new_inforemark" placeholder="备注" name="remark">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="createinfo()">创建考勤信息</button>
            </div>
        </div>
    </div>
</div>


<!-- 修改模态框 -->
<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="height: 600px;width: 700px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">修改考勤信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_info_form">
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" id="edit_infoid" placeholder="打卡记录编号" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_infotype" class="col-sm-3 control-label">打卡类型</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edit_infotype" placeholder="打卡类型" name="type">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_infodatetime" class="col-sm-3 control-label">打卡产生时间</label>
                        <div class="col-sm-8">
                            <input type="datetime-local" step="1" class="form-control" id="edit_infodatetime" placeholder="打卡产生时间" name="datetime">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_infousername" class="col-sm-3 control-label">用户姓名</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edit_infousername" placeholder="用户姓名" name="username" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_infodepartmentname" class="col-sm-3 control-label">部门名称</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edit_infodepartmentname" placeholder="部门名称" name="departmentname" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_infostatus" class="col-sm-3 control-label">状态</label>
                        <div class="col-sm-8">
                            <select id="edit_infostatus" class="form-control" name="status">
                                <option value="正常">正常</option>
                                <option value="迟到">迟到</option>
                                <option value="补卡">补卡</option>
                                <option value="缺勤">缺勤</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_inforemark" class="col-sm-3 control-label">备注</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edit_inforemark" placeholder="备注" name="remark">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="updateinfo()">保存修改</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function show(id){
        var option=$("#selecttype").val();
        var op=id;
        if(option==1){
            if(op==1){
                showUserInForm();
            }
            else{
                showUserInChart();
            }
        }
        else{
            if(op==1){
                showDepartmentInForm();
            }
            else{
                showDepartmentInChart();
            }
        }
    }

    function showUserInForm(){
        $("#showbody").removeAttr("_echarts_instance_").empty();
        var obj = new Object();
        obj.findname=$("#Information").val();
        obj.begintime=$("#begintime").val();
        obj.endtime=$("#endtime").val();
        $.ajax({
            type: 'post',
            url: "/Info/findUserForForm",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success:function(result){
                if(result.code!="0"){
                    var s="<div class=\'panel-heading\' >员工考勤信息列表</div><table class='table table-striped table-responsive table-bordered'><thead><tr><th>序号</th> <th>打卡类型</th> <th>打卡产生时间</th> <th>用户姓名</th> <th>部门名称</th> <th>状态</th> <th>备注</th> <th>操作</th> </tr></thead><tbody>";
                    for (var i = 0; i < result.obj.length; i++) {
                        s += "<tr><td>";
                        s += + (i + 1) +
                            "</td>" +
                            "<td>" + result.obj[i].type +"</td>" +
                            "<td>" + formatDateTimebox(result.obj[i].datetime) +"</td>" +
                            "<td>" + result.obj[i].username  +"</td>" +
                            "<td>" + result.obj[i].departmentname+"</td>" +
                            "<td>" + result.obj[i].status + "</td>" +
                            "<td>" + result.obj[i].remark +"</td>" +
                            "<td>" + "<button type='button' class='btn btn-danger btn-rounded' onclick='deleteinfo(\""+ result.obj[i].id +"\")'>删除</button>"
                            + "<button type='button' class='btn btn-info btn-rounded' data-toggle='modal' data-target='#userEditDialog' onclick='editinfo(\"" + result.obj[i].id + "\")'>修改</button></td>"
                        s += "</tr>"
                    }
                    $("#showbody").html(s);
                }
                else{
                    alert(result.message);
                }
            }
        });
    }

    function showUserInChart(){
        var obj = new Object();
        obj.findname=$("#Information").val();
        obj.begintime=$("#begintime").val();
        obj.endtime=$("#endtime").val();
        $.ajax({
            type : 'post',
            url : "/Info/getUserData",
            contentType: "application/json; charset=utf-8",
            cache : false,
            dataType:'json',
            data : JSON.stringify(obj),
            success : function(data) {
                if (data != null) {
                    createUserEcharts(data);
                } else {
                    art.dialog.alert("操作失败");
                }
            }
        });
    }

    function createUserEcharts(data){
        var res = [];
        var na = [];
        var sum=0;
        for (var i = 0; i < data.obj.length; i++){
            sum+=data.obj[i].number;
        }
        for (var i = 0; i < data.obj.length; i++) {
            res.push({
                name: data.obj[i].status,
                value: data.obj[i].number,
                rate: data.obj[i].number*100/sum
            });
            na.push({
                name: data.obj[i].status
            });
        }

        var myChart = echarts.init(document.getElementById("showbody"));
        myChart.clear();
        option = null;

        option = {
            title: {
                text: '考勤情况统计',
                subtext: '员工数据',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                // orient: 'vertical',
                // top: 'middle',
                bottom: 10,
                left: 'center',
                data: na
                // data: ['正常', '迟到', '补卡', '缺勤']
            },
            series: [{
                type: 'pie',
                radius: '65%',
                center: ['50%', '50%'],
                selectedMode: 'single',
                data: [
                    {
                        value: res[0].value,
                        name:  res[0].name,
                        label: {
                            normal: {
                                formatter: [
                                    '{title|{b}}{abg|}',
                                    '{recordHead|状态}{valueHead|次数}{rateHead|占比}',
                                    '{hr|}',
                                    '  {record|'+res[0].name+'}{value|'+res[0].value+'}{rate|'+res[0].rate.toFixed(2)+'%}',
                                    '  {record|'+res[1].name+'}{value|'+res[1].value+'}{rate|'+res[1].rate.toFixed(2)+'%}',
                                    '  {record|'+res[2].name+'}{value|'+res[2].value+'}{rate|'+res[2].rate.toFixed(2)+'%}',
                                    '  {record|'+res[3].name+'}{value|'+res[3].value+'}{rate|'+res[3].rate.toFixed(2)+'%}'
                                ].join('\n'),
                                backgroundColor: '#eee',
                                borderColor: '#777',
                                borderWidth: 1,
                                borderRadius: 4,
                                rich: {
                                    title: {
                                        color: '#eee',
                                        align: 'center'
                                    },
                                    abg: {
                                        backgroundColor: '#333',
                                        width: '100%',
                                        align: 'right',
                                        height: 25,
                                        borderRadius: [4, 4, 0, 0]
                                    },
                                    正常: {
                                        height: 30,
                                        align: 'left',
                                    },
                                    迟到: {
                                        height: 30,
                                        align: 'left',
                                    },
                                    补卡: {
                                        height: 30,
                                        align: 'left',
                                    },
                                    缺勤: {
                                        height: 30,
                                        align: 'left',
                                    },
                                    weatherHead: {
                                        color: '#333',
                                        height: 24,
                                        align: 'left'
                                    },
                                    hr: {
                                        borderColor: '#777',
                                        width: '100%',
                                        borderWidth: 0.5,
                                        height: 0
                                    },
                                    value: {
                                        width: 20,
                                        padding: [0, 20, 0, 30],
                                        align: 'left'
                                    },
                                    valueHead: {
                                        color: '#333',
                                        width: 20,
                                        padding: [0, 20, 0, 30],
                                        align: 'center'
                                    },
                                    rate: {
                                        width: 40,
                                        align: 'right',
                                        padding: [0, 10, 0, 0]
                                    },
                                    rateHead: {
                                        color: '#333',
                                        width: 40,
                                        align: 'center',
                                        padding: [0, 10, 0, 0]
                                    }
                                }
                            }
                        }
                    },
                    {value: res[1].value, name: res[1].name},
                    {value: res[2].value, name: res[2].name},
                    {value: res[3].value, name: res[3].name}
                ],

                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    }

    function showDepartmentInForm(){
        $("#showbody").removeAttr("_echarts_instance_").empty();
        var obj = new Object();
        obj.findname=$("#Information").val();
        obj.begintime=$("#begintime").val();
        obj.endtime=$("#endtime").val();
        $.ajax({
            type: 'post',
            url: "/Info/findDepartmentForForm",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success:function(result){
                if(result.code!="0"){
                    var s="<div class=\'panel-heading\' >员工考勤信息列表</div><table class='table table-striped table-responsive'><thead><tr><th>序号</th> <th>打卡类型</th> <th>打卡产生时间</th> <th>用户姓名</th> <th>部门名称</th> <th>状态</th> <th>备注</th> <th>操作</th> </tr></thead><tbody>";
                    for (var i = 0; i < result.obj.length; i++) {
                        s += "<tr><td>";
                        s += + (i + 1) +
                            "</td>" +
                            "<td>" + result.obj[i].type +"</td>" +
                            "<td>" + formatDateTimebox(result.obj[i].datetime) +"</td>" +
                            "<td>" + result.obj[i].username  +"</td>" +
                            "<td>" + result.obj[i].departmentname+"</td>" +
                            "<td>" + result.obj[i].status + "</td>" +
                            "<td>" + result.obj[i].remark +"</td>" +
                            "<td>" + "<button type='button' class='btn btn-danger btn-rounded' onclick='deleteinfo(\""+ result.obj[i].id +"\")'>删除</button>"
                            + "<button type='button' class='btn btn-info btn-rounded' data-toggle='modal' data-target='#userEditDialog' onclick='editinfo(\"" + result.obj[i].id + "\")'>修改</button></td>"
                        s += "</tr>"
                    }
                    $("#showbody").html(s);
                }
                else{
                    alert(result.message);
                }
            }
        });
    }

    function createinfo(){
        var obj = getFormData($("#new_info_form"));
        $.ajax({
            type: 'post',
            url: "/Info/insertInfo",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success: function (result) {
                alert(result.message);
                window.location.reload();
            }
        });
    }

    //获取修改的权限信息
    function editinfo(id){
        var obj = new Object();
        obj.id=id;
        $.ajax({
            type:'post',
            url:"/Info/findUserById",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success:function(result) {
                if (result.code != "0") {
                    $("#edit_infoid").val(result.obj[0].id);
                    $("#edit_infotype").val(result.obj[0].type);
                    $("#edit_infodatetime").val(formatDateTimebox(result.obj[0].datetime));
                    $("#edit_infousername").val(result.obj[0].username);
                    $("#edit_infodepartmentname").val(result.obj[0].departmentname);
                    $("#edit_infostatus").val(result.obj[0].status);
                    $("#edit_inforemark").val(result.obj[0].remark);
                }
                else {
                    alert(result.message);
                }
            }
        });
    }

    //执行修改企业信息操作
    function updateinfo() {
        var obj = new Object();
        obj=getFormData($("#edit_info_form"));
        $.ajax({
            type: 'post',
            url: "/Info/updateInfo",
            dataType: 'json',
            contentType: "application/json;charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success: function (result) {
                alert(result.message);
                var x = $("#selecttype").val();
                if(x==1)
                    showUserInForm();
                else
                    showDepartmentInForm();
            }
        });
    }

    function deleteinfo(id) {
        if(confirm('确实要删除该考勤信息吗?')) {
            var obj = new Object();
            obj.id=id;
            $.ajax({
                type: 'post',
                url: "/Info/deleteInfo",
                dataType: 'json',
                contentType: "application/json;charset=utf-8",
                cache: true,
                data: JSON.stringify(obj),
                success: function (result) {
                    alert(result.message);
                    var x = $("#selecttype").val();
                    if(x==1)
                        showUserInForm();
                    else
                        showDepartmentInForm();
                }
            });
        }
    }

    function showDepartmentInChart() {
        var obj = new Object();
        obj.findname=$("#Information").val();
        obj.begintime=$("#begintime").val();
        obj.endtime=$("#endtime").val();
        $.ajax({
            type : 'post',
            url : "/Info/getDepartmentData",
            contentType: "application/json; charset=utf-8",
            cache : false,
            dataType:'json',
            data : JSON.stringify(obj),
            success : function(data) {
                if (data != null) {
                    createDepartmentEcharts(data);
                } else {
                    art.dialog.alert("操作失败");
                }
            }
        });
    }

    //第二步将数据在函数中转拼成需要的json格式
    function createDepartmentEcharts(data) {
        var res = [];
        var na = [];
        var sum=0;
        for (var i = 0; i < data.obj.length; i++){
            sum+=data.obj[i].number;
        }
        for (var i = 0; i < data.obj.length; i++) {
            res.push({
                name: data.obj[i].status,
                value: data.obj[i].number,
                rate: data.obj[i].number*100/sum
            });
            na.push({
                name: data.obj[i].status
            });
        }
        var myChart = echarts.init(document.getElementById("showbody"));
        myChart.clear();
        option = null;

        option = {
            title: {
                text: '考勤情况统计',
                subtext: '部门数据',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                // orient: 'vertical',
                // top: 'middle',
                bottom: 10,
                left: 'center',
                data: na
                // data: ['正常', '迟到', '补卡', '缺勤']
            },
            series: [{
                type: 'pie',
                radius: '65%',
                center: ['50%', '50%'],
                selectedMode: 'single',
                data: [
                    {
                        value: res[0].value,
                        name:  res[0].name,
                        label: {
                            normal: {
                                formatter: [
                                    '{title|{b}}{abg|}',
                                    '{recordHead|状态}{valueHead|次数}{rateHead|占比}',
                                    '{hr|}',
                                    '  {record|'+res[0].name+'}{value|'+res[0].value+'}{rate|'+res[0].rate.toFixed(2)+'%}',
                                    '  {record|'+res[1].name+'}{value|'+res[1].value+'}{rate|'+res[1].rate.toFixed(2)+'%}',
                                    '  {record|'+res[2].name+'}{value|'+res[2].value+'}{rate|'+res[2].rate.toFixed(2)+'%}',
                                    '  {record|'+res[3].name+'}{value|'+res[3].value+'}{rate|'+res[3].rate.toFixed(2)+'%}'
                                ].join('\n'),
                                backgroundColor: '#eee',
                                borderColor: '#777',
                                borderWidth: 1,
                                borderRadius: 4,
                                rich: {
                                    title: {
                                        color: '#eee',
                                        align: 'center'
                                    },
                                    abg: {
                                        backgroundColor: '#333',
                                        width: '100%',
                                        align: 'right',
                                        height: 25,
                                        borderRadius: [4, 4, 0, 0]
                                    },
                                    正常: {
                                        height: 30,
                                        align: 'left',
                                    },
                                    迟到: {
                                        height: 30,
                                        align: 'left',
                                    },
                                    补卡: {
                                        height: 30,
                                        align: 'left',
                                    },
                                    缺勤: {
                                        height: 30,
                                        align: 'left',
                                    },
                                    weatherHead: {
                                        color: '#333',
                                        height: 24,
                                        align: 'left'
                                    },
                                    hr: {
                                        borderColor: '#777',
                                        width: '100%',
                                        borderWidth: 0.5,
                                        height: 0
                                    },
                                    value: {
                                        width: 20,
                                        padding: [0, 20, 0, 30],
                                        align: 'left'
                                    },
                                    valueHead: {
                                        color: '#333',
                                        width: 20,
                                        padding: [0, 20, 0, 30],
                                        align: 'center'
                                    },
                                    rate: {
                                        width: 40,
                                        align: 'right',
                                        padding: [0, 10, 0, 0]
                                    },
                                    rateHead: {
                                        color: '#333',
                                        width: 40,
                                        align: 'center',
                                        padding: [0, 10, 0, 0]
                                    }
                                }
                            }
                        }
                    },
                    {value: res[1].value, name: res[1].name},
                    {value: res[2].value, name: res[2].name},
                    {value: res[3].value, name: res[3].name}
                ],

                itemStyle: {
                    emphasis: {
                        shadowBlur: 10,
                        shadowOffsetX: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            }]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    }

</script>


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

</html>