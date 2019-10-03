package entity;

import kesun.entity.AbsSuperObject;

public class Company extends AbsSuperObject {
    private String id;

    private Integer bossid;

    private String comname;

    private String comlogo;

    private String comphone;

    private Integer comsize;

    private String comsell;

    private String comaddress;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Integer getBossid() {
        return bossid;
    }

    public void setBossid(Integer bossid) {
        this.bossid = bossid;
    }

    public String getComname() {
        return comname;
    }

    public void setComname(String comname) {
        this.comname = comname == null ? null : comname.trim();
    }

    public String getComlogo() {
        return comlogo;
    }

    public void setComlogo(String comlogo) {
        this.comlogo = comlogo == null ? null : comlogo.trim();
    }

    public String getComphone() {
        return comphone;
    }

    public void setComphone(String comphone) {
        this.comphone = comphone == null ? null : comphone.trim();
    }

    public Integer getComsize() {
        return comsize;
    }

    public void setComsize(Integer comsize) {
        this.comsize = comsize;
    }

    public String getComsell() {
        return comsell;
    }

    public void setComsell(String comsell) {
        this.comsell = comsell == null ? null : comsell.trim();
    }

    public String getComaddress() {
        return comaddress;
    }

    public void setComaddress(String comaddress) {
        this.comaddress = comaddress == null ? null : comaddress.trim();
    }
}