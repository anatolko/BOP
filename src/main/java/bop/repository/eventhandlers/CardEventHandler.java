package bop.repository.eventhandlers;

import bop.domain.Card;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.rest.core.annotation.*;
import org.springframework.stereotype.Service;

@Service
@RepositoryEventHandler(Card.class)
public class CardEventHandler {
    private static final Logger LOG = LoggerFactory.getLogger(CardEventHandler.class);

    @HandleBeforeSave
    public void handleBeforeSave(Card c) {
        LOG.debug("Before save " + c);
    }

    @HandleBeforeCreate
    public void handleBeforeCreate(Card c) {
        LOG.debug("Before create " + c);
    }

    @HandleBeforeLinkSave
    public void handleBeforeLinkSave(Card c) {
        LOG.debug("Before link save " + c);
    }

    @HandleBeforeDelete
    public void handleBeforeDelete(Card c) {
        LOG.debug("Before delete " + c);
    }

    @HandleBeforeLinkDelete
    public void handleBeforeLinkDelete(Card c) {
        LOG.debug("Before link delete " + c);
    }
}
