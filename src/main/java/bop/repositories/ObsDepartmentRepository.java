package bop.repositories;

import bop.entity.ObsDepartment;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * Created by Stretch on 10.08.2015.
 */
@RepositoryRestResource(path = "obs-departments")
public interface ObsDepartmentRepository extends CrudRepository<ObsDepartment, Integer> {
}
