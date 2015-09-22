//package bop.configs;
//
//import bop.entity.*;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
//import org.springframework.data.rest.webmvc.config.RepositoryRestMvcConfiguration;
//
//
////With this class we are changing default configuration of our REST
//@Configuration
//public class MyRestReposytoryConfig extends RepositoryRestMvcConfiguration {
//
//    //config base path for rest data
//    @Override
//    public RepositoryRestConfiguration config() {
//        RepositoryRestConfiguration config = super.config();
//        config.setBaseUri("/api");
//
//        System.out.println("hello world");
//        return config;
//    }
//
//    //show id's of Entities
//    @Override
//    protected void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
//        config.exposeIdsFor(Card.class);
//        config.exposeIdsFor(Plant.class);
//        config.exposeIdsFor(ObsDepartment.class);
//        config.exposeIdsFor(ObsField.class);
//        config.exposeIdsFor(ObsCategory.class);
//        config.exposeIdsFor(UserGroup.class);
//    }
//
//
//}
