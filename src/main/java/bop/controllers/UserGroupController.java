package bop.controllers;


import bop.entity.UserGroup;
import bop.repositories.UserGroupRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/user-groups")
public class UserGroupController {
    @Autowired
    private UserGroupRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public Iterable findUserGroups() {
        return repo.findAll();
    }

    @RequestMapping(method = RequestMethod.POST)
    public UserGroup addUserGroup(@RequestBody UserGroup userGroup) {
        return repo.save(userGroup);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public UserGroup updateUserGroup(@RequestBody UserGroup updatedUserGroup, @PathVariable Integer id) {
        updatedUserGroup.setId(id);
        return repo.save(updatedUserGroup);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteUserGroup(@PathVariable Integer id) {
        repo.delete(id);
    }
}
