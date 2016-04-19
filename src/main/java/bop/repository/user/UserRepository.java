package bop.repository.user;

import bop.domain.user.User;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

import java.util.Optional;

@RepositoryRestResource(path = "users")
public interface UserRepository extends CrudRepository<User, Integer> {
    
    @RestResource(path="emails", rel="emails")
    Optional<User> findOneByEmail(@Param("email") String email);    
    
}
