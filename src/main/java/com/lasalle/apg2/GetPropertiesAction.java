package com.lasalle.apg2;

import com.lasalle.apg2.DbConnection;

import java.sql.PreparedStatement;

public class GetPropertiesAction extends ActionSupport {
    private String title = "";

    public String execute() {
        try {
			String query = "SELECT * FROM PROPERTY";
			if(!this.title.equals("")) {
				query += " WHERE title LIKE ?"
			}
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement(query);
			int param = 1;
			if(this.title) {
				preparedStatement.setString(1, this.title);
				param++;
			}
            preparedStatement.execute();
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

    @Override
    public void validate() {

    }
}
