package bop.validators;

import bop.domain.Card;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import java.util.ArrayList;

//валидатор не работает пока
public class CardValidator implements Validator {



    @Override
    public boolean supports(Class aClass) {
        return Card.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Card card = (Card) o;

        if(!card.getSelectedFields().isEmpty() && !card.getSelectedCategories().isEmpty())
        {
            ArrayList<Integer> selectedCats = card.getSelectedCategories().get("categories");
            ArrayList<Integer> selectedFields = card.getSelectedFields().get("fields");

            for (Integer field : selectedFields)
            {
                if (!selectedCats.contains(findParentCat(field)))
                {
                    errors.reject("Error nah!");
                }
            }
        }
    }

    private Integer findParentCat(Integer field)
    {
        return 0;
    }
}
