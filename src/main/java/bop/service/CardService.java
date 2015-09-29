package bop.service;

import bop.domain.Card;
import bop.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

//TODO реализовать слой сервиса для работы с картами
//Сервис для работы с картми
@Service
public class CardService {
    @Autowired
    private CardRepository repo;

    public ResponseEntity<?> addNewCard(Card card){


        return new ResponseEntity<>(HttpStatus.CREATED);
    }

}
