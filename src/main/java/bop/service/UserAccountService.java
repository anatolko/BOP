package bop.service;

import bop.domain.user.User;
import bop.repository.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
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
}
