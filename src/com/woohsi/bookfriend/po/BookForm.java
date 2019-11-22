package com.woohsi.bookfriend.po;

import org.springframework.web.multipart.MultipartFile;

public class BookForm {
    private Integer bkid;//书籍id
    private String bkname;//书籍名称
    private Double bkprice;//书籍价格
    private String bkpress;//书籍出版社
    private String bkdescription;//书籍描述
    private Integer status;//书籍售卖状态 1:已售出 0:未售出
    private Integer uid;//卖家id
    private MultipartFile bkimg;

    public Integer getBkid() {
        return bkid;
    }

    public void setBkid(Integer bkid) {
        this.bkid = bkid;
    }

    public String getBkname() {
        return bkname;
    }

    public void setBkname(String bkname) {
        this.bkname = bkname;
    }

    public Double getBkprice() {
        return bkprice;
    }

    public void setBkprice(Double bkprice) {
        this.bkprice = bkprice;
    }

    public String getBkpress() {
        return bkpress;
    }

    public void setBkpress(String bkpress) {
        this.bkpress = bkpress;
    }

    public String getBkdescription() {
        return bkdescription;
    }

    public void setBkdescription(String bkdescription) {
        this.bkdescription = bkdescription;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public MultipartFile getBkimg() {
        return bkimg;
    }

    public void setBkimg(MultipartFile bkimg) {
        this.bkimg = bkimg;
    }
}
