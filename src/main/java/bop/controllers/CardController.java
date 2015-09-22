package bop.controllers;

import bop.entity.Card;
import bop.repositories.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/cards")
public class CardController {
    @Autowired
    private CardRepository repo;

    @RequestMapping(method = RequestMethod.GET)
    public Page findCards(Pageable pageable) {
        return repo.findAll(pageable);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Card findCardById(@PathVariable("id") Integer id) {
        return repo.findOne(id);
    }

    @RequestMapping(method = RequestMethod.POST)
    public Card addCard(@RequestBody Card card) {
        return repo.saveAndFlush(card);
    }


    @RequestMapping(value = "/update/{id}", method = RequestMethod.PUT)
    public Card updateItem(@RequestBody Card updatedCard, @PathVariable Integer id) {
        updatedCard.setId(id);
        return repo.saveAndFlush(updatedCard);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deleteCard(@PathVariable Integer id) {
        repo.delete(id);
    }
}
