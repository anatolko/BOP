package bop.security;

import bop.domain.user.User;
import bop.service.UserAccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Component("userDetailsService")
public class UserDetailServiceIml implements UserDetailsService {
    
    private final Logger log = LoggerFactory.getLogger(UserDetailsService.class);

    @Autowired
    private UserAccountService userAccountService;
    
    @Override
    @Transactional
    public UserDetails loadUserByUsername(String login) throws UsernameNotFoundException {
        
        log.debug("Authenticating {}", login);

        User userForLogin = userAccountService.getUserByEmail(login);
        List<GrantedAuthority> grantedAuthorityList = new ArrayList<>();
        grantedAuthorityList.add(new SimpleGrantedAuthority(userForLogin.getUserRole().getName()));
        
        return new org.springframework.security.core.userdetails.User(
                userForLogin.getEmail(),
                userForLogin.getPassHash(),
                grantedAuthorityList
        );
    }
}
