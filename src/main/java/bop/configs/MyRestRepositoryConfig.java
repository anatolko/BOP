package bop.configs;

import bop.domain.*;
import org.springframework.beans.factory.ObjectFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.repository.support.Repositories;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.core.event.ValidatingRepositoryEventListener;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;

// changing default configuration for our REST
@Configuration
public class MyRestRepositoryConfig extends RepositoryRestMvcConfiguration {

    @Override
    public RepositoryRestConfiguration config() {
        RepositoryRestConfiguration config = super.config();
        
        // standard path for API
        config.setBasePath("/api");

        // show id field
        config.exposeIdsFor(Card.class);
        config.exposeIdsFor(Plant.class);
        config.exposeIdsFor(ObsDepartment.class);
        config.exposeIdsFor(ObsField.class);
        config.exposeIdsFor(ObsCategory.class);
        config.exposeIdsFor(UserGroup.class);

        return config;
    }
}
