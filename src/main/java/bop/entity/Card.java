package bop.entity;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.rest.core.annotation.RestResource;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;

/**
 * Created by Stretch on 19.05.2015.
 */
@Entity
@Table(name = "cards")
public class Card implements Serializable {

    private static final long serialVersionUID = 5402151523535598251L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @NotNull
    @Column(name = "card_date")
    private Date cardDate;

    @NotNull
    @Column(name = "obs_date")
    private Date obsDate;

    @NotNull
    @Column(name = "ad_account")
    private String adAccount;

    @NotNull
    @Column(name = "user_department")
    private String userDepartment;

    @NotNull
    @ManyToOne
    @JoinColumn(name="obs_department_id")
    private ObsDepartment obsDepartmentId;

    @NotNull
    @ManyToOne
    @JoinColumn(name="plant_id")
    @RestResource(rel = "card_plant_id")
    private Plant plantId;

    @NotNull
    @Column(name = "selected_fields")
    private String selectedFields;

    @Column(name = "comment")
    private String comment;

    @ManyToOne
    @JoinColumn(name="user_group_id")
    private UserGroup userGroupId;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getCardDate() {
        return cardDate;
    }

    public void setCardDate(Date cardDate) {
        this.cardDate = cardDate;
    }

    public Date getObsDate() {
        return obsDate;
    }

    public void setObsDate(Date obsDate) {
        this.obsDate = obsDate;
    }

    public String getAdAccount() {
        return adAccount;
    }

    public void setAdAccount(String adAccount) {
        this.adAccount = adAccount;
    }

    public String getUserDepartment() {
        return userDepartment;
    }

    public void setUserDepartment(String userDepartment) {
        this.userDepartment = userDepartment;
    }

    public ObsDepartment getObsDepartmentId() {
        return obsDepartmentId;
    }

    public void setObsDepartmentId(ObsDepartment obsDepartmentId) {
        this.obsDepartmentId = obsDepartmentId;
    }

    public Plant getPlantId() {
        return plantId;
    }

    public void setPlantId(Plant plantId) {
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

    public UserGroup getUserGroupId() {
        return userGroupId;
    }

    public void setUserGroupId(UserGroup userGroupId) {
        this.userGroupId = userGroupId;
    }
}
