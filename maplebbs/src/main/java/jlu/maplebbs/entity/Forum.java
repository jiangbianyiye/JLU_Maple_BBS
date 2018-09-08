package jlu.maplebbs.entity;


/**
 * 论坛(板块)
 * @author hwxy
 */
public class Forum {
    private Integer id;  //主键

    private Integer fatherId;  //父论坛:Steam论坛的父论坛单机游戏论坛

    private String name;  //论坛名

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFatherId() {
        return fatherId;
    }

    public void setFatherId(Integer fatherId) {
        this.fatherId = fatherId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}