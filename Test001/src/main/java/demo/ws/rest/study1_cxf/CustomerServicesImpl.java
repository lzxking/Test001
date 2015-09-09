package demo.ws.rest.study1_cxf;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class CustomerServicesImpl implements CustomerServices{
	
	   private static final List<Customer> customerList = new ArrayList<Customer>();

	    static {
	    	customerList.add(new Customer(1, "iphone 3s", "M","33","BJ"));
	    	customerList.add(new Customer(2, "iphone 4s", "F","33","GZ"));
	    	customerList.add(new Customer(3, "iphone 5s", "M","22","SG"));
	    	customerList.add(new Customer(4, "iphone 6s", "F","22","CQ"));
	    }
	
	
	public  List<Customer> retrieveAllCustomers(){
		
		
		return customerList;
		
	}

}
