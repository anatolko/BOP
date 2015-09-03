package bop.entity;


import bop.usertypes.JsonMapType;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;
import org.springframework.data.rest.core.annotation.RestResource;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;

/**
 * Created by Stretch on 19.05.2015.
 */
@Entity
@Table(name = "cards")
@TypeDefs({ @TypeDef(name = "UserJsonObject", typeClass = JsonMapType.class) })
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
    @RestResource(rel = "card_obs_department")
    private ObsDepartment obsDepartment;

    @NotNull
    @ManyToOne
    @JoinColumn(name="plant_id")
    @RestResource(rel = "card_plant")
    private Plant plant;

    @NotNull
    @Column(name = "selected_categories")
    @Type(type = "UserJsonObject")
    private Map<String,ArrayList<Integer>> selectedCategories = new HashMap<>();


    @Column(name = "selected_fields")
    @Type(type = "UserJsonObject")
    private Map<String,ArrayList<Integer>> selectedFields = new HashMap<>();

    @Column(name = "comment")
    private String comment;

    @ManyToOne
    @JoinColumn(name="user_group_id")
    @RestResource(rel = "card_user_group")
    private UserGroup userGroup;

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

    public ObsDepartment getObsDepartment() {
        return obsDepartment;
    }

    public void setObsDepartment(ObsDepartment obsDepartment) {
        this.obsDepartment = obsDepartment;
    }

    public Plant getPlant() {
        return plant;
    }

    public void setPlant(Plant plant) {
        this.plant = plant;
    }

    public Map<String, ArrayList<Integer>> getSelectedCategories() {
        return selectedCategories;
    }

    public void setSelectedCategories(String selectedCategories) {
        Map<String, ArrayList<Integer>> tmpMap = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        try {
            tmpMap =  mapper.readValue(selectedCategories, new TypeReference<HashMap<String,ArrayList<Integer>>>(){});
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

        this.selectedCategories = tmpMap;
    }

    public Map<String, ArrayList<Integer>> getSelectedFields() {
        return selectedFields;
    }

    public void setSelectedFields(String selectedFields) {
        Map<String, ArrayList<Integer>> tmpMap = new HashMap<>();
        ObjectMapper mapper = new ObjectMapper();
        try {
            tmpMap =  mapper.readValue(selectedFields, new TypeReference<HashMap<String,ArrayList<Integer>>>(){});
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }


        this.selectedFields = tmpMap;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public UserGroup getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(UserGroup userGroup) {
        this.userGroup = userGroup;
    }
}
