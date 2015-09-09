package demo.ws.rest_study1;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

public interface CustomerServices {
	
	@GET
	@Path("/customers")
	@Produces(MediaType.APPLICATION_JSON)
	  List<Customer> retrieveAllCustomers();

}
