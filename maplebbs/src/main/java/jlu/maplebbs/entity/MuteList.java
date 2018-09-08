package jlu.maplebbs.entity;


import java.time.LocalDateTime;

/**
 * 禁言列表
 * @author hwxy
 */
public class MuteList {
    private LocalDateTime muteUntil;  //禁言结束时间

    private Integer userId;  //被禁言的用户id

    private Integer forumId;  //被禁言的论坛:不能在这个论坛再发言

    private LocalDateTime muteFrom;  //开始禁言时间

    public LocalDateTime getMuteUntil() {
        return muteUntil;
    }

    public void setMuteUntil(LocalDateTime muteUntil) {
        this.muteUntil = muteUntil;
    }

    public Integer getUserId()
    {
        return userId;
    }

    public void setUserId(Integer userId)
    {
        this.userId = userId;
    }

    public Integer getForumId()
    {
        return forumId;
    }

    public void setForumId(Integer forumId)
    {
        this.forumId = forumId;
    }

    public LocalDateTime getMuteFrom()
    {
        return muteFrom;
    }

    public void setMuteFrom(LocalDateTime muteFrom)
    {
        this.muteFrom = muteFrom;
    }
}