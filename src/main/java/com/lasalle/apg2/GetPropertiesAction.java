package com.lasalle.apg2;

import com.lasalle.apg2.DbConnection;
import com.lasalle.apg2.Property;

import com.opensymphony.xwork2.ActionSupport;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

public class GetPropertiesAction extends ActionSupport {
    private String title = "";
    private ArrayList<Property> result = new ArrayList<Property>();

    public String execute() {
        try {
			String query = "SELECT * FROM PROPERTY";
			// if(!this.title.equals("")) {
			// 	query += " WHERE title LIKE ?"
			// }
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement(query);
			int param = 1;
			// if(this.title) {
			// 	preparedStatement.setString(1, this.title);
			// 	param++;
			// }
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
                    rs.getBoolean(13),
                    rs.getBoolean(14),
                    rs.getBoolean(15),
                    rs.getBoolean(16)
                );
                this.result.add(prop);
            }
        } catch(Exception e) {
			
        }

        return SUCCESS;
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
