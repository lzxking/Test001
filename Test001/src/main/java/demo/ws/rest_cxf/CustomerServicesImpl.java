package demo.ws.rest_cxf;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
@Component("customerServiceImpl")
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

	public Customer retrieveCustomerByID(int id) {
		Customer c=null;
	 for(Customer c1 : customerList){
		 
		 if(c1.getId()==id){
			 
			 c=c1;
			 break;
		 }
		 
	 }
		
		
		
		return c;
	}


	public Customer updateCustomerById(int id, Map<String, Object> fieldMap) {
		Customer c =retrieveCustomerByID(id);
	    if (c != null) {
            try {
                for (Map.Entry<String, Object> fieldEntry : fieldMap.entrySet()) {
                    Field field = Customer.class.getDeclaredField(fieldEntry.getKey());
                    System.out.println(fieldEntry.getKey());
                    field.setAccessible(true);
                    field.set(c, fieldEntry.getValue());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return c;
	}

}
