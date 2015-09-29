package bop.domain.usertypes;

import org.hibernate.dialect.PostgreSQL94Dialect;
import java.sql.Types;

/**
 * Created by Stretch on 12.08.2015.
 */
public class JsonPostgreSQLDialect extends PostgreSQL94Dialect {
    public JsonPostgreSQLDialect() {
        super();
        this.registerColumnType(Types.JAVA_OBJECT, "json");
    }
}
