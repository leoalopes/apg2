package com.lasalle.apg2;

import com.lasalle.apg2.DbConnection;
import com.opensymphony.xwork2.ActionSupport;

import java.sql.PreparedStatement;

public class DeletePropertyAction extends ActionSupport {
	private int id = 0;

    public String execute() {
        try {            
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement("DELETE FROM property WHERE id = ?;");
            preparedStatement.setInt(1, this.id);
            preparedStatement.execute();
        } catch(Exception e) {

        }

        return SUCCESS;
    }

    @Override
    public void validate() {
        
    }

    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
