package bop.domain;

import com.fasterxml.jackson.annotation.*;


import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@JsonIgnoreProperties({"parentPlantId"})
@Entity
@Table(name = "plants")
public class Plant implements Serializable {

    private static final long serialVersionUID = 5402151523535598251L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @NotNull
    @Column(name = "plant_code")
    private String plantCode;

    @Column(name = "description")
    private String description;

    @ManyToOne
    @JoinColumn(name="parent_plant_id")
    private Plant parentPlant;

    @OneToMany(mappedBy="parentPlant")
    private Set<Plant> childPlants = new HashSet<>();


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPlantCode() {
        return plantCode;
    }

    public void setPlantCode(String plantCode) {
        this.plantCode = plantCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public Plant getParentPlant() {
        return parentPlant;
    }

    public void setParentPlant(Plant parentPlantId) {
        this.parentPlant = parentPlantId;
    }
}
