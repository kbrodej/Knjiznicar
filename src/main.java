/**
 * Created by kleme on 30-May-16.
 */

import java.sql.*;
import java.util.ArrayList;

public class main {
    public static void isciPoKnjigi(String bookName, Connection conn){
        try {
            PreparedStatement stmt = null;
            String sql = "SELECT b.id_book,b.title, b.ISBN, a.name,a.surname, bs.status,l.language,t.type,t.max_borrowed_days FROM book b\n" +
                    "  join bookauthor ba USING(id_book) JOIN author a USING(id_author)\n" +
                    "  join book_status bs using(id_book_status)\n" +
                    "  join language l using(id_language)\n" +
                    "  join type t using(id_type)\n" +
                    "where title = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1,bookName);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String status ="";
                int id_book = rs.getInt("id_book");
                String title = rs.getString("title");
                String aName = rs.getString("name");
                String aSurname = rs.getString("surname");
                int id_book_status = rs.getInt("status");
                String language = rs.getString("language");
                String type = rs.getString("type");
                switch (id_book_status) {
                    case 1: status = "Na voljo";
                        break;
                    case 2: status = "Ni na volojo";
                }
                int max_bd = rs.getInt("max_borrowed_days");
                System.out.println(id_book + " " + title + " " + " " + status + " " + aName + " " + aSurname + " " + id_book_status + " "
                        + language + " " + type + " " + max_bd);
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public static void isciPoAvtorju(String name, String surname, Connection conn){
        try {
            PreparedStatement stmt = null;
            String sql = "SELECT b.id_book,b.title, b.ISBN, a.name,a.surname, bs.status,l.language,t.type,t.max_borrowed_days FROM bookauthor ba\n" +
                    "JOIN book b USING(id_book) JOIN author a USING(id_author)\n" +
                    "  JOIN book_status bs USING(id_book_status)\n" +
                    "  JOIN language l USING(id_language)\n" +
                    "  JOIN type t USING(id_type)\n" +
                    "WHERE a.name = ? AND a.surname =?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, name);
            stmt.setString(2, surname);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                String status ="";
                int id_book = rs.getInt("id_book");
                String title = rs.getString("title");
                String aName = rs.getString("name");
                String aSurname = rs.getString("surname");
                int id_book_status = rs.getInt("status");
                String language = rs.getString("language");
                String type = rs.getString("type");
                switch (id_book_status) {
                    case 1: status = "Na voljo";
                        break;
                    case 2: status = "Ni na volojo";
                }
                int max_bd = rs.getInt("max_borrowed_days");
                System.out.println(id_book + " " + title + " " + " " + status + " " + aName + " " + aSurname + " " + id_book_status + " "
                        + language + " " + type + " " + max_bd);
            }
        }catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public static void isciPoISBN(int ISBN,Connection conn) {
        System.out.println("Iskanje po ISBN");
        try {
            PreparedStatement stmt = null;
            Statement stmtrc = null;
            Statement join = null;


            stmtrc = conn.createStatement();

            String sql = "SELECT b.id_book,b.title, b.ISBN, a.name,a.surname, bs.status,l.language,t.type,t.max_borrowed_days FROM book b\n" +
                    "JOIN bookauthor ba USING(id_book) JOIN author a USING(id_author)\n" +
                    "JOIN book_status bs USING(id_book_status)\n" +
                    "JOIN language l USING(id_language)\n" +
                    "JOIN type t USING(id_type)\n" +
                    "WHERE ISBN =?";

            stmt = conn.prepareStatement(sql);
            stmt.setInt(1,ISBN);
            ResultSet rs =stmt.executeQuery();
            ResultSet rc = stmtrc.executeQuery("SELECT COUNT(*) AS c FROM book WHERE ISBN = 123456789");
            while (rc.next()) {
                int count = rc.getInt("c");
                if (count == 1) {
                    while (rs.next()) {
                        String status ="";
                        int id_book = rs.getInt("id_book");
                        String title = rs.getString("title");
                        String aName = rs.getString("name");
                        String aSurname = rs.getString("surname");
                        int id_book_status = rs.getInt("status");
                        String language = rs.getString("language");
                        String type = rs.getString("type");
                        switch (id_book_status) {
                            case 1: status = "Na voljo";
                                break;
                            case 2: status = "Ni na volojo";
                        }
                        int max_bd = rs.getInt("max_borrowed_days");
                        System.out.println(id_book + " " + title + " " + " " + status + " " + aName + " " + aSurname + " " + id_book_status + " "
                                + language + " " + type + " " + max_bd);
                    }
                } else{
                    System.out.println("ISBN ni pravilen");
                }
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }
    public static void main(String[] args) throws SQLException{ //TODO loadanje spravi v metodo
        Connection conn = null;

        System.out.println("Connecting");
        try {
            ArrayList<book> knjige = new ArrayList<book>();
            String URL = "jdbc:mysql://localhost:3306/knjiznicar";
            String USER = "root";
            String PASS = "12Brodnik34aA";
            conn = DriverManager.getConnection (URL, USER, PASS);
            if(conn.isValid(10)) {
                System.out.println("Connecton succesful!");
                //isciPoISBN(123456789,conn);
                //isciPoAvtorju("Klemen","Brodej",conn);
                //isciPoKnjigi("Moja prva knjiga",conn);
                String sq  = "SELECT b.id_book, b.Title, b.ISBN,l.Language,t.Type,t.Max_borrowed_days, p.Name, a.Name AS AuthorName, " +
                        "a.Surname AS AuthorSurname, bs.status FROM book b\n" +
                        "JOIN language l USING(id_language)\n" +
                        "JOIN book_status bs USING(id_book_status)\n" +
                        "JOIN type t USING(id_type)\n" +
                        "JOIN publisher p USING(id_publisher)\n" +
                        "JOIN bookauthor ba USING(id_book) JOIN author a USING(id_author) WHERE ?";
                PreparedStatement test =conn.prepareStatement(sq);
                test.setInt(1,1);
                ResultSet rs = test.executeQuery();

                String rcsql = "SELECT COUNT(*) as count from book b\n" +
                        "JOIN language l using(id_language)\n" +
                        "JOIN book_status bs USING(id_book_status)\n" +
                        "JOIN type t using(id_type)\n" +
                        "JOIN publisher p USING(id_publisher)\n" +
                        "JOIN bookauthor ba USING(id_book) join author a USING(id_author)";
                Statement stmtrc = conn.createStatement();
                ResultSet rc = stmtrc.executeQuery(rcsql);
                rc.next();
                int rcount = rc.getInt("count");
                while(rs.next()) {
                    for (int i = 1; i < rcount ; i++) {
                        //String language, String title, int isbn, String authorName, String authorSurname, String publisher, String type, int max_borrowed_days
                        int id_book = rs.getInt("id_book");
                        String title = rs.getString("title");
                        int ISBN  = rs.getInt("ISBN");
                        String language = rs.getString("Language");
                        String type = rs.getString("Type");
                        int max_borrowed_days = rs.getInt("Max_borrowed_days");
                        String name =  rs.getString("Name");
                        String authorName = rs.getString("AuthorName");
                        String authorSurname = rs.getString("AuthorSurname");
                        int status =  rs.getInt("status");
                        book knj = new book(id_book,language,title,ISBN,authorName,authorSurname,name,type,max_borrowed_days,status);
                        knjige.add(knj);


                        System.out.printf("%s %s %s %s %s %s %s %s %s %s",id_book,title,ISBN,language,type,max_borrowed_days,name,authorName,authorSurname,status);
                    }
                    System.out.println();

                }
            } else {
                throw new SQLException();
            }
        } catch (SQLException e) {
            System.out.println("Connection failed! \n"+ e.getMessage());
        }
    }
}
