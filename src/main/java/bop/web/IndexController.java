package bop.web;

/**
 * Created by Stretch on 19.05.2015.
 */

import java.util.Date;
import java.util.concurrent.atomic.AtomicLong;

import bop.entity.Card;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class IndexController {
    @RequestMapping("/")
    public Card index() {
        return new Card(1,new Date(),new Date(),"anatoly.yashkin","Anatoly Yashkin","L","HR",2,1,"поля","коммент");
    }
}
