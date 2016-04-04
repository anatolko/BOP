package bop.repository;

import bop.domain.ObsField;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(path = "obs-fields")
public interface ObsFieldRepository extends CrudRepository<ObsField, Integer> {
}
