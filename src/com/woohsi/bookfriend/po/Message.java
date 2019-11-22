package com.woohsi.bookfriend.po;

public class Message {
    private int mid;
    private int from;
    private int to;
    private String content;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getFrom() {
        return from;
    }

    public void setFrom(int from) {
        this.from = from;
    }

    public int getTo() {
        return to;
    }

    public void setTo(int to) {
        this.to = to;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Message{" +
                "mid=" + mid +
                ", from=" + from +
                ", to=" + to +
                ", content='" + content + '\'' +
                '}';
    }
}
