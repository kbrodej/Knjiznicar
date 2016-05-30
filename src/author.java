/**
 * Created by kleme on 15-May-16.
 */
public class author {
    private String name;
    private String surname;

    author(String name,String surname) {
        this.name = name;
        this.surname = surname;
    }
    public String getName() {
        return this.name;
    }

    public String getSurname() {
        return surname;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    //end of getters/setters

}