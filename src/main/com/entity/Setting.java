package entity;

import kesun.entity.AbsBusinessObject;

public class Setting extends AbsBusinessObject {
    private String id;

    private String userid;

    private Integer advanceminute;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid == null ? null : userid.trim();
    }

    public Integer getAdvanceminute() {
        return advanceminute;
    }

    public void setAdvanceminute(Integer advanceminute) {
        this.advanceminute = advanceminute;
    }

    @Override
    public String toString() {
        return "Setting{" +
                "id='" + id + '\'' +
                ", userid='" + userid + '\'' +
                ", advanceminute=" + advanceminute +
                '}';
    }
}