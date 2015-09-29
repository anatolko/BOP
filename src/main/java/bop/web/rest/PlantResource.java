package bop.web.rest;


import bop.domain.Plant;
import bop.repository.PlantRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/plants")
public class PlantResource {
    @Autowired
    private PlantRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public Iterable findPlants() {
        return repo.findAll();
    }

    @RequestMapping(method = RequestMethod.POST)
    public Plant addPlant(@RequestBody Plant plant) {
        return repo.save(plant);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public Plant updatePlant(@RequestBody Plant updatedPlant, @PathVariable Integer id) {
        updatedPlant.setId(id);
        return repo.save(updatedPlant);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deletePlant(@PathVariable Integer id) {
        repo.delete(id);
    }
}
