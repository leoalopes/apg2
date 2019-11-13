package com.lasalle.apg2;

import com.lasalle.apg2.DbConnection;
import com.opensymphony.xwork2.ActionSupport;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.PreparedStatement;

import java.io.StringWriter;
import java.io.PrintWriter;

public class CreatePropertyAction extends ActionSupport {
	private String title = "";
	private String neighborhood = "";
	private String state = "";
	private String country = "";
	private String city = "";
	private String address = "";
	private String price = "";
    private String owner = "";
	private String ownerEmail = "";
	private String ownerPhone = "";
    private String realtor = "";
    private Boolean funded = false;
    private Boolean trade = false;
	private Boolean owns = false;

    public String execute() {
        try {            
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement("INSERT INTO property(title, neighborhood, state, country, city, address, price, owner, owner_email, owner_phone, realtor, funded, trade, owns) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            preparedStatement.setString(1, this.title);
            preparedStatement.setString(2, this.neighborhood);
            preparedStatement.setString(3, this.state);
			preparedStatement.setString(4, this.country);
			preparedStatement.setString(5, this.city);
            preparedStatement.setString(6, this.address);
			preparedStatement.setFloat(7, Float.parseFloat(this.price));
            preparedStatement.setString(8, this.owner);
            preparedStatement.setString(9, this.ownerEmail);
			preparedStatement.setString(10, this.ownerPhone);
			preparedStatement.setString(11, this.realtor);
			preparedStatement.setBoolean(12, this.funded);
			preparedStatement.setBoolean(13, this.trade);
			preparedStatement.setBoolean(14, this.owns);
            preparedStatement.execute();
        } catch(Exception e) {
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
            addFieldError("title", sw.toString());
			return INPUT;
        }

        return SUCCESS;
    }

    @Override
    public void validate() {
        try {
            Float.parseFloat(this.price);
        } catch(Exception e) {
            addFieldError("price", "Preço deve ser um número");
        }
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNeighborhood() {
        return this.neighborhood;
    }

    public void setNeighborhood(String neighborhood) {
        this.neighborhood = neighborhood;
    }

	public String getState() {
        return this.state;
    }

    public void setState(String state) {
        this.state = state;
    }

	public String getCountry() {
        return this.country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

	public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

	public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

	public String getPrice() {
        return this.price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

	public String getOwner() {
        return this.owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

	public String getOwnerEmail() {
        return this.ownerEmail;
    }

    public void setOwnerEmail(String ownerEmail) {
        this.ownerEmail = ownerEmail;
    }

	public String getOwnerPhone() {
        return this.ownerPhone;
  	}

    public void setOwnerPhone(String ownerPhone) {
        this.ownerPhone = ownerPhone;
    }

	public String getRealtor() {
        return this.realtor;
    }

    public void setRealtor(String realtor) {
        this.realtor = realtor;
    }

	public Boolean isFunded() {
        return this.funded;
    }

    public void setFunded(Boolean funded) {
        this.funded = funded;
    }

	public Boolean isTrade() {
        return this.trade;
    }

    public void setTrade(Boolean trade) {
        this.trade = trade;
    }

	public Boolean isOwns() {
        return this.owns;
    }

    public void setOwns(Boolean owns) {
        this.owns = owns;
    }

    //@Override
    //public void validate() {
        //if(this.name == "" || this.name.length() < 6) {
        //    addFieldError("name", "Nome precisa ter pelo menos 6 caracteres.");
        //} else if(this.email == "") {
        //    addFieldError("email", "Email inválido");
        //} else if(this.password.length() < 6) {
        //    addFieldError("password", "Senha precisa ter pelo menos 6 caracteres");
        //}
    //}
}
