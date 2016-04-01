package bop.repository;

import bop.domain.ObsDepartment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(path = "obs-departments")
public interface ObsDepartmentRepository extends CrudRepository<ObsDepartment, Integer> {
}
