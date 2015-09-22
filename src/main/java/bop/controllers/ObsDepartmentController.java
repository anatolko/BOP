package bop.controllers;

import bop.entity.ObsDepartment;
import bop.repositories.ObsDepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/obs-departments")
public class ObsDepartmentController {
    @Autowired
    private ObsDepartmentRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public Iterable findObsDepartments() {
        return repo.findAll();
    }

    @RequestMapping(method = RequestMethod.POST)
    public ObsDepartment addObsDepartment(@RequestBody ObsDepartment obsDepartment) {
        return repo.save(obsDepartment);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public ObsDepartment updateObsDepartment(@RequestBody ObsDepartment updatedObsDepartment, @PathVariable Integer id) {
        updatedObsDepartment.setId(id);
        return repo.save(updatedObsDepartment);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteObsCategory(@PathVariable Integer id) {
        repo.delete(id);
    }
}
