package bop.repository;

import bop.domain.UserDepartment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(path = "user-departments")
public interface UserDepartmentRepository  extends CrudRepository<UserDepartment, Integer> {
}
