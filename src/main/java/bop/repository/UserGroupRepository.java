package bop.repository;

import bop.domain.UserGroup;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

@RepositoryRestResource(path = "user-groups")
public interface UserGroupRepository extends CrudRepository<UserGroup, Integer> {
}
