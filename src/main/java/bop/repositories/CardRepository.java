package bop.repositories;

import bop.entity.Card;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;



public interface CardRepository extends JpaRepository<Card, Integer> {
}
