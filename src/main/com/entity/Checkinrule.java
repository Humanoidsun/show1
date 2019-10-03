package entity;

import kesun.entity.AbsSuperObject;

import java.util.Date;

public class Checkinrule extends AbsSuperObject {

    private Date amonbegintime;

    private Date amonendtime;

    private Date amoffbegintime;

    private Date amoffendtime;

    private Date pmonbegintime;

    private Date pmonendtime;

    private Date pmoffbegintime;

    private Date pmoffendtime;

    private String checkinsite;

    private Integer abnnumtowarn;

    public Date getAmonbegintime() {
        return amonbegintime;
    }

    public void setAmonbegintime(Date amonbegintime) {
        this.amonbegintime = amonbegintime;
    }

    public Date getAmonendtime() {
        return amonendtime;
    }

    public void setAmonendtime(Date amonendtime) {
        this.amonendtime = amonendtime;
    }

    public Date getAmoffbegintime() {
        return amoffbegintime;
    }

    public void setAmoffbegintime(Date amoffbegintime) {
        this.amoffbegintime = amoffbegintime;
    }

    public Date getAmoffendtime() {
        return amoffendtime;
    }

    public void setAmoffendtime(Date amoffendtime) {
        this.amoffendtime = amoffendtime;
    }

    public Date getPmonbegintime() {
        return pmonbegintime;
    }

    public void setPmonbegintime(Date pmonbegintime) {
        this.pmonbegintime = pmonbegintime;
    }

    public Date getPmonendtime() {
        return pmonendtime;
    }

    public void setPmonendtime(Date pmonendtime) {
        this.pmonendtime = pmonendtime;
    }

    public Date getPmoffbegintime() {
        return pmoffbegintime;
    }

    public void setPmoffbegintime(Date pmoffbegintime) {
        this.pmoffbegintime = pmoffbegintime;
    }

    public Date getPmoffendtime() {
        return pmoffendtime;
    }

    public void setPmoffendtime(Date pmoffendtime) {
        this.pmoffendtime = pmoffendtime;
    }

    public String getCheckinsite() {
        return checkinsite;
    }

    public void setCheckinsite(String checkinsite) {
        this.checkinsite = checkinsite == null ? null : checkinsite.trim();
    }

    public Integer getAbnnumtowarn() {
        return abnnumtowarn;
    }

    public void setAbnnumtowarn(Integer abnnumtowarn) {
        this.abnnumtowarn = abnnumtowarn;
    }

    @Override
    public String toString() {
        return "Checkinrule{" +
                "amonbegintime=" + amonbegintime +
                ", amonendtime=" + amonendtime +
                ", amoffbegintime=" + amoffbegintime +
                ", amoffendtime=" + amoffendtime +
                ", pmonbegintime=" + pmonbegintime +
                ", pmonendtime=" + pmonendtime +
                ", pmoffbegintime=" + pmoffbegintime +
                ", pmoffendtime=" + pmoffendtime +
                ", checkinsite='" + checkinsite + '\'' +
                ", abnnumtowarn=" + abnnumtowarn +
                '}';
    }
}