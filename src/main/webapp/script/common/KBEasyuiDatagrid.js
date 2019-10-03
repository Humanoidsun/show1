/**
 * Created by wph-pc on 2018/8/23.
 */
function KBEasyuiDatagrid(controlID,url,pageIndex,rowscount) {
    this.id=controlID;
    this.url=url;
    this.pageNumber=pageIndex;
    this.pageSize=rowscount;

}
KBEasyuiDatagrid.prototype.id="";//datagrid的id
KBEasyuiDatagrid.prototype.url="";//请求地址
KBEasyuiDatagrid.prototype.pageNumber=0;//页码
KBEasyuiDatagrid.prototype.pageSize=10;//每页显示行数
KBEasyuiDatagrid.prototype.pageInit=function (callback) {
    var dg = $("#"+this.id);//获取表格对象
    var opts = dg.datagrid('options');
    var pager = dg.datagrid('getPager');
    var kbdg=this;//获取当前对象
    pager.pagination({
        onSelectPage:function(pageNum, pageSize){
            opts.pageNumber = pageNum;
            opts.pageSize = pageSize;
            pager.pagination('refresh',{
                pageNumber:pageNum,
                pageSize:pageSize
            });
            kbdg.pageNumber=pageNum-1;
            kbdg.pageSize=pageSize;
            callback(kbdg.pageNumber,kbdg.pageSize);
        }
    });
}

