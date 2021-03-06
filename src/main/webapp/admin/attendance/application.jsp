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
                                <li class="active"><a href="application.jsp"> 申请单管理</a></li>
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
                                <h4>申请单管理 </h4>
                                <div class="card-header-right-icon">
                                    <ul>
                                        <li class="card-close" data-dismiss="alert"><i class="ti-close"></i></li>
                                    </ul>
                                </div>
                                <form id="application-find">
                                    <div class="row">
                                        <div class="col-lg-3 col-lg-offset-2">
                                            <div class="form-group">
                                                <input type="text" class="form-control" placeholder="申请人姓名" id="submitname" name="submitname">
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <input type="text" class="form-control calendar" placeholder="提交日期" id="submittime" name="submittime">
                                                <span class="ti-calendar form-control-feedback booking-system-feedback"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                                <button type="button" class="btn btn-info btn-flat btn-addon m-b-10  m-l-5" onclick="show()"><i class="ti-plus"></i>查找</button>
                                                <button type="button" class="btn btn-pink btn-flat btn-addon m-b-10  m-l-5" data-toggle="modal" data-target="#addDialog" ><i class="ti-search"></i>新增</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div id="card-body">
                                <table class="table table-responsive table-striped">
                                    <thead>
                                    <tr>
                                        <th>序号</th>
                                        <th>申请人姓名</th>
                                        <th>申请类型</th>
                                        <th>状态</th>
                                        <th>内容</th>
                                        <th>图片附件</th>
                                        <th>提交时间</th>
                                        <th>审批时间</th>
                                        <th>审批人姓名</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div><!-- /# card -->
                    </div><!-- /# column -->
                </div><!-- /# row -->     </div>
        </div><!-- /# container-fluid -->
    </div><!-- /# main -->
