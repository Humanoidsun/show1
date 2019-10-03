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
                                    <li class="active"><a href="profile.jsp"> 个人信息管理</a></li>
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
                                <div class="card-body">
									<div class="user-profile">
										<div class="row">
											<div class="col-lg-4">
												<div class="user-photo m-b-30" style="text-align: center;">
													<img style="width:100px;height: 100px;"  src="assets/images/avatar/1.jpg" alt="" />
												</div>
											</div>
											<div class="col-lg-8">
												<div class="custom-tab user-profile-tab">
													<ul class="nav nav-tabs" role="tablist">
														<li role="presentation" class="active"><a href="#1" aria-controls="1" role="tab" data-toggle="tab">个人信息</a></li>
													</ul>
													<div class="tab-content">
														<div role="tabpanel" class="tab-pane active" id="1">
															<div class="contact-information">
																<div class="phone-content">
																	<span class="contact-title">姓名:</span>
																	<span class="phone-number" id="name">${obj.name}</span>
																</div>
																<div class="address-content">
																	<span class="contact-title">性别:</span>
																	<span class="mail-address" id="sex">${obj.sex}</span>
																</div>
																<div class="email-content">
																	<span class="contact-title">出生日期:</span>
																	<span class="contact-email" id="birthday">${obj.birthday}</span>
																</div>
                                                                <div class="email-content">
                                                                    <span class="contact-title">手机号:</span>
                                                                    <span class="contact-email" id="phone">${obj.phone}</span>
                                                                </div>
																<div class="website-content">
																	<span class="contact-title">家庭地址</span>
																	<span class="contact-website" id="address">${obj.address}</span>
																</div>
																<div class="skype-content">
																	<span class="contact-title">电子邮件</span>
																	<span class="contact-skype" id="email">${obj.email}</span>
																</div>
                                                                <div class="skype-content">
                                                                    <span class="contact-title">所属部门</span>
                                                                    <span class="contact-skype" id="departname">${obj.departmentname}</span>
                                                                </div>
                                                                <div class="skype-content">
                                                                    <span class="contact-title">指纹信息</span>
                                                                    <span class="contact-skype" id="fingerprint">${obj.fingerprint}</span>
                                                                </div>
                                                                <div class="skype-content">
                                                                    <span class="contact-title">人脸信息</span>
                                                                    <span class="contact-skype" id="face">${obj.face}</span>
                                                                </div>
                                                                <button type="button" class="btn btn-primary btn-flat btn-addon m-b-10 m-l-5" data-toggle="modal" data-target="#editprofile" onclick="edit()"><i class="ti-settings"></i>编辑</button>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
                            </div>
                        </div><!-- /# column -->
                    </div><!-- /# row -->
                </div>
            </div><!-- /# container-fluid -->
        </div><!-- /# main -->
    </div><!-- /# content wrap -->

<div class="modal fade" id="editprofile" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="edit_user_form">
                        <input type="hidden" id="edit_id" name="id">
                        <div class="form-group">
                            <label for="edit_name" class="col-sm-2 control-label">
                                姓名
                            </label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="edit_name" placeholder="姓名" name="name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_sex" class="col-sm-2 control-label">
                                性别
                            </label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_sex" placeholder="性别" name="sex">
                            </div>
                            <label for="edit_birthday" class="col-sm-2 control-label">
                                出生日期
                            </label>
                            <div class="col-sm-4">
                                <input type="date" class="form-control" id="edit_birthday" placeholder="出生日期" name="birthday">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_address" class="col-sm-2 control-label">
                                家庭地址
                            </label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_address" placeholder="家庭地址" name="address">
                            </div>
                            <label for="edit_phone" class="col-sm-2 control-label">
                                手机号码
                            </label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_phone" placeholder="手机号码" name="phone">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_email" class="col-sm-2 control-label">
                                电子邮件
                            </label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="edit_email" placeholder="电子邮件" name="email">
                            </div>
                            <label for="edit_departname" class="col-sm-2 control-label">
                                所属部门
                            </label>
                            <div class="col-sm-4">
                                <input disabled="disabled" type="text" class="form-control" id="edit_departname" placeholder="所属部门" name="departmentname">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="edit_fingerprint" class="col-sm-2 control-label">
                                指纹信息
                            </label>
                            <div class="col-sm-4">
                                <input  type="file" class="form-control" id="edit_fingerprint" placeholder="指纹信息" name="fingerprint">
                            </div>
                            <label for="edit_face" class="col-sm-2 control-label">
                                人脸信息
                            </label>
                            <div class="col-sm-4">
                                <input type="file" accept=".jpg,.png" class="form-control" id="edit_face" placeholder="指纹信息" name="face">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="javascript:window.location.reload();">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="saveedit()">保存修改</button>
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
    window.onload =function () {
        show();
    }
    function show() {
        var obj = new  Object();
        console.debug("已调用show函数");
        $.ajax({
            type:'post',
            url:"/User/findById",
            dataType:'json',
            contentType: "application/json; charset=utf-8",
            cache: true,
            data: JSON.stringify(obj),
            success:function (result) {
                if(result.code=="0002"){
                    $("#name").text(result.obj.name);
                    $("#sex").text(result.obj.sex);
                    $("#birthday").text(formatDatebox(result.obj.birthday));
                    $("#address").text(result.obj.address);
                    $("#email").text(result.obj.email);
                    $("#departname").text(result.obj.departmentname);
                    $("#fingerprint").text(result.obj.fingerprint);
                    $("#face").text(result.obj.face);
                    $("#phone").text(result.obj.phone);
                }
                else {
                    alert(result.message);
                }
            }
        });
    }
    function edit() {
        var obj = new Object();
        doData("/User/findById",obj,function (result) {
            $("#edit_phone").val(result.obj.phone);
            $("#edit_name").val(result.obj.name);
            $("#edit_id").val(result.obj.id);
            $("#edit_sex").val(result.obj.sex);
            $("#edit_birthday").val(formatDatebox(result.obj.birthday));
            $("#edit_address").val(result.obj.address);
            $("#edit_email").val(result.obj.email);
            $("#edit_departname").val(result.obj.departmentname);
            $("#edit_fingerprint").val(result.obj.fingerprint);
            $("#edit_face").val(result.obj.face);
        },true);
    }
    function saveedit() {
        doData("/User/update",getFormData($("#edit_user_form")),function (result) {
            alert(result.message);
        },true);
    }


</script>
</html>