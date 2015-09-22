package bop.repositories;

import bop.entity.UserDepartment;
import org.springframework.data.repository.CrudRepository;

public interface UserDepartmentRepository  extends CrudRepository<UserDepartment, Integer> {
}
