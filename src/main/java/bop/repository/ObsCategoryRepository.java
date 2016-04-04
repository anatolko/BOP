package bop.repository;

import bop.domain.ObsCategory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(path = "obs-categories")
public interface ObsCategoryRepository extends CrudRepository<ObsCategory, Integer> {
}
