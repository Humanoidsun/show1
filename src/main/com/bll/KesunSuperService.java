package bll;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import dao.IDoData;
import kesun.entity.AbsSuperObject;
import kesun.entity.KesunReturn;
import kesun.entity.Page;
import kesun.entity.system.User;
import util.ExcelUtil;
import util.PathUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.w3c.dom.NodeList;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * Created by wph-pc on 2017/5/26.
 */
public abstract class KesunSuperService {

    private AbsSuperObject model=null;

    public abstract String getLoadoutExcelFileName();//获取导出Excel数据文件名称

    /*获取数据访问层对象*/
    public abstract IDoData getDAO();

    public AbsSuperObject getModel() {
        return model;
    }
    public void setModel(AbsSuperObject model) {
        this.model = model;
    }
    /*
    *是否新增控制条件，true表示新增，false表示不新增
    * */
    public  Boolean isAdd()
    {
        return true;
    }
    /*
        *是否修改控制条件，true表示新增，false表示不新增
        * */
    public  Boolean isEdit()
    {
        return true;
    }
    /*
    是否删除控制条件，true表示新增，false表示不新增
      * */
    public  Boolean isDelete()
    {
        if (isInUse())
            return false;
        else
           return true;
    }
    /*判断当前实体对象是否在使用中*/
    public Boolean isInUse()
    {
        if (getDAO()==null || getModel()==null) return false;
        return getDAO().objectInUse(getModel().getId());
    }
    public KesunReturn del()
    {
        KesunReturn back=new KesunReturn();
        int result=0;
        try {
            result=(Integer)getDAO().delete(model.getId());
            if (result>0)
                back.setMessage("您指定的数据已经成功删除！");
            else
                back.setMessage("删除失败，系统返回错误码："+result);
        } catch (Exception e) {
            e.printStackTrace();
            back.setMessage("系统出现异常信息："+e.getMessage());
            result=-1;
        }
        back.setCode(String.valueOf(result));
        back.setObj(result);
        return back;
    }

    /**
     * 全查
     * @return
     * @throws Exception
     */
    public KesunReturn find(Map values){
        KesunReturn back=new KesunReturn();
        try {
            List<?> temp=getDAO().find(values);
            if (temp==null || temp.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("系统已经查询到符合条件的数据！");
            }
            back.setObj(temp);
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("系统查询的过程中出现异常信息："+e.getMessage());
            back.setObj(null);
        }
        return back;
    }


