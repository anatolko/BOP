package bop.entity;

import bop.usertypes.JsonMapType;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;
import org.springframework.data.rest.core.annotation.RestResource;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Stretch on 13.08.2015.
 */

@Entity
@Table(name = "obs_fields")
@TypeDefs({ @TypeDef(name = "UserJsonObject", typeClass = JsonMapType.class) })
public class ObsField implements Serializable {
    private static final long serialVersionUID = 5402151523535598251L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;


    @NotNull
    @Column(name = "name")
    @Type(type = "UserJsonObject")
    private Map<String,String> name = new HashMap<>();


    @Column(name = "description")
    @Type(type = "UserJsonObject")
    private Map<String,String> description = new HashMap<>();

    @NotNull
    @ManyToOne
    @JoinColumn(name="cat_id")
    @RestResource(rel = "field_cat_id")
    private ObsCategory catId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Map<String, String> getName() {
        return name;
    }

    public void setName(Map<String, String> name) {
        this.name = name;
    }

    public Map<String, String> getDescription() {
        return description;
    }

    public void setDescription(Map<String, String> description) {
        this.description = description;
    }

    public ObsCategory getCatId() {
        return catId;
    }

    public void setCatId(ObsCategory catId) {
        this.catId = catId;
    }
}
