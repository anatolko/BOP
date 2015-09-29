package bop.web.rest;

import bop.domain.Card;
import bop.repository.CardRepository;
import bop.service.CardService;
import bop.validators.CardValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/api")
public class CardResource {

    private final Logger log = LoggerFactory.getLogger(CardResource.class);

    @Autowired
    private CardRepository repo;

    @Autowired
    private CardService service;


    @RequestMapping(value = "/cards",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public Page getAll(Pageable pageable) {
        log.debug("REST request to get all Cards");
        return repo.findAll(pageable);
    }


    @RequestMapping(value = "/cards/{id}", method = RequestMethod.GET)
    public Card getById(@PathVariable("id") Integer id) {
        return repo.findOne(id);
    }


    @RequestMapping(value = "/cards", method = RequestMethod.POST)
    public Card add(@RequestBody Card card, BindingResult result) {

        //TODO валидировать объект Card перед отправкой в БД
//        CardValidator cardValidator = new CardValidator();
//        cardValidator.validate(card, result);
//
//        if (result.hasErrors()) {
//            return "Еррор, блин";
//        } else {
//            repo.saveAndFlush(card);
//            return "Все ок";
//        }
        return repo.saveAndFlush(card);
    }


    @RequestMapping(value = "/cards/update/{id}", method = RequestMethod.PUT)
    public Card updateItem(@RequestBody Card updatedCard, @PathVariable Integer id) {
        updatedCard.setId(id);
        return repo.saveAndFlush(updatedCard);
    }

    @RequestMapping(value = "/cards/{id}", method = RequestMethod.DELETE)
    public void deleteCard(@PathVariable Integer id) {
        repo.delete(id);
    }
}
