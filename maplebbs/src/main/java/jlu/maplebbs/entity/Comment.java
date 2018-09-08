package jlu.maplebbs.entity;

import java.time.LocalDateTime;

/**
 * 回复(楼层)
 * @author hwxy
 */
public class Comment {
    private Integer id;  //主键

    private Integer fromTopic;  //来自哪个主题(帖子)

    private Integer floorIndex;  //这个回复的楼层号:1楼，2楼...

    private Integer author;  //这个回复的作者

    private String msg;  //回复的内容

    private LocalDateTime createLocalDateTime;  //发表时间

    private LocalDateTime lastEdit;  //修改时间

    private Integer replyId;  //回复的那个楼层的id:回复2楼则这个值是2

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFromTopic() {
        return fromTopic;
    }

    public void setFromTopic(Integer fromTopic) {
        this.fromTopic = fromTopic;
    }

    public Integer getFloorIndex() {
        return floorIndex;
    }

    public void setFloorIndex(Integer floorIndex) {
        this.floorIndex = floorIndex;
    }

    public Integer getAuthor() {
        return author;
    }

    public void setAuthor(Integer author) {
        this.author = author;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public LocalDateTime getCreateLocalDateTime() {
        return createLocalDateTime;
    }

    public void setCreateLocalDateTime(LocalDateTime createLocalDateTime) {
        this.createLocalDateTime = createLocalDateTime;
    }

    public LocalDateTime getLastEdit() {
        return lastEdit;
    }

    public void setLastEdit(LocalDateTime lastEdit) {
        this.lastEdit = lastEdit;
    }

    public Integer getReplyId() {
        return replyId;
    }

    public void setReplyId(Integer replyId) {
        this.replyId = replyId;
    }
}