/*
 * DON'T BE A DICK PUBLIC LICENSE
 *
 * Version 1, December 2009
 *
 * Copyright (C) 2018 IvoNet.nl <WebMaster@ivonet.nl>
 *
 *  Everyone is permitted to copy and distribute verbatim or modified
 *  copies of this license document, and changing it is allowed as long
 *  as the name is changed.
 *
 * > DON'T BE A DICK PUBLIC LICENSE
 * > TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 *
 *  1. Do whatever you like with the original work, just don't be a dick.
 *
 *      Being a dick includes - but is not limited to - the following instances:
 *
 * 	 1a. Outright copyright infringement - Don't just copy this and change the name.
 * 	 1b. Selling the unmodified original with no work done what-so-ever, that's REALLY being a dick.
 * 	 1c. Modifying the original work to contain hidden harmful content. That would make you a PROPER dick.
 *
 *  2. If you become rich through modifications, related works/services, or supporting the original work,
 *  share the love. Only a dick would make loads off this work and not buy the original work's
 *  creator(s) a pint.
 *
 *  3. Code is provided with no warranty. Using somebody else's code and bitching when it goes wrong makes
 *  you a DONKEY dick. Fix the problem yourself. A non-dick would submit the fix back.
 */

package nl.ordina.service;

import nl.ordina.model.Quote;

import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import java.util.logging.Logger;

import static javax.ws.rs.core.MediaType.APPLICATION_JSON;

/**
 * @author Ivo Woltring
 */
@Path("/quote")
@Stateless
public class QuoteService {

    @PersistenceContext(unitName = "quote_dbPU")
    private EntityManager em;

    @Context
    private UriInfo uriInfo;

    @Inject
    private Logger log;

    @GET
    @Path(value = "{id}")
    @Produces(APPLICATION_JSON)
    public Response get(@PathParam("id") Integer id) {
        final Quote quote = em.find(Quote.class, id);
        this.log.info(quote == null? "No quote found" : quote.toString());
        return Response.ok(quote).build();
    }
}
