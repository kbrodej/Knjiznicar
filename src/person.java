/**
 * Created by kleme on 15-May-16.
 */
public class person {

    private String name;
    private String surname;
    private double fee;

    public person(String name, double fee, String surname) {
        this.name = name;
        this.fee = fee;
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public double getFee() {
        return fee;
    }

    public void setFee(double fee) {
        this.fee = fee;
    }
}
