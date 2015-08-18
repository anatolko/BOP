package bop.configs;

import bop.entity.*;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;



@Configuration
public class MyRestReposytoryConfig extends RepositoryRestMvcConfiguration {
    @Override
    protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
        config.exposeIdsFor(Card.class);
        config.exposeIdsFor(Plant.class);
        config.exposeIdsFor(ObsDepartment.class);
        config.exposeIdsFor(ObsField.class);
        config.exposeIdsFor(ObsCategory.class);
        config.exposeIdsFor(UserGroup.class);
    }
}
