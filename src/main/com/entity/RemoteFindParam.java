package entity;

import java.util.Map;

/**
 * 远程调用参数实体类型
 * Created by wph-pc on 2018/6/5.
 */
public class RemoteFindParam {
    private String credit="";//凭证号
    private Map<String,Object> params=null;//查询参数
    private int pageNumber=-1;//页码
    private int rowsCount=10;//每页显示行数

    public String getCredit() {
        return credit;
    }

    public void setCredit(String credit) {
        this.credit = credit;
    }

    public Map<String, Object> getParams() {
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getRowsCount() {
        return rowsCount;
    }

    public void setRowsCount(int rowsCount) {
        this.rowsCount = rowsCount;
    }
}
