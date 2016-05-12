package bop.repository.validators;

import bop.domain.Card;
import bop.security.Authorities;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.Calendar;
import java.util.Date;

@Component("beforeDeleteCardValidator")
public class BeforeDeleteCardValidator implements Validator{
    @Override
    public boolean supports(Class<?> clazz) {
        return Card.class.equals(clazz);
    }

    @Override
    public void validate(Object o, Errors errors) {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Card card = (Card) o;
        
        // if User is not Admin he can't delete card from previous weeks 
        if (!isDateInCurrentWeek(card.getCardDate()) && 
                !userDetails.getAuthorities().contains(new SimpleGrantedAuthority(Authorities.ADMIN.toString()))) {
            errors.rejectValue("cardDate", "cardDate.notvalid", "You can't delete cards from previous weeks");
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
