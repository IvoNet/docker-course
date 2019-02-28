
package nl.fontys.config;

import javax.enterprise.inject.Produces;
import javax.enterprise.inject.spi.InjectionPoint;
import java.util.logging.Logger;

import static java.util.logging.Logger.getLogger;

public class Producers {

    @Produces
    public Logger loggerExposer(final InjectionPoint ip) {
        return getLogger(ip.getMember()
                           .getDeclaringClass()
                           .getName());
    }
}
