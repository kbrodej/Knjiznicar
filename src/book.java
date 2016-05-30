/**
 * Created by kleme on 15-May-16.
 */
public class book {
    static int numBooks = 0;
    private String title;
    private int isbn;
    private int number;
    private boolean bookStatus;
    private String author;
    private String publisher;
    private String type;
    private String language;

    public book(String language, String title, int isbn, int number, String author, String publisher, String type) {
        this.language = language;
        this.title = title;
        this.isbn = isbn;
        this.number = number;
        this.author = author;
        this.publisher = publisher;
        this.type = type;

        numBooks++; //all books +1
    }

    public boolean isBookStatus() {
        return bookStatus;
    }

    public void setBookStatus(boolean bookStatus) {
        this.bookStatus = bookStatus;
    }
}
