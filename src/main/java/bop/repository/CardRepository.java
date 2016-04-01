package bop.repository;

import bop.domain.Card;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(path = "cards")
public interface CardRepository extends PagingAndSortingRepository<Card, Integer> {
}
