package bop.repository.user;

import bop.domain.user.UserDepartment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(path = "user-departments")
public interface UserDepartmentRepository  extends CrudRepository<UserDepartment, Integer> {
}
