package bop.repository.user;

import bop.domain.user.UserRole;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(path = "user-roles")
public interface UserRoleRepository extends CrudRepository<UserRole, Integer> {
}
