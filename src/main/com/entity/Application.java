package entity;

import kesun.entity.AbsBusinessObject;

import java.util.Date;

public class Application extends AbsBusinessObject {


    private String type;

    private String text;

    private String picture;

    private Date submittime;

    private Date approvaltime;

    private String approvalid;

    private String submitid;

    private String approvalname;

    private String typename;

    private String submitname;

    public String getSubmitname() {
        return submitname;
    }

    public void setSubmitname(String submitname) {
        this.submitname = submitname;
    }

    public String getApprovalname() {
        return approvalname;
    }

    public void setApprovalname(String approvalname) {
        this.approvalname = approvalname;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture == null ? null : picture.trim();
    }

    public Date getSubmittime() {
        return submittime;
    }

    public void setSubmittime(Date submittime) {
        this.submittime = submittime;
    }

    public Date getApprovaltime() {
        return approvaltime;
    }

    public void setApprovaltime(Date approvaltime) {
        this.approvaltime = approvaltime;
    }

    public String getApprovalid() {
        return approvalid;
    }

    public void setApprovalid(String approvalid) {
        this.approvalid = approvalid == null ? null : approvalid.trim();
    }

    public String getSubmitid() {
        return submitid;
    }

    public void setSubmitid(String submitid) {
        this.submitid = submitid == null ? null : submitid.trim();
    }

    @Override
    public String toString() {
        return "Application{" +
                "type='" + type + '\'' +
                ", text='" + text + '\'' +
                ", picture='" + picture + '\'' +
                ", submittime=" + submittime +
                ", approvaltime=" + approvaltime +
                ", approvalid='" + approvalid + '\'' +
                ", submitid='" + submitid + '\'' +
                ", approvalname='" + approvalname + '\'' +
                ", typename='" + typename + '\'' +
                ", submitname='" + submitname + '\'' +
                '}';
    }
}