package demo.ws.rest_cxf;

import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

public interface CustomerServices {

	@GET
	@Path("/customers")
	@Produces(MediaType.APPLICATION_JSON)
	List<Customer> retrieveAllCustomers();

	@GET
	@Path("/customer/{id}")
	@Produces(MediaType.APPLICATION_JSON)
	Customer retrieveCustomerByID(@PathParam("id") int id);

	@PUT
	@Path("/customer/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.APPLICATION_JSON)
	Customer updateCustomerById(@PathParam("id") int id,
			Map<String, Object> fieldMap);
}
