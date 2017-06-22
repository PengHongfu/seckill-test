
<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <base href=" <%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册页面</title>
    <link rel="stylesheet" href="bootstrapvalidator/vendor/bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" href="bootstrapvalidator/dist/css/bootstrapValidator.css"/>

    <script type="text/javascript" src="bootstrapvalidator/vendor/jquery/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="bootstrapvalidator/vendor/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
    <style type="text/css">
        body {
            padding-top: 40px;
            padding-bottom: 40px;
            background-color: #eee;
        }
        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .btn-block {
            display: block;
            width: 100%;
        }
        .form-group{
            margin-bottom: 30px;
        }
        .title{
            text-align:center;
            margin-bottom: 30px;
        }
        .mybottom{
            bottom: 0;
            height: 150px;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#myform')
                .bootstrapValidator({
                    message: '输入值不合法',
                    feedbackIcons: {
                        valid: 'glyphicon glyphicon-ok',
                        invalid: 'glyphicon glyphicon-remove',
                        validating: 'glyphicon glyphicon-refresh'
                    },
                    fields: {
                        loginname: {
                            message: '用户名不合法',
                            validators: {
                                notEmpty: {
                                    message: '用户名不能为空'
                                },
                                stringLength: {
                                    min: 3,
                                    max: 30,
                                    message: '请输入3到30个字符'
                                },
                                threshold: 3,//有6字符以上才发送ajax请求
                                remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                                    url: 'User/checkNameExistsMethod1',//验证地址
                                    message: '用户已存在',//提示消息
                                    delay :  2000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                                    type: 'POST'//请求方式
                                    /**自定义提交数据，默认值提交当前input value
                                     *  data: function(validator) {
                                           return {
                                               password: $('[name="loginname"]').val(),
                                               whatever: $('[name="loginpass"]').val()
                                       };
                                    }
                                     */
                                },
                                regexp: {
                                    regexp: /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,
                                    message: '用户名只能由字母、数字、点、下划线和汉字组成 '
                                }
                            }
                        },
                        loginpass: {
                            message: '密码不合法',
                            validators: {
                                stringLength: {
                                    min: 6,
                                    max: 30,
                                    message: '请输入6到30个字符'
                                },
                                notEmpty: {
                                    message: '密码不能为null'
                                },
                                identical: {
                                    field: 'reloginpass',
                                    message: '两次密码不一致'
                                },
                                different: {//不能和用户名相同
                                    field: 'loginname',
                                    message: '密码不能和用户名相同'
                                }
                            }
                        }, reloginpass: {
                            message: '确认密码不合法',
                            validators: {
                                notEmpty: {
                                    message: '确认密码不能为null'
                                },
                                stringLength: {
                                    min: 6,
                                    max: 30,
                                    message: '请输入6到30个字符'
                                },

                                identical: {
                                    field: 'loginpass',
                                    message: '两次密码不一致'
                                },
                                different: {//不能和用户名相同
                                    field: 'loginname',
                                    message: '密码不能和用户名相同'
                                }
                            }
                        }
                        , email: {
                            validators: {
                                notEmpty: {
                                    message: 'email不能为空'
                                },
                                emailAddress: {
                                    message: '请输入正确的邮件地址如：123@qq.com'
                                }
                            }
                        }
                    }
                });
            /*.on('success.form.bv', function (e) {//点击提交之后
             // Prevent form submission
             e.preventDefault();//关闭表单的submi事件

             // Get the form instance
             var $form = $(e.target);

             // Get the BootstrapValidator instance
             var bv = $form.data('bootstrapValidator');
             // Use Ajax to submit form data 提交至form标签中的action，result自定义
             $.post($form.attr('action'), $form.serialize(), function (result) {
             //dosomething
             });

             });*/
        });
    </script>
</head>
<body>
<div class="container">

    <form id="myform" class="form-signin" action="User/regist" method="post">
        <h2 class="title">你好，请注册！</h2>
        <div class="form-group has-feedback">
            <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-user "
                                                       aria-hidden="true"></span></span>
                <input type="text" class="form-control input-lg" id="loginname" name="loginname" placeholder="用户名">
            </div>
            <p class="text-warning small">${loginname}</p>
        </div>
        <div class="form-group has-feedback">

            <div class="input-group">
                <span class="input-group-addon"><span class="glyphicon glyphicon-lock "
                                                      aria-hidden="true"></span></span>
                <input type="password" class="form-control input-lg" id="loginpass" name="loginpass" placeholder="密码">
            </div>
            <p class="text-warning small">${loginpass}</p>
        </div>
        <div class="form-group has-feedback">
            <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-lock "
                                                       aria-hidden="true"></span></span>
                <input type="password" class="form-control input-lg" id="reloginpass" name="reloginpass"
                       placeholder="确认密码">
            </div>
        </div>
        <div class="form-group has-feedback">
            <div class="input-group">
                 <span class="input-group-addon"><span class="glyphicon glyphicon-envelope "
                                                       aria-hidden="true"></span></span>
                <input type="email" class="form-control input-lg" id="email" name="email" placeholder="邮箱">
            </div>
            <p class="text-warning small">${email}</p>
        </div>
        <button type="submit" class="btn btn-primary btn-block  btn-lg">注册</button>
    </form>
</div>
<div class="mybottom" style="visibility: hidden">隐藏的div</div>
</body>
</html>