package com.lasalle.apg2;

import com.lasalle.apg2.Property;

import com.lasalle.apg2.DbConnection;
import com.opensymphony.xwork2.ActionSupport;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StartEditingPropertyAction extends ActionSupport {
	private int id;
    private Property property = new Property();

    public String execute() {
        try {
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement("SELECT * FROM property WHERE id = ? LIMIT 1");
            preparedStatement.setInt(1, this.id);
            ResultSet rs = preparedStatement.executeQuery();
            rs.next();
            this.property = new Property(
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
        } catch(Exception e) {
			return INPUT;
        }

        return SUCCESS;
    }

    @Override
    public void validate() {
    }

    public Property getProperty() {
        return this.property;
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
