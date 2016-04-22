package bop.repository;

import bop.domain.Card;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.Date;


@RepositoryRestResource(path = "cards")
public interface CardRepository extends PagingAndSortingRepository<Card, Integer> {

    // get count of cards for user in date period
    Long countByUserIdAndCardDateBetween(@Param("userId") int id,
                                        @Param("startDate") Date startDate,
                                        @Param("endDate") Date endDate);
    
    // find all BOP cards by user id
    Page<Card> findAllByUserId(@Param("userId") int id, Pageable pageable);
}
