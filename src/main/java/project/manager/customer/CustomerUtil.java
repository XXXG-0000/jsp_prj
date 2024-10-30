package project.manager.customer;

/**
 * @author : user
 * @fileName : CustomerUtil
 * @since : 24. 10. 29.
 */
public class CustomerUtil {
    private static String[] columnName= {"cus_id","name"};

    public static String numToField(String fieldName){

        return columnName[Integer.parseInt(fieldName)];

    }
} // CustomerUtil 끝 
