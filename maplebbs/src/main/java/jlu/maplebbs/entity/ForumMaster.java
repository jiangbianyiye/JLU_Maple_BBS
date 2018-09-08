package jlu.maplebbs.entity;


/**
 * 版主
 * @author hwxy
 */
public class ForumMaster {
    private Integer userId;  //版主id

    private Integer forumId;  //论坛id

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getForumId() {
        return forumId;
    }

    public void setForumId(Integer forumId) {
        this.forumId = forumId;
    }
}