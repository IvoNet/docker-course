package nl.fontys.service;

import nl.fontys.domain.Kwetter;

import javax.enterprise.context.ApplicationScoped;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Response;
import java.util.List;

import static javax.ws.rs.core.MediaType.APPLICATION_JSON;

@Path("/api")
@ApplicationScoped
public class KwetterService {

    @PersistenceContext(unitName = "kwetterPU")
    private EntityManager em;

    @GET
    @Path(value = "")
    @Produces(APPLICATION_JSON)
    public Response get() {
        final List<Kwetter> kwetters = this.em.createQuery("SELECT k from Kwetter k", Kwetter.class)
                                              .getResultList();
        if (kwetters == null) {
            return Response.noContent()
                           .build();
        }
        return Response.ok(kwetters)
                       .build();
    }

    @GET
    @Path(value = "{id}")
    @Produces(APPLICATION_JSON)
    public Response getId(@PathParam("id") final Long id) {
        final Kwetter kwetter = this.em.find(Kwetter.class, id);
        if (kwetter == null) {
            return Response.noContent()
                           .build();
        }
        return Response.ok(kwetter)
                       .build();
    }

    @GET
    @Path(value = "/user/{user}")
    @Produces(APPLICATION_JSON)
    public Response getByUser(@PathParam("user") final String user) {
        final List<Kwetter> kwetters = this.em.createQuery("SELECT k from Kwetter k where k.name = :user",
                                                           Kwetter.class)
                                              .setParameter("user", user)
                                              .getResultList();
        if (kwetters == null) {
            return Response.noContent()
                           .build();
        }
        return Response.ok(kwetters)
                       .build();
    }

}
