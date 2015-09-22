//package bop.configs;
//
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.authentication.configurers.GlobalAuthenticationConfigurerAdapter;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.builders.WebSecurity;
//import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
//import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
//
//
//@Configuration
//@EnableWebMvcSecurity
//public class MyWebSecurityConfig extends WebSecurityConfigurerAdapter {
//    @Value("${app.ad-domain}")
//    private String adDomain;
//
//    @Value("${app.ad-server}")
//    private String adServer;
//
//    @Value("${app.service-principal}")
//    private String servicePrincipal;
//
//    @Value("${app.keytab-location}")
//    private String keytabLocation;
//
//    @Value("${app.ldap-search-base}")
//    private String ldapSearchBase;
//
//    @Value("${app.ldap-search-filter}")
//    private String ldapSearchFilter;
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http
//                .authorizeRequests()
//                //.antMatchers("/app/**","/api/**", "/assets/**", "/app/components/login/**").permitAll()
//                .antMatchers("/**").permitAll()
//                .anyRequest().fullyAuthenticated()
//                .and()
//                .formLogin()
//                    .loginPage("/login.html").permitAll();
//    }
//
//    @Configuration
//    protected static class AuthenticationConfiguration extends
//            GlobalAuthenticationConfigurerAdapter {
//
//        @Override
//        public void init(AuthenticationManagerBuilder auth) throws Exception {
//            auth
//                    .ldapAuthentication()
//                    .userDnPatterns("uid={0},ou=people")
//                    .groupSearchBase("ou=groups")
//                    .contextSource().ldif("classpath:test-server.ldif");
//        }
//    }
//}
