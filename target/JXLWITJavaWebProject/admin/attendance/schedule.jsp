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
                                <li class="active"><a href="schedule.jsp"> 排班管理</a></li>
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
                                <h4>排班管理</h4>
                                <div class="booking-system-item">
                                    <form id="schedulefind">
                                        <div class="row">
                                            <div class="col-lg-4 col-lg-offset-1">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="姓名关键字" id="username" name="username">
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control" placeholder="部门关键字" id="departmentname" name="departmentname">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-lg-4 col-lg-offset-1">
                                                <div class="form-group">
                                                    <input type="text" class="form-control calendar" placeholder="开始日期" id="begindate" name="begindate">
                                                    <span class="ti-calendar form-control-feedback booking-system-feedback"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-4">
                                                <div class="form-group">
                                                    <input type="text" class="form-control calendar" placeholder="结束日期" id="enddate" name="enddate">
                                                    <span class="ti-calendar form-control-feedback booking-system-feedback"></span>
                                                </div>
                                            </div>
                                            <div class="col-lg-1">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-primary btn-rounded  m-l-5" onclick="find()">查找</button>
                                                </div>
                                            </div>
                                            <div class="col-lg-2">
                                                <div class="form-group">
                                                    <button type="button" class="btn btn-primary btn-rounded  m-l-5" data-toggle='modal' data-target='#AddDialog'>新增排班</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="order-list-item">
                                    <table class="table table-striped table-responsive">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>姓名</th>
                                            <th>部门名称</th>
                                            <th>日期</th>
                                            <th>类型</th>
                                            <th>备注</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- /# card -->
                    </div>
                    <!-- /# column -->

               </div>
            </div>
            <!-- /# container-fluid -->
        </div>
        <!-- /# main -->
    </div>
</div>
<!-- /# content wrap -->
<div class="modal fade" id="EditDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="height: 700px;width: 550px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改排班信息</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="edit_form">
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" id="edit_id" placeholder="排班ID" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_username" class="col-sm-3 control-label">
                            姓名
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edit_username" placeholder="姓名" name="username" disabled="disabled">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_departmentname" class="col-sm-3 control-label">
                            部门名称
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edit_departmentname" placeholder="部门名称" name="departmentname" disabled="disabled">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_date" class="col-sm-3 control-label">
                            日期
                        </label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control calendar" id="edit_date" placeholder="日期" name="date">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_type" class="col-sm-3 control-label">
                            类型
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="edit_type" placeholder="类型" name="type">
                                <option value="加班">加班</option>
                                <option value="上班">上班</option>
                                <option value="休息">休息</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edit_remark" class="col-sm-3 control-label">
                            备注
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="edit_remark" placeholder="备注" name="remark">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="saveupdate()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="AddDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="height: 700px;width: 550px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel2">增加排班信息</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="add_form">
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" id="add_id" placeholder="排班ID" name="id">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_username" class="col-sm-3 control-label">
                            用户ID
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="add_username" placeholder="用户ID" name="userid">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_date" class="col-sm-3 control-label">
                            日期
                        </label>
                        <div class="col-sm-8">
                            <input type="date" class="form-control calendar" id="add_date" placeholder="日期" name="date">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_type" class="col-sm-3 control-label">
                            类型
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="add_type" placeholder="类型" name="type">
                                <option value="加班">加班</option>
                                <option value="上班">上班</option>
                                <option value="休息">休息</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_remark" class="col-sm-3 control-label">
                            备注
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="add_remark" placeholder="备注" name="remark">
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="add()">确认增加</button>
            </div>
        </div>
    </div>
</div>

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
    window.onload=function () {
        find();
    }
    function find() {
        var obj = new Object();
        doData("/Workschedule/findByCondition",getFormData($("#schedulefind")),function (result) {
            if(result.obj!=null&&result.obj!=undefined){
                var s = "";
                for(var i =0 ;i<result.obj.length;i++){
                    s+="<tr>";
                    s+="<td>"+(i+1)+"</td>";
                    s+="<td>"+result.obj[i].username+"</td>";
                    s+="<td>"+result.obj[i].departmentname+"</td>";
                    s+="<td>"+formatDatebox(result.obj[i].date)+"</td>";
                    s+="<td>"+result.obj[i].type+"</td>";
                    s+="<td>"+result.obj[i].remark+"</td>";
                    s+="<td><button type='button' class='btn btn-success btn-rounded' data-toggle='modal' data-target='#EditDialog' onclick='findById(\""+result.obj[i].id+"\")'>修改</button>";
                    s+="<button type='button' class='btn btn-warning btn-rounded' onclick='del(\""+result.obj[i].id+"\")'>删除</button></td>"
                    s+="</tr>";
                }
                $('.table tbody').html(s);
            }
        },true);
    }
    function findById(id) {
        var obj = new Object();
        obj.id = id;
        doData("/Workschedule/findById",obj,function (result) {
            if(result.code=="0002"){
                $("#edit_id").val(result.obj.id);
                $("#edit_username").val(result.obj.username);
                $("#edit_departmentname").val(result.obj.departmentname);
                $("#edit_date").val(formatDatebox(result.obj.date));
                $("#edit_type").val(result.obj.type);
                $("#edit_remark").val(result.obj.remark);
            }
        },true);
    }
    function del(id) {
        var obj = new Object();
        obj.id=id;
        if(confirm("请确定要删除吗？")){
            doData("/Workschedule/delete",obj,function (result) {
                alert("成功删除"+result.obj+"条数据");
            },true);
        }
    }
    function add() {
        doData("/Workschedule/insert",getFormData($("#add_form")),function (result) {
            alert(result.message);
            window.location.reload();
        },true);
    }
    function saveupdate() {
        doData("/Workschedule/update",getFormData($("#edit_form")),function (result) {
            alert(result.message);
            window.location.reload();
        },true);
    }
</script>
</html>