package jlu.maplebbs.entity;

/**
 * 主题帖
 * @author hwxy
 */
public class Topic {
    private Integer id;  //主键

    private Integer fromForum;  //是哪个论坛的帖子

    private String title;  //帖子标题

    private Integer clickNum;  //点击量

    private Integer nextCommentFloorIndex;  //这个帖子的下一个回复是哪一层

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFromForum() {
        return fromForum;
    }

    public void setFromForum(Integer fromForum) {
        this.fromForum = fromForum;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getClickNum() {
        return clickNum;
    }

    public void setClickNum(Integer clickNum) {
        this.clickNum = clickNum;
    }

    public Integer getNextCommentFloorIndex() {
        return nextCommentFloorIndex;
    }

    public void setNextCommentFloorIndex(Integer nextCommentFloorIndex) {
        this.nextCommentFloorIndex = nextCommentFloorIndex;
    }
}