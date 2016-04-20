package bop.web.rest;


import bop.domain.user.User;
import bop.service.UserAccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.rest.webmvc.BasePathAwareController;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    
    @RequestMapping(value = "/info",
                    method = RequestMethod.GET)
    public ResponseEntity<User> getCurrentAccountInfo() {
        return Optional.ofNullable(userAccountService.getCurrentUser())
                .map(user -> new ResponseEntity<>(user, HttpStatus.OK))
                .orElse(new ResponseEntity<User>(HttpStatus.UNAUTHORIZED));
    }
}
