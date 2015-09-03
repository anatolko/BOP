package bop.repositories;

import bop.entity.UserGroup;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(path = "user_groups")
public interface UserGroupRepository extends CrudRepository<UserGroup, Integer> {
}
