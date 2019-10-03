package entity;

import kesun.entity.AbsSuperObject;

import java.util.Date;

public class Record extends AbsSuperObject {

    private String type;

    private String amorpm;

    private Date datetime;

    private String userid;

    private String userdepid;

    private String status;

    private String departmentname;

    private String username;

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public String getStatus() {
        return status;
    }

    @Override
    public void setStatus(String status) {
        this.status = status;
    }

    private String remark;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getAmorpm() {
        return amorpm;
    }

    public void setAmorpm(String amorpm) {
        this.amorpm = amorpm;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getUserdepid() {
        return userdepid;
    }

    public void setUserdepid(String userdepid) {
        this.userdepid = userdepid == null ? null : userdepid.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    @Override
    public String toString() {
        return "Record{" +
                "type='" + type + '\'' +
                ", amorpm=" + amorpm +
                ", datetime=" + datetime +
                ", userid='" + userid + '\'' +
                ", userdepid='" + userdepid + '\'' +
                ", status='" + status + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}