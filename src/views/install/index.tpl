<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>NodeBB Web安装程序</title>

	<link rel="stylesheet" type="text/css" href="https://bootswatch.com/united/bootstrap.min.css">
	<link href='http://fonts.useso.com/css?family=Roboto:400,300,500,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">


	<!--[if lt IE 9]>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/es5-shim/2.3.0/es5-shim.min.js"></script>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7/html5shiv.js"></script>
  		<script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
  		<script>__lt_ie_9__ = 1;</script>
	<![endif]-->
</head>

<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">NodeBB</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/">安装程序</a></li>
					<li><a href="https://docs.nodebb.org" target="_blank">获得帮助</a></li>
					<li><a href="https://community.nodebb.org" target="_blank">社区</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container <!-- IF success -->hide<!-- ENDIF success -->">
		<p>
			<h1>欢迎NodeBB安装</h1>
			启动NodeBB论坛只是几步之遥！
		</p>
		<form id="install" action="/" method="post">
			<div class="admin">
				<p>
					<h1><small>创建管理员帐户</small></h1>
					<hr />
				</p>

				<div class="row input-row">
					<div class="col-sm-7 col-xs-12 input-field">
						<label for="admin:username">管理员用户名</label>
						<input type="text" class="form-control" name="admin:username" value="<!-- IF admin:username -->{admin:username}<!-- ENDIF admin:username -->" placeholder="Username" />
					</div>
					<div class="col-sm-5 help-text" data-help="Enter an <strong>字母数字的用户名</strong>. 单词之间的空格是允许的。以后您可以随时更改用户名，您的个人资料页上."></div>
				</div>
				<div class="row input-row">
					<div class="col-sm-7 col-xs-12 input-field">
						<label for="admin:email">邮箱地址</label>
						<input type="text" class="form-control" name="admin:email" value="<!-- IF admin:email -->{admin:email}<!-- ENDIF admin:email -->" placeholder="Email Address" />
					</div>
					<div class="col-sm-5 help-text" data-help="请输入您的电子邮件地址."></div>
				</div>
				<div class="row input-row">
					<div class="col-sm-7 col-xs-12 input-field">
						<label for="admin:password">密码</label>
						<input type="password" class="form-control" name="admin:password" value="<!-- IF admin:password -->{admin:password}<!-- ENDIF admin:password -->" placeholder="Password" />
					</div>
					<div class="col-sm-5 help-text" data-help="大于 6位字节 使用数字，符号，以及不同的情况的组合。您可以更改密码创建的严格管理控制面板中."></div>
				</div>
				<div class="row input-row">
					<div class="col-sm-7 col-xs-12 input-field">
						<label for="admin:passwordConfirm">确认密码</label>
						<input type="password" class="form-control" name="admin:passwordConfirm" value="<!-- IF admin:passwordConfirm -->{admin:passwordConfirm}<!-- ENDIF admin:passwordConfirm -->" placeholder="Confirm Password" />
					</div>
					<div class="col-sm-5 help-text" data-help="请确认您的密码."></div>
				</div>
			</div>

			<!-- IF error -->
			<a id="database-error"></a>
			<!-- ENDIF error -->

			<!-- IF !skipDatabaseSetup -->
			<div class="database">
				<p>
					<h1><small>配置数据库</small></h1>
					<hr />
				</p>

				<div class="row input-row">
					<div class="col-sm-7 col-xs-12 input-field">
						<label for="database">数据库类型</label>
						<select class="form-control" name="database">
							<option value="redis">Redis</option>
							<option value="mongo">MongoDB</option>
						</select>
					</div>
					<div class="col-sm-5 help-text" data-help="留空以使用默认设置的字段."><!-- IF error -->连接到数据库的错误。请重试.<!-- ENDIF error --></div>
				</div>

				<div id="database-config"></div>
			</div>
			<!-- ENDIF !skipDatabaseSetup -->

			<button id="submit" type="submit" class="btn btn-lg btn-success">确定安装 <i class="fa fa-spinner fa-spin hide"></i></button>
		</form>
	</div>


	<div class="container <!-- IF !success -->hide<!-- ENDIF !success -->">
		<p>
			<h1>恭喜！您的NodeBB已建立.</h1>
			
			<button id="launch" class="btn btn-lg btn-success">发射 NodeBB <i class="fa fa-spinner fa-spin hide"></i></button>
		</p>
	</div>

	<div class="hide">
		<!-- BEGIN databases -->
		<div data-database="{databases.name}">
			<!-- BEGIN questions -->
				<div class="row input-row">
					<div class="col-sm-7 col-xs-12 input-field">
						<label for="{databases.questions.name}">{databases.questions.description}</label>
						<input type="<!-- IF hidden -->password<!-- ELSE -->text<!-- ENDIF hidden -->" class="form-control" name="{databases.questions.name}" placeholder="{databases.questions.default}" value="{databases.questions.default}" />
					</div>
				</div>
			<!-- END questions -->
		</div>
		<!-- END databases -->			
	</div>

	<script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="nodebb.min.js"></script>
</body>
</html>