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
function Line(ctx,startPoint,endPoint,color) {
    this.startPoint=startPoint;
    this.endPoint=endPoint;
    this.color=color;
    this.tempX=startPoint.X;
    this.tempY=startPoint.Y;
    this.ctx=ctx;
    this.init();

}
Line.prototype={
    startPoint:null,
    endPoint:null,
    color:"",
    tempX:0,
    tempY:0,
    stepX:0,
    stepY:0,
    lineLength:0,
    flag:false,//是否画完，如果完成，true，否则false;
    data:null,//数组，Point类型数据
    count:0,//计算器
    init:function () {
        if (this.endPoint.Y==this.startPoint.Y)
            this.stepX=1
        else
            this.stepX=Math.abs(this.endPoint.X-this.startPoint.X)>Math.abs
            (this.endPoint.Y-
                this.startPoint.Y)?Math.abs(this.endPoint.X-this.startPoint.X)/Math.abs
                (this.endPoint.Y-this.startPoint.Y):1;

        if (this.endPoint.X-this.startPoint.X==0)
            this.stepY=1;
        else
            this.stepY=Math.abs(this.endPoint.Y-this.startPoint.Y)>Math.abs
            (this.endPoint.X-
                this.startPoint.X)?Math.abs(this.endPoint.Y-this.startPoint.Y)/Math.abs
                (this.endPoint.X-this.startPoint.X):1;
        this.lineLength=Math.sqrt(Math.pow(Math.abs(this.endPoint.X-
                this.startPoint.X),2)+Math.pow(Math.abs(this.endPoint.Y-
                this.startPoint.Y),2));
    },
    drawLine:function () {
        this.flag=false;
        this.ctx.moveTo(this.startPoint.X,this.startPoint.Y);

        if (this.endPoint.X!= this.tempX)
            if (this.endPoint.X> this.tempX)
                this.tempX+= this.stepX;
            else
                this.tempX-= this.stepX;

        if (this.endPoint.Y!= this.tempY)
            if (this.endPoint.Y> this.tempY)
                this.tempY+= this.stepY;
            else
                this.tempY-= this.stepY;

        this.ctx.clearRect(this.startPoint.X,this.startPoint.Y,Math.abs(this.endPoint.X-
            this.startPoint.X),Math.abs(this.endPoint.Y-
            this.startPoint.Y));

        this.ctx.lineTo( this.tempX, this.tempY);
        this.ctx.strokeStyle =this.color;
        this.ctx.lineWidth = 2;
        this.ctx.stroke();
        var objTemp=this;

        var handler=requestAnimationFrame(function(){objTemp.drawLine();});
        var currentLineLen=Math.sqrt(Math.pow(Math.abs( this.tempX-
                this.startPoint.X),2)+Math.pow(Math.abs( this.tempY-
                this.startPoint.Y),2));

        if (currentLineLen>= this.lineLength)
        {
            cancelAnimationFrame(handler);
            this.flag=true;
        }
    },
    computeLen:function (a,b) {
        return Math.sqrt((a.X-b.X)*(a.X-b.X) + (a.Y-b.Y)*(a.Y-b.Y));
    },
    draw:function () {
        if(this.lineLength<=0) {
            this.lineLength = this.computeLen(this.data[this.count],this.data[this.count+1]);
            this.count++;
            if (this.count>=this.data.length-1)
            {
                cancelAnimationFrame(this.handler);
                return;
            }

        }
        //ctx.clearRect(0, 0, 500, 500);
        this.ctx.setLineDash([this.length,this.length]);
        this.ctx.lineDashOffset = this.lineLength;
        this.ctx.strokeStyle =this.data[this.count].color;
        this.ctx.lineWidth = 3;
        this.ctx.beginPath();
        this.ctx.lineTo(this.data[this.count+1].X,this.data[this.count+1].Y);
        this.ctx.lineTo(this.data[this.count].X,this.data[this.count].Y);
        this.ctx.stroke();
        this.ctx.closePath();
        var objTemp=this;
        this.handler=requestAnimationFrame(function () {
            objTemp.draw();
        }); 
    }
}



