/**
 * Created by wph-pc on 2018/3/11.
 */
MyBootstrapTreeView.prototype.treeviewID = "";
function MyBootstrapTreeView(controlId) {
    this.treeviewID = controlId;
   $("#"+this.treeviewID).treeview({
        levels: 5,
        icon: "glyphicon glyphicon-stop",
        selectedIcon: "glyphicon glyphicon-stop",
        color: "#000000",
        backColor: "#FFFFFF",
        selectable: true,
        state: {
            checked: true,
            disabled: true,
            expanded: true,
            selected: true
        },
        showTags: true,
        tags: ['available']
    });
}
MyBootstrapTreeView.prototype.loadData=function (datasource) {
    $("#"+this.treeviewID).treeview({
        data:datasource
    });
}


MyBootstrapDatePicker.prototype.datepickerID="";
function MyBootstrapDatePicker(domID) {
    this.datepickerID = domID;
    $('#'+domID).datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        startDate:new Date(),
        minView: 2,
        forceParse: 0,
        dateFormate:'',
    });
}
MyBootstrapDatePicker.prototype.getDate=function () {
    return $("#"+this.datepickerID).data("datetimepicker").getDate();
}