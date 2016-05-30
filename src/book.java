/**
 * Created by kleme on 15-May-16.
 */
public class book extends copy {
    private String title;
    private int isbn;
    private boolean bookStatus;
    private String author;
    private String publisher;
    private String type;
    private String language;

    public book(String language, String title, int isbn, String author, String publisher, String type) {
        this.language = language;
        this.title = title;
        this.isbn = isbn;
        this.author = author;
        this.publisher = publisher;
        this.type = type;
    }
    public book(){

    }

    public boolean isBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(boolean bookStatus) {
        this.bookStatus = bookStatus;
    }

    public void dodajKnjigo(String language, String title, int isbn, String author, String publisher, String type){
        this.language = language;
        this.title = title;
        this.isbn = isbn;
        this.author = author;
        this.publisher = publisher;
        this.type = type;
        /*SELECT b.title, b.isbn, l.Language,t.Type FROM `book` b
        JOIN bookauthor ba USING(id_book) JOIN author a USING(id_author)
        JOIN book_status bs USING(id_book_status)
                JOIN language l USING(id_language)
        JOIN type t USING(id_type)*/
    }
    @Override
    public int Rezerviraj() {
        return super.Rezerviraj();
    }
}
