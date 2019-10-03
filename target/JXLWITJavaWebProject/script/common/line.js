/**
 * Created by wph-pc on 2018/4/10.
 */
function Point(x,y,color)
{
    var obj=new Object();
    obj.X=x;
    obj.Y=y;
    obj.Color=color;
    return obj;
}
function Line(ctx,linewitdh) {
    this.lineWidth=linewitdh;
    this.ctx=ctx;
}
Line.prototype={
    lineLength:0,
    data:null,//数组，Point类型数据
    count:0,//计算器
    lineWidth:3,
    finish:false,
    init:function () {
        this.lineLength = this.computeLen(this.data[0],this.data[1]);
    },
    computeLen:function (a,b) {
        return Math.sqrt((a.X-b.X)*(a.X-b.X) + (a.Y-b.Y)*(a.Y-b.Y));
    },
    draw:function () {
        this.finish=false;
        if(this.lineLength<=0) {
            this.lineLength = this.computeLen(this.data[this.count],this.data[this.count+1]);
            this.count++;
            if (this.count>=this.data.length-1)
            {
                cancelAnimationFrame(this.handler);
                this.finish=true;//绘制结束
                return;
            }

        }
        //ctx.clearRect(0, 0, 500, 500);
        this.ctx.setLineDash([this.lineLength,this.lineLength]);
        this.ctx.lineDashOffset = this.lineLength--;
        if (this.data[this.count].color==undefined)
            this.ctx.strokeStyle ="#000000";
        else
            this.ctx.strokeStyle =this.data[this.count].color;
        this.ctx.lineWidth =this.lineWidth;
        this.ctx.beginPath();
        this.ctx.lineTo(this.data[this.count+1].X,this.data[this.count+1].Y);
        this.ctx.lineTo(this.data[this.count].X,this.data[this.count].Y);
        this.ctx.stroke();
        this.ctx.closePath();
        var objTemp=this;
        this.handler=requestAnimationFrame(function () {
            objTemp.draw();
        });
    },
    drawRect:function (pointLeft,width,height) {
        var rightTop=new Point(pointLeft.X+width,pointLeft.Y,pointLeft.Color);
        var rightBottom=new Point(pointLeft.X+width,pointLeft.Y+height,pointLeft.Color);
        var leftBottom=new Point(pointLeft.X,pointLeft.Y+height,pointLeft.Color);
        if (this.data==null)
            this.data=new Array();
        this.data.push(pointLeft);
        this.data.push(rightTop);
        this.data.push(rightBottom);
        this.data.push(leftBottom);
        this.data.push(pointLeft);//构成闭包路径
        this.init();
        this.draw();
    },
    drawDiamond:function (centerPoint,width,height) {
        var top=new Point(centerPoint.X,centerPoint.Y-height/2,centerPoint.Color);
        var right=new Point(centerPoint.X+width/2,centerPoint.Y,centerPoint.Color);
        var bottom=new Point(centerPoint.X,centerPoint.Y+height/2,centerPoint.Color);
        var left=new Point(centerPoint.X-width/2,centerPoint.Y,centerPoint.Color);
        if (this.data==null)
            this.data=new Array();
        this.data.push(top);
        this.data.push(right);
        this.data.push(bottom);
        this.data.push(left);
        this.data.push(top);//构成闭包路径
        this.init();
        this.draw();
    },
    drawString:function (position,text,font) {
        this.ctx.textAlign = "center";
        if (position.Color==undefined)
            this.ctx.fillStyle ="#000000";
        else
            this.ctx.fillStyle = position.Color;
        if (font==undefined)
            this.ctx.font = "18px 微软雅黑";
        else
            this.ctx.font=font;
        this.ctx.fillText(text,position.X,position.Y);
    }
}
