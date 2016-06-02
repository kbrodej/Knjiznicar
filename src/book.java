/**
 * Created by kleme on 15-May-16.
 */
public class book extends copy {
    private int id_book;
    private String title;
    private int isbn;
    private String authorName;
    private String authorSurname;
    private String publisher;
    private String type;
    private String language;
    private int max_borrowed_days;
    private int status;

    public book(int id_book,String language, String title, int isbn, String authorName, String authorSurname, String publisher, String type, int max_borrowed_days, int status) {
        this.id_book = id_book;
        this.language = language;
        this.title = title;
        this.isbn = isbn;
        this.authorName = authorName;
        this.authorSurname = authorSurname;
        this.publisher = publisher;
        this.type = type;
        this.max_borrowed_days = max_borrowed_days;
        this.status = status;
    }
   //getter & setters
    public int getId_book() {
        return id_book;
    }

    public void setId_book(int id_book) {
        this.id_book = id_book;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getIsbn() {
        return isbn;
    }

    public void setIsbn(int isbn) {
        this.isbn = isbn;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getAuthorSurname() {
        return authorSurname;
    }

    public void setAuthorSurname(String authorSurname) {
        this.authorSurname = authorSurname;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public int getMax_borrowed_days() {
        return max_borrowed_days;
    }

    public void setMax_borrowed_days(int max_borrowed_days) {
        this.max_borrowed_days = max_borrowed_days;
    }
    //end of getter & setters
    @Override
    public int Rezerviraj() {
        return super.Rezerviraj();
    }
}
