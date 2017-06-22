
/**
 * 用户信息usrmsg.jsp js
 * Created by Peng on 2017/4/26.
 */
var usermsg ={

    init:function (params) {
        var basePath = params['basePath'];
        var form =  $('#updateform');
        var form2 = $('#pwdform');
        var returnmsg = $("#returnMessage");
        var returnpwdmsg = $("#returnpwdMessage");

        form.bootstrapValidator({
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
                            regexp: {
                                regexp: /^[a-zA-Z0-9_\. \u4e00-\u9fa5 ]+$/,
                                message: '用户名只能由字母、数字、点、下划线和汉字组成 '
                            }
                        }
                    },email: {
                        validators: {
                            notEmpty: {
                                message: 'email不能为空'
                            },
                            emailAddress: {
                                message: '请输入正确的邮件地址如：123@qq.com'
                            }
                        }
                    },phone:{
                        validators: {
                            notEmpty: {
                                message: '手机号不能为空'
                            },
                            regexp: {
                                regexp: "^([0-9]{11})?$",
                                message: '手机号码格式错误'
                            }
                        }
                    },address: {
                        validators: {
                            notEmpty: {
                                message: '地址不能为空'
                            }, stringLength: {
                                min: 8,
                                max: 60,
                                message: '请输入5到60个字符'
                            }
                        }
                    }
                }
            });
        form2.bootstrapValidator({
                message: '输入值不合法',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    oldloginpass: {
                        message: '旧密码不合法',
                        validators: {
                            notEmpty: {
                                message: '旧密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '请输入正确的密码'
                            },
                            threshold: 6,//有6字符以上才发送ajax请求
                            remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}
                                url: basePath+'User/checkOldloginpass',//验证地址
                                message: '旧密码错误',//提示消息
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
                            }
                        }
                    },
                    newloginpass: {
                        message: '新密码不合法',
                        validators: {
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '请输入6到30个字符新密码'
                            },
                            notEmpty: {
                                message: '新密码不能为null'
                            },
                            identical: {
                                field: 'repeatloginpass',
                                message: '两次密码不一致'
                            }
                        }
                    }, repeatloginpass: {
                        message: '确认密码不合法',
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为null'
                            },
                            stringLength: {
                                min: 6,
                                max: 30,
                                message: '请输入正确的密码格式'
                            },

                            identical: {
                                field: 'newloginpass',
                                message: '两次密码不一致'
                            }
                        }
                    }
                }
            });
        $("#updateBtn").click(function () {
                //验证表单数据
                var bv = form.data('bootstrapValidator');
                bv.validate();
                //验证通过
                if(bv.isValid()){
                    console.log("提交的数据"+form.serialize());
                    //发送ajax请求
                    $.ajax({
                        url:basePath+'User/mymsg',
                        async:false,//同步，会阻塞操作
                        type:'put',
                        timeout:1000,
                        data:form.serialize(),//数据为表单数据
                        success:function (result) {
                            console.log(result);
                            if(result['success']){
                                returnmsg.hide();
                                window.location.reload();
                            }else{
                                returnmsg.hide().
                                html('<label class="label label-danger">修改失败!</label>').show(300);
                            }
                        },error:function () {
                            returnmsg.hide().
                            html('<label class="label label-danger">修改失败!</label>').show(300);
                        }
                    })
                }
            });
        $("#modifyPwdBtn").click(function () {
            //验证表单数据
            var bv = form2.data('bootstrapValidator');
            bv.validate();
            //验证通过
            if(bv.isValid()){
                console.log("提交的数据"+form2.serialize());
                //发送ajax请求
                $.ajax({
                    url:basePath+'User/pwd',
                    async:false,//同步，会阻塞操作
                    type:'put',
                    timeout:1000,
                    data:form2.serialize(),//数据为表单数据
                    success:function (result) {
                        console.log(result);
                        if(result['success']){
                            returnpwdmsg.hide();
                            window.location.reload();
                        }else{
                            returnpwdmsg.hide().
                            html('<label class="label label-danger">修改密码失败!</label>').show(300);
                        }
                    },error:function () {
                        returnpwdmsg.hide().
                        html('<label class="label label-danger">修改密码失败!</label>').show(300);
                    }
                })
            }
        });
    }
}