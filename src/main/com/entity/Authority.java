package entity;

import kesun.entity.AbsSuperObject;

public class Authority extends AbsSuperObject {

    private String userid;

    private String username;

    private String staffmgay;

    private String attstaay;

    private String chesetay;

    private String comsetay;

    private String depmgay;

    private String notsenday;

    private String attsetay;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public String getStaffmgay() {
        return staffmgay;
    }

    public void setStaffmgay(String staffmgay) {
        this.staffmgay = staffmgay;
    }

    public String getAttstaay() {
        return attstaay;
    }

    public void setAttstaay(String attstaay) {
        this.attstaay = attstaay;
    }

    public String getChesetay() {
        return chesetay;
    }

    public void setChesetay(String chesetay) {
        this.chesetay = chesetay;
    }

    public String getComsetay() {
        return comsetay;
    }

    public void setComsetay(String comsetay) {
        this.comsetay = comsetay;
    }

    public String getDepmgay() {
        return depmgay;
    }

    public void setDepmgay(String depmgay) {
        this.depmgay = depmgay;
    }

    public String getNotsenday() {
        return notsenday;
    }

    public void setNotsenday(String notsenday) {
        this.notsenday = notsenday;
    }

    public String getAttsetay() {
        return attsetay;
    }

    public void setAttsetay(String attsetay) {
        this.attsetay = attsetay;
    }

    @Override
    public String toString() {
        return "Authority{" +
                "userid='" + userid + '\'' +
                ", username='" + username + '\'' +
                ", staffmgay='" + staffmgay + '\'' +
                ", attstaay='" + attstaay + '\'' +
                ", chesetay='" + chesetay + '\'' +
                ", comsetay='" + comsetay + '\'' +
                ", depmgay='" + depmgay + '\'' +
                ", notsenday='" + notsenday + '\'' +
                ", attsetay='" + attsetay + '\'' +
                '}';
    }
}