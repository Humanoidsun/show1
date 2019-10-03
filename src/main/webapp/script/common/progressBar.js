function progressBar(canvasID,radius,total,nowAmount){
    var c = document.getElementById(canvasID);
    var percentage=(nowAmount/total)*100;   //显示当前的百分比
    var ctx = c.getContext('2d');
    var r=radius;       //设置环的半径；
    var centerX = c.width/2;   //Canvas中心点x轴坐标
    var centerY = c.height/2;  //Canvas中心点y轴坐标
    var rad = Math.PI*2/100; //将360度分成100份，那么每一份就是rad度
    var speed = 0.4;         //加载的快慢就靠它了
    animate();
    function animate(){
        window.requestAnimationFrame(function(){
            if(speed<percentage){
                animate();
            }
        });
        ctx.clearRect(0, 0, c.width, c.height);
        speed += 0.3;
        drawCircle(ctx,speed);
    };
    function drawCircle(ctx,percent){
        //画白色的静态圆
        ctx.save();
        ctx.strokeStyle = "#007FFF";
        ctx.lineWidth = 15;
        ctx.beginPath();
        ctx.arc(centerX, centerY, r, 0, Math.PI*2, false);
        ctx.stroke();
        ctx.closePath();
        ctx.restore();
        //画进度环
        ctx.save();
        if(speed<30){
            ctx.strokeStyle = "#FF0000";
            ctx.lineWidth = 15;
        }else if(speed<60){
            ctx.strokeStyle = "#FF7F00";
            ctx.lineWidth = 15;
        }else if(speed<80){
            ctx.strokeStyle = "#cbe844";
            ctx.lineWidth = 15;
        }else if(speed<90){
            ctx.strokeStyle = "#96e840";
            ctx.lineWidth = 15;
        } else {
            ctx.strokeStyle = "#8be82e";
            ctx.lineWidth = 15;
        }
        ctx.beginPath();
        ctx.arc(centerX, centerY, r, -Math.PI/2, -Math.PI/2 +percent*rad, false);
        ctx.stroke();
        ctx.closePath();
        ctx.restore();
        //百分比文字绘制
        ctx.save();
        ctx.fillStyle = "#7ce835";
        ctx.font = "bold 21px Arial";
        //绘制字体并指定位置
        ctx.fillText(percent.toFixed(0) + '%', centerX-20, centerY+10);
        ctx.restore();
    }
}

