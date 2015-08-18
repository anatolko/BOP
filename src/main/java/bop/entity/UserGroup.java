package bop.entity;

import org.springframework.data.rest.core.annotation.RestResource;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

@Entity
@Table(name = "user_groups")
public class UserGroup implements Serializable {

    private static final long serialVersionUID = 5402151523535598251L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @NotNull
    @Column(name = "name")
    private String name;

    @NotNull
    @Column(name = "cards_count")
    private int cardsCount;

    @NotNull
    @ManyToOne
    @JoinColumn(name="plant_id")
    @RestResource(rel = "group_plant_id")
    private Plant plantId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCardsCount() {
        return cardsCount;
    }

    public void setCardsCount(int cardsCount) {
        this.cardsCount = cardsCount;
    }

    public Plant getPlantId() {
        return plantId;
    }

    public void setPlantId(Plant plantId) {
        this.plantId = plantId;
    }
}
