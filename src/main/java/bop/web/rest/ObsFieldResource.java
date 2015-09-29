package bop.web.rest;

import bop.domain.ObsField;
import bop.repository.ObsFieldRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * Created by Stretch on 18.09.2015.
 */
@RestController
@RequestMapping("/obs-fields")
public class ObsFieldResource {
    @Autowired
    private ObsFieldRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public Iterable findObsFields() {
        return repo.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ObsField findFieldById(@PathVariable("id") Integer id) {
        return repo.findOne(id);
    }

    @RequestMapping(method = RequestMethod.POST)
    public ObsField addObsField(@RequestBody ObsField obsField) {
        return repo.save(obsField);
    }

    @RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
    public ObsField updateObsField(@RequestBody ObsField updatedObsField, @PathVariable Integer id) {
        updatedObsField.setId(id);
        return repo.save(updatedObsField);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteObsField(@PathVariable Integer id) {
        repo.delete(id);
    }
}