</div><!-- /# content wrap -->
<div class="modal fade" id="editDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="height: 550px;width: 650px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改申请信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="edit_form">
                    <div class="form-group">
                        <div class="col-sm-8">
                            <input type="hidden" class="form-control" id="show_id" placeholder="ID" name="id">
                        </div>
                    </div>
                    <%--申请人姓名--%>
                    <div class="form-group">
                        <label for="show_submitname" class="col-sm-3 control-label">
                            申请人姓名
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="show_submitname" placeholder="申请人姓名" name="submitname" disabled="disabled">
                        </div>
                    </div>
                    <%--申请类型名称--%>
                    <div class="form-group">
                        <label for="show_typename" class="col-sm-3 control-label">
                            申请类型
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="show_typename" placeholder="申请类型" name="typename" disabled="disabled">
                        </div>
                    </div>
                    <%--状态--%>
                    <div class="form-group">
                        <label for="show_status" class="col-sm-3 control-label">
                            状态
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" id="show_status" name="status">
                                <option value="已同意">已同意</option>
                                <option value="已拒绝">已拒绝</option>
                                <option value="已提交">已提交</option>
                            </select>
                        </div>
                    </div>
                    <%--内容--%>
                    <div class="form-group">
                        <label for="show_text" class="col-sm-3 control-label">
                            内容
                        </label>
                        <div class="col-sm-8">
                            <textarea class="form-control" rows="3" placeholder="请填写申请事项的详细说明，例如开始时间、结束时间。" id="show_text" name="text" disabled="disabled"></textarea>

                            <%--<input type="text" class="form-control" id="show_text" placeholder="内容" name="text" disabled="disabled">--%>
                        </div>
                    </div>
                    <%--图片附件--%>
                    <div class="form-group">
                        <label for="show_picture" class="col-sm-3 control-label">
                            图片附件
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="show_picture" placeholder="图片附件" name="picture" disabled="disabled">
                        </div>
                    </div>
                    <%--提交时间--%>
                    <div class="form-group">
                        <label for="show_submittime" class="col-sm-3 control-label">
                            提交时间
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="show_submittime" placeholder="提交时间" name="submittime" disabled="disabled">
                        </div>
                    </div>
                    <%--审批时间--%>
                    <div class="form-group">
                        <label for="show_approvaltime" class="col-sm-3 control-label">
                            审批时间
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="show_approvaltime" placeholder="审批时间" name="approvaltime" disabled="disabled">
                        </div>
                    </div>
                    <%--审批人姓名--%>
                    <div class="form-group">
                        <label for="show_approvalname" class="col-sm-3 control-label">
                            审批人姓名
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="show_approvalname" placeholder="审批人姓名" name="approvalname" disabled="disabled">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="editapp()">保存修改</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="height: 550px;width: 650px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
                <h4 class="modal-title" id="myModalLabe2">填写申请单</h4>
            </div>

            <div class="modal-body">
                <form class="form-horizontal" id="add_from">
                    <div class="form-group">
                        <label for="add_type" class="col-sm-3 control-label">
                            申请单类型
                        </label>
                        <div class="col-sm-8">
                            <select class="form-control" placeholder="请选择申请类型" id="add_type" name="type">
                                <option value="1">请假</option>
                                <option value="2">补卡</option>
                                <option value="3">加班</option>
                                <option value="4">用车</option>
                                <option value="5">其他</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_text" class="col-sm-3 control-label">
                            申请单内容
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="add_text" placeholder="申请单内容" name="text">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_picture" class="col-sm-3 control-label">
                            图片附件
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="add_picture" placeholder="图片附件" name="picture">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_status" class="col-sm-3 control-label">
                            状态
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="add_status" placeholder="状态" name="status">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_submittime" class="col-sm-3 control-label">
                            申请时间
                        </label>
                        <div class="col-sm-8">
                            <input step="1" type="datetime-local" class="form-control" id="add_submittime" placeholder="申请时间" name="submittime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_approvaltime" class="col-sm-3 control-label">
                            审批时间
                        </label>
                        <div class="col-sm-8">
                            <input step="1" type="datetime-local" class="form-control" id="add_approvaltime" placeholder="审批时间" name="approvaltime">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_approvalid" class="col-sm-3 control-label">
                            审批人id
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="add_approvalid" placeholder="审批人id" name="approvalid">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="add_submitid" class="col-sm-3 control-label">
                            申请人id
                        </label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" id="add_submitid" placeholder="申请人id" name="submitid">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" onclick="save()">提交</button>
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
    function show(){
        var obj = getFormData($("#application-find"));
        $.ajax({
            type: 'post',
            url: "/Application/findapp",
            dataType: 'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success:function(result) {
                if (result.obj != undefined && result.obj != null && result.obj.length > 0){
                    var s="";
                    for (var i = 0; i < result.obj.length; i++) {
                        s += "<tr><td>";
                        s += + (i + 1) + "</td><td>"
                            + result.obj[i].submitname + "</td><td>"
                            + result.obj[i].typename+ "</td><td>"
                            + result.obj[i].status +"</td><td>"
                            + result.obj[i].text + "</td><td>"
                            + result.obj[i].picture +"</td><td>"
                            + formatDateTimebox(result.obj[i].submittime)  +"</td><td>"
                            + formatDateTimebox(result.obj[i].approvaltime) + "</td><td>"
                            + result.obj[i].approvalname+"</td><td>"
                            + "<button type='button' class='btn btn-danger btn-rounded m-b-10 m-l-5' onclick='deleteapp(\""+ result.obj[i].id +"\")'>删除</button>"
                            + "<button type='button' class='btn btn-warning btn-rounded m-b-10 m-l-5' data-toggle='modal' data-target='#editDialog' onclick='findById(\"" + result.obj[i].id + "\")'>修改</button></td>"
                        s += "</tr>"

                    }
                    $(".table tbody").html(s);
                }
            }
        });
    }
    window.onload=function () {
    }

    function save(){
        var obj = new Object();
        obj.id = $("#add_id").val();
        obj.type = $("#add_type").val();
        obj.text = $("#add_text").val();
        obj.picture=$("#add_picture").val();
        obj.status=$("#add_status").val();
        obj.submittime=$("#add_submittime").val();
        obj.approvaltime=$("#add_approvaltime").val();
        obj.approvalid=$("#add_approvalid").val();
        obj.submitid=$("#add_submitid").val();
        $.ajax({
            type: 'post',
            url: "/Application/insert",
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
    function deleteapp(id) {
        if(confirm('确实要删除该申请单吗?')) {
            var obj = new Object();
            obj.id=id;
            doData("/Application/delete",obj, function(result) {
                if(result.code!==0){
                    alert("申请单删除成功!")
                }else{
                    alert("申请单删除失败!")
                }
            });
        }
    }
    function editapp() {
        var obj = new Object();
        obj=getFormData($("#edit_form"));
        $.ajax({
            type: 'post',
            url: "/Application/editapp",
            dataType: 'json',
            contentType: "application/json;charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success: function (result) {
                alert(result.message);
            }
        });
    }
    function findById(id) {
        var obj = new Object();
        obj.id=id;
        doData("/Application/findByid",obj,function (result) {
            if(result.code=="0002"){
                $("#show_id").val(result.obj.id);
                $("#show_approvalname").val(result.obj.approvalname);
                $("#show_submitname").val(result.obj.submitname);
                $("#show_approvaltime").val(formatDateTimebox(result.obj.approvaltime));
                $("#show_submittime").val(formatDateTimebox(result.obj.submittime));
                // var t = "\"option[text='"+result.obj.status+"']\"";
                $("#show_status").val(result.obj.status);
                $("#show_picture").val(result.obj.picture);
                $("#show_text").val(result.obj.text);
                $("#show_typename").val(result.obj.typename);
            }
            else {
                alert(result.message);
            }
        },true);
    }
</script>
</html>
