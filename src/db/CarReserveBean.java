package db;

public class CarReserveBean {

    private int reserveno;
    private int no;
    private String id;
    private String qty;
    private String lendingday;
    private int lendingperiod;
    private String rentaldate;
    private int insurance;
    private int wifi;
    private int navigation;
    private int babysheet;
    private int totalPrice;

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getNo() {
        return no;
    }

    public int getReserveno() {
        return reserveno;
    }

    public void setReserveno(int reserveno) {
        this.reserveno = reserveno;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getQty() {
        return qty;
    }

    public void setQty(String qty) {
        this.qty = qty;
    }

    public String getLendingday() {
        return lendingday;
    }

    public void setLendingday(String lendingday) {
        this.lendingday = lendingday;
    }

    public int getLendingperiod() {
        return lendingperiod;
    }

    public void setLendingperiod(int lendingperiod) {
        this.lendingperiod = lendingperiod;
    }

    public String getRentaldate() {
        return rentaldate;
    }

    public void setRentaldate(String rentaldate) {
        this.rentaldate = rentaldate;
    }

    public int getInsurance() {
        return insurance;
    }

    public void setInsurance(int insurance) {
        this.insurance = insurance;
    }

    public int getWifi() {
        return wifi;
    }

    public void setWifi(int wifi) {
        this.wifi = wifi;
    }

    public int getNavigation() {
        return navigation;
    }

    public void setNavigation(int navigation) {
        this.navigation = navigation;
    }

    public int getBabysheet() {
        return babysheet;
    }

    public void setBabysheet(int babysheet) {
        this.babysheet = babysheet;
    }
}
