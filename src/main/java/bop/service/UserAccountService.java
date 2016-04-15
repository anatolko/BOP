package bop.service;

import bop.repository.user.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserAccountService {

    private final Logger log = LoggerFactory.getLogger(UserAccountService.class);
    
    @Autowired
    private UserRepository userRepository;
    
    
}
