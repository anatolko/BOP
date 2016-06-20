# BOP
Система заполнения карт проверки безопасного поведения персонала на заводе

* Для работы проекта нужна база данный PostgreSQL 9.5
* Параметры подключения к БД прописываются в файле **src/main/resources/application.properties**
* Для работы Maven плагина Flyway пропишите адресс БД в **pom.xml**
* Автоматическая установка JS зависимостей при сборке проекта не доделана, поэтому запустите **bower install** вручую в корне приложения
* Тестовый аккаунт: **e.motorov@gmail.com**, пароль: **1111**

#PS
Приложение разрабатывается для пробы пера и технологий.
Используемые технологии:

* Spring Boot
* Spring Security
* Spring Data REST
* PostgreSQL 9.5
* Hibernate
* Flyway
* Angular JS 1.4.9
* Bootstrap 3
* Bower

В ближайших планах:

* Gulp
* TypeScript
* Выделение общих элементов в директивы