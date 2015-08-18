package bop.repositories;

import bop.entity.Card;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * Created by Stretch on 04.08.2015.
 */
@RepositoryRestResource(path = "cards")
public interface CardRepository extends PagingAndSortingRepository<Card, Integer> {
}
