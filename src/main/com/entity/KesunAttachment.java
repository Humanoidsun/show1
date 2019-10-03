package entity;

import kesun.entity.AbsBusinessObject;

import java.util.List;

/**
 * 文件上传附件
 * Created by wph-pc on 2018/8/19.
 */
public class KesunAttachment extends AbsBusinessObject {
    private String type="";//附件类型
    private long size=0;//附件大小
    private String address="";//附件存放地址
    private String logoAddress="";//附件图标地址
    private Boolean canDownload=false;//是否允许下载
    private Boolean canShare=false;//是否允许共享
    private Boolean canRead=false;//是否允许查看
    private long downloadCount=0;//下载次数
    private long readCount=0;//阅读次数
    private long shareCount=0;//共享次数


    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public long getSize() {
        return size;
    }

    public void setSize(long size) {
        this.size = size;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogoAddress() {
        return logoAddress;
    }

    public void setLogoAddress(String logoAddress) {
        this.logoAddress = logoAddress;
    }

    public Boolean getCanDownload() {
        return canDownload;
    }

    public void setCanDownload(Boolean canDownload) {
        this.canDownload = canDownload;
    }

    public Boolean getCanShare() {
        return canShare;
    }

    public void setCanShare(Boolean canShare) {
        this.canShare = canShare;
    }

    public Boolean getCanRead() {
        return canRead;
    }

    public void setCanRead(Boolean canRead) {
        this.canRead = canRead;
    }

    public long getDownloadCount() {
        return downloadCount;
    }

    public void setDownloadCount(long downloadCount) {
        this.downloadCount = downloadCount;
    }

    public long getReadCount() {
        return readCount;
    }

    public void setReadCount(long readCount) {
        this.readCount = readCount;
    }

    public long getShareCount() {
        return shareCount;
    }

    public void setShareCount(long shareCount) {
        this.shareCount = shareCount;
    }

}
