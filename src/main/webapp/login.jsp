<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header/init_bootstrap.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>江西联微软件技术有限公司统一开发平台</title>
	<meta name="keywords" content="联微软件,平台">
	<meta name="description" content="联微软件">
	<meta name="renderer" content="webkit">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<style>
		.form-top {
			overflow: hidden;
			padding: 0 25px 15px 25px;
			background: #000000;
			border-radius: 4px 4px 0 0;
			text-align: left;
			margin-top: 3%;
		}

		.form-top-left {
			float: left;
			width: 80%;
			padding-top: 45px;
		}

		.form-top-left h3 { margin-top: 0; }

		.form-top-right {
			float: left;
			width: 20%;
			padding-top: 5px;
			font-size: 66px;
			color: #ddd;
			line-height: 100px;
			text-align: right;
		}
		.head{
			height: 70px;
		}
		.form-bottom {
			padding: 25px 25px 30px 25px;
			background: #eee;
			border-radius: 0 0 4px 4px;
			text-align: left;
		}
		.form-bottom form button.btn {
			width: 100%;
		}

		.form-bottom form .input-error {
			border-color: #4aaf51;
		}
		#txtCode{
			width:55%;
			border-radius:0 4px 4px 0;
		}
		#imgCode{
			width: 40%;
			height:33px;
			border-radius: 4px;
			margin-left:5%;
			cursor:pointer;
		}

		#footer {
			height: 40px;
			line-height: 40px;
			position: relative;
			bottom: 0;
			text-align: center;
			color: #333;
			margin-top: 6%;
		}
	</style>
</head>
<body>
<div class="container-fluid">
	<div class="row head">
		<div class="col-md-3 col-md-offset-1">
			<img src="images/logo.png" class="img-responsive" style="height: 40px;margin-top: 15px">
		</div>
	</div>

	<div class="row" style="background-color: #0dbfdd;">
		<div class="col-md-5 col-md-offset-1" >
			<img src="images/4.png" class="img-responsive">
		</div>

		<div class="col-md-4 col-md-offset-1" style="padding-top:40px;">

			<div class="form-top">
				<div >
					<h3 style="color:white">江西联微统一开发平台</h3>
				</div>
			</div>
			<div class="form-bottom">
				<form role="form" action="" method="post" >
					<div class="form-group">
						<label class="sr-only" for="txtNumber">UserName</label>
						<div class="input-group">
							<div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
							<input type="text" name="number" placeholder="账号" class=" form-control" id="txtNumber" required>
						</div>
					</div>

					<div class="form-group">
						<label class="sr-only" for="txtPwd">PassWord</label>
						<div class="input-group">
							<div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
							<input type="password"  name="password" placeholder="密码" class="form-control" id="txtPwd" required>
						</div>
					</div>

					<div class="form-group">
						<label class="sr-only">Code</label>
						<div class="input-group">
							<div class="input-group-addon"><span class="glyphicon glyphicon-check"></span></div>
							<input type="text" class="form-control" id="txtCode" maxlength="4"  placeholder="验证码"  required/>
							<img src="<%=basePath%>/imageCode/showcode"  alt="点击切换" id="imgCode" onclick="refreshImg()">

						</div>
					</div>

					<!--<span id="disPlay"></span>-->
					<button type="button" id="btnLogin" class="btn btn-success">登录</button>
				</form>
			</div>
		</div>
	</div>

	<div class="row"  id="footer">
		<div class="col-md-12" >
			<strong>江西联微软件技术有限公司版权所有©2017-2020 技术支持电话：13755695563</strong>
		</div>
	</div>
</div>


<script>
    function  refreshImg() {
        document.getElementById("imgCode").src="<%=basePath%>/imageCode/showcode?timestamp="+(new Date()).getTime();
    }
    $(function () {

        $("#btnLogin").click(function () {
            if ($("#txtNumber").val()=="" || $("#txtPwd").val()=="" || $("#txtCode").val()=="")
            {
                toastr.info("账号、密码及验证码都不能为空！");
                return;
            }
			/*验证验证码*/
            doData("imageCode/getCode",null,function (data) {
                if ($("#txtCode").val()!=data.result)
                {
                    refreshImg();
                    toastr.info("验证码错误！");
                    return false;
                }
                else
                {
                    var user=new Object();
                    user.number=$("#txtNumber").val();
                    user.password=$("#txtPwd").val();
                    doData("login",user,function (result) {
                        if (result.obj!=undefined && result.obj!=null){
                            switch (result.obj.type){
								case "student":
								    location.href="studentindex";
								    break;
								case "teacher":
                                    location.href="teacherindex";
                                    break;
								default:
                                    location.href="index";
                                    break;
							}
						}
                        toastr.info(result.message);
                        refreshImg();
                        $("#txtNumber").val("");
                        $("#txtPwd").val("");
                    });
                }
            });
        });
    });
</script>
</body>
</html>