package bop.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Stretch on 19.05.2015.
 */
public class Card implements Serializable {
    private static final long serialVersionUID = 5402151523535598251L;

    private int id;
    private Date date;
    private Date fillDate;
    private String userName;
    private String displayedName;
    private String userGroup;
    private String userDepartment;
    private int obsDepartmentId;
    private int plantId;
    private String selectedFields;
    private String comment;

    public Card(int id, Date date, Date fillDate, String userName, String displayedName, String userGroup, String userDepartment, int obsDepartmentId, int plantId, String selectedFields, String comment) {
        this.id = id;
        this.date = date;
        this.fillDate = fillDate;
        this.userName = userName;
        this.displayedName = displayedName;
        this.userGroup = userGroup;
        this.userDepartment = userDepartment;
        this.obsDepartmentId = obsDepartmentId;
        this.plantId = plantId;
        this.selectedFields = selectedFields;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getFillDate() {
        return fillDate;
    }

    public void setFillDate(Date fillDate) {
        this.fillDate = fillDate;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDisplayedName() {
        return displayedName;
    }

    public void setDisplayedName(String displayedName) {
        this.displayedName = displayedName;
    }

    public String getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(String userGroup) {
        this.userGroup = userGroup;
    }

    public String getUserDepartment() {
        return userDepartment;
    }

    public void setUserDepartment(String userDepartment) {
        this.userDepartment = userDepartment;
    }

    public int getObsDepartmentId() {
        return obsDepartmentId;
    }

    public void setObsDepartmentId(int obsDepartmentId) {
        this.obsDepartmentId = obsDepartmentId;
    }

    public int getPlantId() {
        return plantId;
    }

    public void setPlantId(int plantId) {
        this.plantId = plantId;
    }

    public String getSelectedFields() {
        return selectedFields;
    }

    public void setSelectedFields(String selectedFields) {
        this.selectedFields = selectedFields;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
