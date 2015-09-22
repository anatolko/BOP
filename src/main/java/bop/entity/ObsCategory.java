package bop.entity;

import bop.usertypes.JsonMapType;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


@Entity
@Table(name = "obs_categories")
@TypeDefs({ @TypeDef(name = "UserJsonObject", typeClass = JsonMapType.class) })
public class ObsCategory implements Serializable {
    private static final long serialVersionUID = 5402151523535598251L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;


    @NotNull
    @Column(name = "name")
    @Type(type = "UserJsonObject")
    private Map<String,String> name = new HashMap<>();

    @NotNull
    @ManyToOne
    @JoinColumn(name="plant_id")
    private Plant plantId;

    @JsonManagedReference
    @OneToMany(mappedBy = "catId")
    private Set<ObsField> obsFields;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Map<String,String> getName() {
        return name;
    }

    public void setName(Map<String,String> name) {
        this.name = name;
    }

    public Plant getPlantId() {
        return plantId;
    }

    public void setPlantId(Plant plantId) {
        this.plantId = plantId;
    }

    public Set<ObsField> getObsFields() {
        return obsFields;
    }

    public void setObsFields(Set<ObsField> obsFields) {
        this.obsFields = obsFields;
    }
}
