package bop.configs;

import bop.domain.*;
import bop.domain.user.User;
import bop.domain.user.UserGroup;
import bop.domain.user.UserRole;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;

// changing default configuration for our REST
@Configuration
public class RestRepositoryConfig extends RepositoryRestMvcConfiguration {

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
        config.exposeIdsFor(User.class);
        config.exposeIdsFor(UserRole.class);

        return config;
    }
}
