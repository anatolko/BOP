package bop.repository;

import bop.domain.UserDepartment;
import org.springframework.data.repository.CrudRepository;

public interface UserDepartmentRepository  extends CrudRepository<UserDepartment, Integer> {
}
