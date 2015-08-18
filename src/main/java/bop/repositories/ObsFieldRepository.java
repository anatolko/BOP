package bop.repositories;

import bop.entity.ObsField;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * Created by Stretch on 13.08.2015.
 */
@RepositoryRestResource(path = "obs-fields")
public interface ObsFieldRepository extends CrudRepository<ObsField, Integer> {
}
