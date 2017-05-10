<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="en" class="bg-dark">
<head>
<meta charset="utf-8" />
<title>系统登录</title>
<meta name="description"
	content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="../page/css/app.v2.css" type="text/css" />
<link rel="stylesheet" href="../page/css/font.css" type="text/css"
	cache="false" />
</head>
<body>
	<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
		<div class="container aside-xxl">
			<a class="navbar-brand block" href="index.html">学生综合信息记录系统</a>
			<section class="panel panel-default bg-white m-t-lg">
				<header class="panel-heading text-center">
					<strong>登 录</strong>
				</header>
				<form id="login" class="panel-body wrapper-lg" method="post">
					<div class="control-label">
					<label class="control-label">学校</label>
						<button type="button" class="btn form-control input-lg"
							data-toggle="dropdown">
							 南洋理工大学<i class="fa fa-bars pull-right"></i>
						</button>
						<ul class="dropdown-menu">
							<li><a href="#">南洋理工大学</a></li>
							<li><a href="#">清华大学</a></li>
							<li><a href="#">北京大学</a></li>
						</ul>
					</div>
					<div class="form-group">
						<label class="control-label">帐号</label> <input type="text"
							placeholder="请输入教职工号" name="username" class="form-control input-lg">
					</div>
					<div class="form-group">
						<label class="control-label">密码</label> <input type="password"
							id="inputPassword" placeholder="请输入密码" name="password"
							class="form-control input-lg">
					</div>
					<div class="checkbox">
						<label> <input type="checkbox"> 记住密码
						</label>
					</div>
					<a href="#" class="pull-right m-t-xs"><small>忘记密码?</small></a>
					<button type="submit" class="btn btn-primary">登 录</button>
				</form>
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                <h4 class="modal-title" id="myModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                            <div id="result"></div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
			</section>
		</div>
	</section>
	<!-- footer -->
	<footer id="footer">
		<div class="text-center padder">
			<p>
				<small>liedenwang@Tencent.com<br>&copy; 2016
				</small>
			</p>
		</div>
	</footer>
	<!-- / footer -->
	<script src="../page/js/app.v2.js"></script>
	<script src="../page/js/jquery.min.js"></script>
	<script src="../page/js/jquery.form.min.js"></script>
	<script src="../page/js/jquery.validate.min.js"></script>
	<script type="text/javascript">
	$().ready(function() {
		$("#login").validate({
			rules: {
				username: {
					required: true,
					minlength: 5
				},
				password: {
					required: true,
					minlength: 5
				}
			},
			messages: {
				username: {
					required: "请输入用户名",
					minlength: "用户名至少5个字符"
				},
				password: {
					required: "请输入密码",
					minlength: "密码至少5个字符"
				}
			},
			submitHandler:function(form){
    		    var txtHtml;
    			$.ajax({
    				url:'login.do',
    				data:$('#login').serialize(),
    				type:"GET",
    				success:function(data){
    	                if(data.status == "0"){
    	    				window.location.href=data.url;
    	                }else{
    	                	txtHtml="<p class='text-warning'>" + data.info + "</p>";
    	                	$("#result").html(txtHtml);
        					$("#myModal").modal("show");
    	                }
    	            }
    			});
	        }
		});
	});
	</script>
</body>
</html>