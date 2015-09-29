package bop.repository;

import bop.domain.Card;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CardRepository extends JpaRepository<Card, Integer> {
}
