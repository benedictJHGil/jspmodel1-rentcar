package db;

public class CarViewBean {

    private String name;
    private int price;
    private String img;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
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
