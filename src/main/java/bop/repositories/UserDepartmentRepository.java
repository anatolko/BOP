package bop.repositories;

import bop.entity.UserDepartment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(path = "user_departments")
public interface UserDepartmentRepository  extends CrudRepository<UserDepartment, Integer> {
}
