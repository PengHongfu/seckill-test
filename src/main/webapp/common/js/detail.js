/**
 * Created by Peng on 2017/4/21.
 */
// javascript 模块化(package.类.方法)

var detail = {
    init: function (params) {

        var nowTime = 0;
        var startTime = params['startTime'];
        var endTime = params['endTime'];
        var seckillId = params['seckillId'];
        var nowtimeUrl = params['nowtimeUrl'];
        var exposerUrl = params['exposerUrl'];
        var killUrl = params['killUrl'];

        //验证是否登录
        var loginisTrue = params['loginisTrue'];/*没登录为true*/
        if(loginisTrue){
            var myModal = $('#myModal');
            myModal.modal({
                show: true,//显示弹出层
                backdrop: 'static',//禁止位置关闭
                keyboard: false//关闭键盘事件
            });
        }else{
            $.get(nowtimeUrl, function (result) {
                nowTime = result['data'];
                detail.showtime(seckillId, nowTime, startTime, endTime,exposerUrl,killUrl);
            });
        }
    },

    showtime :function (seckillId, nowTime, startTime, endTime,exposerUrl,killUrl) {
        var seckillBox = $('#seckill-box');
        var seckillBtn = $("#seckillBtn");
        console.log('showtime:'+seckillId + '_' + nowTime + '_' + startTime + '_' + endTime+'_'+exposerUrl+'_'+killUrl);
        if (nowTime > endTime) {
            seckillBox.html('秒杀已结束');
            seckillBtn.addClass("disabled");
        } else if (nowTime < startTime) {
            //秒杀未开始
            seckillBox.countdown(startTime, function (event) {
                var format = event.strftime('秒杀倒计时: %D天 %H时 %M分 %S秒 ');
                seckillBox.html(format);
                seckillBtn.addClass("disabled");
                console.log('秒杀未开启');
            }).on("finish.countdown", function () {
                //时间完成结束后
                seckillBox.html('秒杀开启');
                seckillBtn.removeClass("disabled");
                detail.handlerSeckill(seckillId,seckillBtn,exposerUrl,killUrl);
            });
        } else {

            //秒杀开始
            seckillBox.html('秒杀开启');
            seckillBtn.removeClass("disabled");
            detail.handlerSeckill(seckillId,seckillBtn,exposerUrl,killUrl);
        }
    },
    handlerSeckill:function (seckillId,seckillBtn,exposerUrl,killUrl) {
        console.log('handlerSeckill:'+seckillId + '_' + seckillBtn + '_' + exposerUrl+'_'+killUrl);
        /*result的结果类型SeckillResult<Exposer>
         SeckillResult:

         //请求是否成功
         private boolean success;
         //泛型的数据
         private T data;
         //错误
         private String error;

         Exposer:
         //是否开启秒杀
         private boolean exposed;

         //加密措施
         private String md5;

         //商品id
         private long seckillId;

         //系统当前时间(毫秒)
         private long now;

         //秒杀的开启时间
         private long start;

         //秒杀的结束时间
         private long end;*/
        $.post(exposerUrl,function (result) {
            if(result && result['success']){
                var exposer = result['data'];
                if(exposer['exposed']){
                    //开启秒杀
                    //获取秒杀地址
                    var md5 = exposer['md5'];
                    var killSeckillUrl = killUrl+md5+'/execution';
                    console.log('exposer_killUrl:'+killSeckillUrl);
                    //抢购按钮绑定一次点击事件
                    seckillBtn.one('click',function () {
                        console.log('seckillBtn按下了:');
                        //执行秒杀请求
                        //1.先禁用按钮
                        $(this).addClass('disabled');
                        $.post(killSeckillUrl,function (result) {
                            if (result && result['success']) {
                                var killResult = result['data'];
                                var state = killResult['state'];
                                var stateInfo = killResult['stateInfo'];
                                //显示秒杀结果
                                seckillBtn.html(stateInfo);
                            }
                        });
                    });
                }
            }else{
                console.log('暴露秒杀接口Url的result: ' + result);
            }
        });
    }
};