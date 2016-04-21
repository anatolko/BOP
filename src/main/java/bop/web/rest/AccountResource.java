package bop.web.rest;


import bop.domain.user.User;
import bop.service.UserAccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.BasePathAwareController;

import org.springframework.hateoas.EntityLinks;
import org.springframework.hateoas.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Optional;

/**
 * REST controller for working with user accounts
 */

@BasePathAwareController
@RequestMapping("account")
public class AccountResource {
    
    private final Logger log = LoggerFactory.getLogger(AccountResource.class);
    
    @Autowired
    UserAccountService userAccountService;
    
    @Autowired
    EntityLinks entityLinks;

    /**
     * returns info about current authenticated account 
     * 
     * @return current authenticated account info in HATEOAS format
     */
    @RequestMapping(value = "/info",
                    method = RequestMethod.GET)
    @ResponseBody
    public ResponseEntity<Resource<User>> getCurrentAccountInfo() {
        return Optional.ofNullable(userAccountService.getCurrentUser())
                .map(user -> {
                    Resource<User> resource = new Resource<>(user);
                    resource.add(entityLinks.linkFor(User.class).slash(user.getId()).withSelfRel());
                    resource.add(entityLinks.linkFor(User.class).slash(user.getId()).slash("plant").withRel("plant"));
                    resource.add(entityLinks.linkFor(User.class).slash(user.getId()).slash("userGroup").withRel("userGroup"));
                    resource.add(entityLinks.linkFor(User.class).slash(user.getId()).slash("userDepartment").withRel("userDepartment"));
                    return new ResponseEntity<>(resource, HttpStatus.OK);
                } )
                .orElse(new ResponseEntity<Resource<User>>(HttpStatus.UNAUTHORIZED));
    }
}
