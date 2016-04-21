package bop.repository;

import bop.domain.Card;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;


@RepositoryRestResource(path = "cards")
public interface CardRepository extends PagingAndSortingRepository<Card, Integer> {

    // find all BOP cards by user id
    Page<Card> findAllByUserId(@Param("user_id") int id, Pageable pageable);
}
