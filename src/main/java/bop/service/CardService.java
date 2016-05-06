package bop.service;

import bop.domain.Card;
import bop.error.CardTooOldException;
import bop.repository.CardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Calendar;
import java.util.Date;

@Service("cardService")
public class CardService {
   
    @Autowired
    private CardRepository cardRepository;

    /**
     * remove card by id
     * 
     * @param id card identificator
     */
    public void removeCardById(Integer id) {
        cardRepository.delete(id);
    }

    /**
     * delete card only if it was created in current week
     *
     * @param card for deleting
     * @throws CardTooOldException if  trying to delete card from previous weeks
     */
    public void removeCurrentWeekCard(Card card) throws CardTooOldException {
        if (isDateInCurrentWeek(card.getCardDate())) {
            removeCardById(card.getId());
        } else {
            throw new CardTooOldException("You can't delete or remove card from previous weeks");
        }
    }

    private boolean isDateInCurrentWeek(Date date) {
        Calendar currentCalendar = Calendar.getInstance();
        int week = currentCalendar.get(Calendar.WEEK_OF_YEAR);
        int year = currentCalendar.get(Calendar.YEAR);
        Calendar targetCalendar = Calendar.getInstance();
        targetCalendar.setTime(date);
        int targetWeek = targetCalendar.get(Calendar.WEEK_OF_YEAR);
        int targetYear = targetCalendar.get(Calendar.YEAR);
        return week == targetWeek && year == targetYear;
    }
}
