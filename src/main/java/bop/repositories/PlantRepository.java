package bop.repositories;

import bop.entity.Plant;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import org.springframework.data.rest.core.annotation.RestResource;

/**
 * Created by Stretch on 10.08.2015.
 */
@RepositoryRestResource(path = "plants")
public interface PlantRepository extends CrudRepository<Plant, Integer> {
}
