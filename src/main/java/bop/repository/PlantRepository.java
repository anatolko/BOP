package bop.repository;

import bop.domain.Plant;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(path = "plants")
public interface PlantRepository extends CrudRepository<Plant, Integer> {
}
