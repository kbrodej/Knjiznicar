/**
 * Created by kleme on 30-May-16.
 */
public class copy implements book1 {
    private int idBook;
    private int number;

    public int getIdBook() {
        return idBook;
    }

    public void setIdBook(int idBook) {
        this.idBook = idBook;
    }
    //end of getters and setters


    @Override
    public int Sposodi() {
        return this.idBook;
    }

    @Override
    public int Rezerviraj() {
        return this.idBook;
    }
}

