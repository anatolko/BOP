package bop.controllers;

import bop.entity.ObsCategory;
import bop.repositories.ObsCategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


/**
 * Created by Stretch on 18.09.2015.
 */
@RestController
@RequestMapping("/obs-categories")
public class ObsCategoryController {
    @Autowired
    private ObsCategoryRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public Iterable findObsCategories() {
        return repo.findAll();
    }
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ObsCategory findCardById(@PathVariable("id") Integer id) {
        return repo.findOne(id);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ObsCategory addObsCategory(@RequestBody ObsCategory obsCategory) {
        return repo.save(obsCategory);
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
    public ObsCategory updateObsCategory(@RequestBody ObsCategory updatedObsCategory, @PathVariable Integer id) {
        updatedObsCategory.setId(id);
        return repo.save(updatedObsCategory);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteObsCategory(@PathVariable Integer id) {
        repo.delete(id);
    }
}
