package bop.service;

import bop.domain.user.User;
import bop.repository.user.UserRepository;
import bop.security.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Service("userAccountService")
public class UserAccountService {

    private final Logger log = LoggerFactory.getLogger(UserAccountService.class);
    
    @Autowired
    private UserRepository userRepository;
    
    public User getUserByEmail(String email) {
        String lowercaseEmail = email.toLowerCase();
        return userRepository.findOneByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("User " + lowercaseEmail + " was not found in the " +
                "database"));
    }
    
    @Transactional(readOnly = true)
    public User getCurrentUser(){
        return userRepository.findOneByEmail(SecurityUtils.getCurrentUserLogin()).orElse(null);
    }
}