    public KesunReturn findForMap(Map values) {
        KesunReturn back=new KesunReturn();
        try {
            List<Map<String,Object>> temp=getDAO().findForMap(values);
            back.setObj(temp);
            if (temp==null || temp.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        } catch (Exception e) {
            back.setCode("-1");
            back.setMessage("系统处理查询的过程中出现异常，异常信息："+e.getMessage());
            back.setObj(null);
            e.printStackTrace();
        }
        return back;
    }
    public KesunReturn fastFind(Map values) {
        KesunReturn back=new KesunReturn();
        try {
            List<Map<String,Object>> temp=getDAO().fastFind(values);
            back.setObj(temp);
            if (temp==null || temp.size()==0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("系统已经查询到符合条件的数据！");
            }
        } catch (Exception e) {
            back.setCode("-1");
            back.setMessage("系统处理查询的过程中出现异常，异常信息："+e.getMessage());
            back.setObj(null);
            e.printStackTrace();
        }
        return back;
    }
    public KesunReturn getRowsCount(Map values) {
        KesunReturn back=new KesunReturn();
        try {
            int result=getDAO().getRowsCount(values);
            if (result==0)
            {
                back.setCode("0");
                back.setMessage("系统没有查询到符合条件的数据！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("系统已经查询到符合条件的数据！");
            }
            back.setObj(result);
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("查询异常，异常信息：" +e.getMessage());
            back.setObj(-1);
        }
        return back;
    }

    public KesunReturn findByPage(Map values, int page, int rowsCount) {
        KesunReturn back=new KesunReturn();
        if (values==null || values.size()==0)
        {
            back.setCode("0");
            back.setObj(null);
            back.setMessage("系统没有获得任何的查询条件！");
            return back;
        }
       Page temp=new Page();
        try
        {
            temp.setTotal((Integer)getRowsCount(values).getObj());
            values.put("start",page*rowsCount);
            values.put("limit",rowsCount);
            List<Map<String,Object>> list = getDAO().findByPage(values);
            temp.setPage(page);
            temp.setRowsCount(rowsCount);
            temp.setRows(list);
            back.setMessage("系统查询完毕！");
            back.setObj(temp);
            back.setCode("1");

        }catch (Exception e)
        {
            temp.setPage(page);
            temp.setRowsCount(rowsCount);
            temp.setTotal(0);
            temp.setRows(null);
            back.setMessage("查询出现异常，异常信息："+e.getMessage());
            back.setObj(temp);
            back.setCode("-1");
        }
        return back;
    }


    public KesunReturn add() {
        KesunReturn back=new KesunReturn();
        try {
            int result=(Integer) getDAO().save(model);
            if (result<=0)
            {
                back.setCode("0");
                back.setMessage("抱歉，您的数据保存失败！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("您的数据已经成功提交！");
            }
            back.setObj(result);
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("数据保存出现异常，异常信息："+e.getMessage());
            back.setObj(-1);
        }
        return back;
    }

    public KesunReturn batchAdd(List items) {
        KesunReturn back=new KesunReturn();
        if (items==null || items.size()==0)
        {
            back.setCode("0");
            back.setMessage("抱歉，您提供的数据为空，无法进行数据批量操作！");
            back.setObj(0);
            return back;
        }
        try {
            int result=(Integer) getDAO().batchSave(items);
            if (result<=0)
            {
                back.setCode("0");
                back.setMessage("抱歉，系统没有处理您的提交的全部数据，原因是部分数据不符合要求，请核实！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("您的数据已经批量成功提交！");
            }
            back.setObj(result);
        } catch (Exception e) {
            e.printStackTrace();
            back.setCode("-1");
            back.setMessage("数据批量保存出现异常，异常信息："+e.getMessage());
            back.setObj(-1);
        }
        return back;
    }
    /*获取批量保存的对象*/
    public abstract List getSaveAll(List<Row> source, User worker);
    /*获取导出Excel模板的名称*/
    public abstract String getLoadoutExcelTemplateName();
    /*导出Excel表格数据*/
    public  Workbook  loadoutExcel(Map<String,Object> cons)
    {
        List<Map<String,Object>> lCols=getLoadoutExcelColumns(getLoadoutExcelTemplateName());//获取导出的数据
        if (lCols==null || lCols.size()==0) return null;
        Object obj=findForMap(cons).getObj();
        List<Map<String,Object>> lResult=obj==null?null:(List<Map<String,Object>>)obj;//查找数据
        if(lResult==null || lResult.size()==0) return null;

        Workbook wb=new HSSFWorkbook();//创建工作薄
        Sheet sheet=wb.createSheet();//创建工作表格
        /*写入表头*/
        Row header=sheet.createRow(0);//创建表头
        for(int i=0;i<=lCols.size();i++)
            header.createCell(i);
        sheet.addMergedRegion(new CellRangeAddress(0,0, 0, lCols.size()));
        header.getCell(0).setCellValue(getLoadoutExcelFileName());//写入导出标题信息

        /*写入列数据*/
        Row cols=sheet.createRow(1);//创建表的所有列
        Cell temp=cols.createCell(0);//创建序号列
        temp.setCellValue("序号");
        sheet.setColumnWidth(0,60*35);
        for(int i=0;i<lCols.size();i++)
        {
             temp=cols.createCell(i+1);
             temp.setCellValue(lCols.get(i).get("colCHN").toString());
             sheet.setColumnWidth(i,Integer.parseInt(lCols.get(i).get("width").toString())*35);
        }
        /*写入数据*/
        for(int i=0;i<lResult.size();i++)
        {
            Row tempRow=sheet.createRow(i+2);//创建数据行
            tempRow.createCell(0);//创建序号列
            tempRow.getCell(0).setCellValue(i+1);//写入序号
            for(int j=0;j<lCols.size();j++)
            {
                temp=tempRow.createCell(j+1);
                Object tempObj=lResult.get(i).get(lCols.get(j).get("col").toString());
                temp.setCellValue(tempObj==null?"":tempObj.toString());
            }
        }
        return wb;

    }
    /*从指定的resources的loadoutTemplate路径中*/
    public List<Map<String,Object>> getLoadoutExcelColumns(String fileName){
        util.XMLFile file=new util.XMLFile(PathUtil.getClassResources()+"/loadoutTemplate/"+fileName);
        try
        {
            NodeList nodeList=file.getNodes("col");//获取列数据
            if (nodeList==null || nodeList.getLength()==0) return null;
            List<Map<String,Object>> lCols=new ArrayList<Map<String, Object>>();
            for(int i=0;i<nodeList.getLength();i++)
            {
                Map<String,Object> col=new HashMap<String, Object>();
                if (nodeList.item(i).getAttributes().getNamedItem("columnName").getNodeValue().trim().equals("")) continue;
                col.put("col",nodeList.item(i).getAttributes().getNamedItem("columnName").getNodeValue());
                col.put("colCHN",nodeList.item(i).getTextContent());
                col.put("width",nodeList.item(i).getAttributes().getNamedItem("width").getNodeValue());
                lCols.add(col);
            }
            return lCols;
        }catch (Exception ex)
        {
            return null;
        }

    }
    /*获取Excel所有的数据行*/
    private List<Row> getExcelRows(String filePath)
    {
        File file=new File(filePath);
        if (file.exists()==false) return  null;
        ExcelUtil excel=new ExcelUtil();
        try {
            return excel.readExcel(file.getPath());//读取Excel内容

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }
    /**
     * 批量新增
     * @return 受影响的行数
     */
    public KesunReturn loadinData(String filePath,User worker) {
        KesunReturn back=new KesunReturn();
        List<Row> datasource=getExcelRows(filePath);
        List objs=getSaveAll(datasource,worker);
        if (objs==null || objs.size()==0) //没有获取到符合条件数据
        {
            back.setObj(0);
            back.setMessage("抱歉，系统没有获取到符合条件的数据！");
            back.setCode("0");
            return back;
        }
        try
        {
            int result=getDAO().batchSave(objs);
            back.setObj(result);
            if (result<=0)
            {
                back.setCode("0");
                back.setMessage("抱歉，数据批量保存失败！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("数据批量保存成功！");
            }
            return back;
        }catch (Exception ex)
        {
            ex.printStackTrace();
            back.setObj(-1);
            back.setMessage("系统批量保存失败，错误信息："+ex.getMessage());
            back.setCode("-1");
            return back;
        }
    }

    public Object getMe(){
        try {
            return  getDAO().getMe(model.getId());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    //批量更新
    public KesunReturn editAll(List objs){
        KesunReturn back=new KesunReturn();
        try {
            int result= getDAO().batchUpdate(objs);
            if (result<=0)
            {
                back.setCode("0");
                back.setMessage("数据批量修改操作失败！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("数据批量更新成功！");
            }
            back.setObj(result);
        } catch (Exception e) {
            e.printStackTrace();
            back.setObj(-1);
            back.setMessage("批量更新失败，出现异常信息："+e.getMessage());
            back.setCode("-1");
        }
        return back;
    }

    //批量删除的方法
    public KesunReturn deleteAll(List ids){
        KesunReturn back=new KesunReturn();
        int result = 0;
        try {
            result = (Integer) getDAO().batchDelete(ids);
            if (result<=0)
            {
                back.setCode("0");
                back.setMessage("数据批量删除操作失败！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("数据批量删除成功！");
            }
            back.setObj(result);
        } catch (Exception e) {
            e.printStackTrace();
            back.setObj(-1);
            back.setMessage("批量删除失败，出现异常信息："+e.getMessage());
            back.setCode("-1");
        }
        return back;
    }


    /*
    多个id数组转集合的方法
     */
    public List<String> getList(String ids){
        List<String> list = new ArrayList<String>();
        String[] str = ids.split(",");
        for (int i = 0; i < str.length; i++) {
            list.add(str[i]);
        }
        return list;
    }

    public KesunReturn edit() {
        KesunReturn back=new KesunReturn();
        int result = 0;
        try {
            result = (Integer) getDAO().update(model);
            if (result<=0)
            {
                back.setCode("0");
                back.setMessage("数据修改操作失败！");
            }
            else
            {
                back.setCode("1");
                back.setMessage("数据修改成功！");
            }
            back.setObj(result);
        } catch (Exception e) {
            e.printStackTrace();
            back.setObj(-1);
            back.setMessage("修改失败，出现异常信息："+e.getMessage());
            back.setCode("-1");
        }
        return back;
    }

    /*
    物理分页方法，调用当前类的findAll方法
    @param：pageNum 页码数
    @param：pageSize 每页数据条目数
     */
    public PageInfo<Object> find(int pageNum, int pageSize,Map values) {
        PageHelper.startPage(pageNum,pageSize);//开始分页
        KesunReturn obj=this.find(values);
        if (obj==null) return null;
        List list =(List) obj.getObj() ;
        PageInfo<Object> pageInfo = new PageInfo<Object>(list);
        return pageInfo;
    }

    public KesunReturn changeStatus() {

        KesunReturn result = new KesunReturn();
        try {
            int temp=(Integer) getDAO().changeStatus(model);
            result.setCode(String.valueOf(temp));
            if (temp>0)
              result.setMessage("状态变更成功！");
            else
                result.setMessage("状态变更失败！");
            result.setObj(temp);

        } catch (Exception e) {
            result.setCode("-1");
            result.setMessage("系统出现异常："+e.getMessage());
            result.setObj(null);
        }
        return result;
    }
}
