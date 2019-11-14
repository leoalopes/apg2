package com.lasalle.apg2;

import com.lasalle.apg2.DbConnection;
import com.lasalle.apg2.Property;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;
import java.io.StringWriter;
import java.io.PrintWriter;

public class GetPropertiesAction extends ActionSupport {
    private Boolean filtering = false;
    private String title = "";
    private String address = "";
    private float minPrice = 0;
    private float maxPrice = 0;
    private String realtor = "";
    private String owner = "";
    private Boolean funded = false;
    private Boolean owns = false;
    private Boolean trade = false;
    private ArrayList<Property> result = new ArrayList<Property>();

    public String execute() {
        String query = "";
        try {
			query = "SELECT * FROM property WHERE id > 0";
            if(this.filtering) {
                query += " AND funded = ? AND owns = ? AND trade = ?";
            }
			if(!this.title.equals("")) {
				query += " AND title LIKE ?";
			}
            if(!this.address.equals("")) {
				query += " AND (address LIKE ? OR neighborhood LIKE ? OR city LIKE ? OR state LIKE ? OR country LIKE ?)";
			}
            if(this.minPrice > 0) {
                query += " AND price >= ?";
            }
            if(this.maxPrice > 0) {
                query += " AND price <= ?";
            }
            if(!this.realtor.equals("")) {
				query += " AND realtor LIKE ?";
			}
            if(!this.owner.equals("")) {
				query += " AND (owner LIKE ? OR owner_email LIKE ? OR owner_phone LIKE ?)";
			}
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement(query);
            int param = 1;
            if(this.filtering) {
                preparedStatement.setBoolean(param, this.funded);
                param++;
                preparedStatement.setBoolean(param, this.owns);
                param++;
                preparedStatement.setBoolean(param, this.trade);
                param++;
            }
			if(!this.title.equals("")) {
				preparedStatement.setString(param, this.title);
                param++;
			}
            if(!this.address.equals("")) {
                preparedStatement.setString(param, this.address);
                param++;
                preparedStatement.setString(param, this.address);
                param++;
                preparedStatement.setString(param, this.address);
                param++;
                preparedStatement.setString(param, this.address);
                param++;
                preparedStatement.setString(param, this.address);
                param++;
            }
            if(this.minPrice > 0) {
                preparedStatement.setFloat(param, this.minPrice);
                param++;
            }
            if(this.maxPrice > 0) {
                preparedStatement.setFloat(param, this.maxPrice);
                param++;
            }
            if(!this.realtor.equals("")) {
				preparedStatement.setString(param, this.realtor);
                param++;
			}
            if(!this.owner.equals("")) {
                preparedStatement.setString(param, this.owner);
                param++;
                preparedStatement.setString(param, this.owner);
                param++;
                preparedStatement.setString(param, this.owner);
                param++;
			}
            ResultSet rs = preparedStatement.executeQuery();
            while(rs.next()) {
                Property prop = new Property(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getFloat(9),
                    rs.getString(10),
                    rs.getString(11),
                    rs.getString(12),
                    rs.getString(13),
                    rs.getBoolean(14) ? "checked" : "",
                    rs.getBoolean(15) ? "checked" : "",
                    rs.getBoolean(16) ? "checked" : "",
                    rs.getBoolean(17) ? "not_updated" : ""
                );
                this.result.add(prop);
            }
        } catch(Exception e) {
			StringWriter sw = new StringWriter();
			PrintWriter pw = new PrintWriter(sw);
			e.printStackTrace(pw);
            addFieldError("title", sw.toString());
        }

        addFieldError("filtering", query);

        return SUCCESS;
    }

    public Boolean isFiltering() {
        return this.filtering;
    }

    public void setFiltering(String filtering) {
        if(filtering.equals("on")) {
            this.filtering = true;
        } else {
            this.filtering = false;
        }
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
		if(title.equals("")) {
			this.title = title;
		} else {
        	this.title = "%" + title + "%";
		}
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        if(address.equals("")) {
            this.address = "";
        } else {
            this.address = "%" + address + "%";
        }
    }

    public float getMinPrice() {
        return this.minPrice;
    }

    public void setMinPrice(float minPrice) {
        this.minPrice = minPrice;
    }

    public float getMaxPrice() {
        return this.maxPrice;
    }

    public void setMaxPrice(float maxPrice) {
        this.maxPrice = maxPrice;
    }

    public String getOwner() {
        return this.owner;
  	}

    public void setOwner(String owner) {
        if(owner.equals("")) {
            this.owner = "";
        } else {
            this.owner = "%" + owner + "%";
        }
    }

	public String getRealtor() {
        return this.realtor;
    }

    public void setRealtor(String realtor) {
        if(realtor.equals("")) {
            this.realtor = "";
        } else {
            this.realtor = "%" + realtor + "%";
        }
    }

	public Boolean isFunded() {
        return this.funded;
    }

    public void setFunded(String funded) {
        if(funded.equals("on")) {
            this.funded = true;
        } else {
            this.funded = false;
        }
    }

	public Boolean isTrade() {
        return this.trade;
    }

    public void setTrade(String trade) {
        if(trade.equals("on")) {
            this.trade = true;
        } else {
            this.trade = false;
        }
    }

	public Boolean isOwns() {
        return this.owns;
    }

    public void setOwns(String owns) {
        if(owns.equals("on")) {
            this.owns = true;
        } else {
            this.owns = false;
        }
    }

    public ArrayList<Property> getResult() {
        return this.result;
    }

    public void setResult(ArrayList<Property> result) {
        this.result = result;
    }

    @Override
    public void validate() {

    }
}
