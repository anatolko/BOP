package bop.domain;



import bop.domain.usertypes.JsonMapType;
import org.hibernate.annotations.Type;
import org.hibernate.annotations.TypeDef;
import org.hibernate.annotations.TypeDefs;


import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;


@Entity
@Table(name = "obs_departments")
@TypeDefs({ @TypeDef(name = "UserJsonObject", typeClass = JsonMapType.class) })
public class ObsDepartment implements Serializable {

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
}
