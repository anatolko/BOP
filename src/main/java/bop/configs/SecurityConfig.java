package bop.configs;

import bop.security.AjaxAuthenticationFailureHandler;
import bop.security.AjaxAuthenticationSuccessHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserDetailsService userDetailsService;
    
    @Autowired
    AjaxAuthenticationFailureHandler ajaxAuthenticationFailureHandler;
    
    @Autowired
    AjaxAuthenticationSuccessHandler ajaxAuthenticationSuccessHandler;
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
        auth
            .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
            .csrf()
        .and()
            .formLogin()
            .loginProcessingUrl("/api/authentication")
            .loginPage("/index.html#/login")
            .successHandler(ajaxAuthenticationSuccessHandler)
            .failureHandler(ajaxAuthenticationFailureHandler)
            .usernameParameter("bop_username")
            .passwordParameter("bop_password")
            .permitAll()
        .and()
            .authorizeRequests()
            .antMatchers("index.html").permitAll()
            .antMatchers("app/login/login.view.html").permitAll()
            .antMatchers("app/**/*").permitAll()
            .anyRequest().authenticated();
    }
}
