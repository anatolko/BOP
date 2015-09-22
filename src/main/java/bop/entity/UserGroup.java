package bop.entity;


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
    private Plant plant;

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

    public Plant getPlant() {
        return plant;
    }

    public void setPlant(Plant plant) {
        this.plant = plant;
    }
}
