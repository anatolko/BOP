package bop.controllers;


import bop.entity.User;
import bop.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public Iterable findUsers() {
        return repo.findAll();
    }

    @RequestMapping(method = RequestMethod.POST)
    public User addUser(@RequestBody User user) {
        return repo.save(user);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public User updateUser(@RequestBody User updatedUser, @PathVariable Integer id) {
        updatedUser.setId(id);
        return repo.save(updatedUser);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteUser(@PathVariable Integer id) {
        repo.delete(id);
    }
}
