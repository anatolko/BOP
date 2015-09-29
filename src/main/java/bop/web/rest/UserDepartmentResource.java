package bop.web.rest;


import bop.domain.UserDepartment;
import bop.repository.UserDepartmentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/user-departments")
public class UserDepartmentResource {
    @Autowired
    private UserDepartmentRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public Iterable findUserDepartments() {
        return repo.findAll();
    }

    @RequestMapping(method = RequestMethod.POST)
    public UserDepartment addUserDepartment(@RequestBody UserDepartment userDepartment) {
        return repo.save(userDepartment);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public UserDepartment updateUserDepartment(@RequestBody UserDepartment updatedUserDepartment, @PathVariable Integer id) {
        updatedUserDepartment.setId(id);
        return repo.save(updatedUserDepartment);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteUserDepartment(@PathVariable Integer id) {
        repo.delete(id);
    }
}
