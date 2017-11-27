import java.sql.*;

/**
 * Created by kleme on 15-May-16.
 */
public class db {

    static final String username = "root";
    static final String password = "password";
    static final String schema = "knjiznicar";
    public  void Connect() throws SQLException {
        Connection conn = null;
        System.out.println("tralal");
        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost/knjiznicar?user=root&password=password");
            System.out.println("Connection succesful");
        } catch (SQLException ex) {
            conn = null;
            System.out.println("SQL error: " + ex);
        }
        Statement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT Name FROM Author");
            ResultSetMetaData rsmd = rs.getMetaData();

            // or alternatively, if you don't know ahead of time that
            // the query will be a SELECT...

            if (stmt.execute("SELECT Name FROM Author")) {
                rs = stmt.getResultSet();
            }
            int colmunCount = rsmd.getColumnCount();
            // Now do something with the ResultSet ....
            for (int i = 1; i < colmunCount ; i++) {
                while (rs.next()) {
                    if (i > 1) System.out.print(",  ");
                    String columnValue = rs.getString(i);
                    System.out.print(columnValue + " " + rsmd.getColumnName(i));
                }
            }
        }
        catch (SQLException ex){
            // handle any errors
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
    }

}
