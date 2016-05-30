/**
 * Created by kleme on 30-May-16.
 */
import java.sql.*;
public class main {
    public static void main(String[] args) throws SQLException{
        System.out.println("Connecting");
        try {
            String URL = "jdbc:mysql://localhost:3306/knjiznicar";
            String USER = "root";
            String PASS = "12Brodnik34aA";
            Connection conn = DriverManager.getConnection (URL, USER, PASS);
            if(conn.isValid(10)) {
                System.out.println("Connecton succesful!");
            } else {
                throw new SQLException();
            }
        } catch (SQLException e) {
            System.out.println("Connection failed! \n"+ e.getMessage());
        }
    }
}
