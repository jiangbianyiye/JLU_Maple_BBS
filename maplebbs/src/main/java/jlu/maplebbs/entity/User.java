package jlu.maplebbs.entity;


import java.time.LocalDateTime;

/**
 * 用户
 * @author hwxy
 */
public class User {
    private Integer id;  //主键

    private String nickname;  //昵称

    private String password;  //密码:MD5加密

    private Integer rank;  //普通用户还是管理员

    private String email;  //邮箱

    private String signature;  //签名

    private LocalDateTime lastLogin;  //最后登陆时间

    private Integer userPictureId;  //头像
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRank()
    {
        return rank;
    }

    public void setRank(Integer rank)
    {
        this.rank = rank;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public LocalDateTime getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(LocalDateTime lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Integer getUserPictureId() {
        return userPictureId;
    }

    public void setUserPictureId(Integer userPictureId) {
        this.userPictureId = userPictureId;
    }
}