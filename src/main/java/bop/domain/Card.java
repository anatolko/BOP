package bop.domain;


import bop.domain.user.User;
import bop.domain.user.UserDepartment;
import bop.domain.user.UserGroup;
import bop.domain.usertypes.JsonMapType;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;


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
    @ManyToOne
    @JoinColumn(name="user_id")
    private User user;

    @NotNull
    @ManyToOne
    @JoinColumn(name="user_department_id")
    private UserDepartment userDepartment;

    @NotNull
    @ManyToOne
    @JoinColumn(name="obs_department_id")
    private ObsDepartment obsDepartment;

    @NotNull
    @ManyToOne
    @JoinColumn(name="plant_id",referencedColumnName = "id")
    private Plant plant;

    @NotNull
    @Column(name = "selected_categories")
    @Type(type = "UserJsonObject")
    private Map<String,ArrayList<Integer>> selectedCategories = new HashMap<>();


    @Column(name = "selected_fields")
    @Type(type = "UserJsonObject")
    private Map<String,ArrayList<Integer>> selectedFields = new HashMap<>();

    @Size(max=512)
    @Column(name = "comment")
    private String comment;

    @NotNull
    @ManyToOne
    @JoinColumn(name="user_group_id")
    private UserGroup userGroup;


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

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public UserDepartment getUserDepartment() {
        return userDepartment;
    }

    public void setUserDepartment(UserDepartment userDepartment) {
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
