package jlu.maplebbs.entity;


/**
 * 头像
 * @author hwxy
 */
public class UserPicture {
    private Integer id;  //主键

    private String address;  //存储路径

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}