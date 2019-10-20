package com.lasalle.apg2;

import com.lasalle.apg2.DbConnection;
import com.opensymphony.xwork2.ActionSupport;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.PreparedStatement;

public class RegisterAction extends ActionSupport {
    private String name = "";
    private String email = "";
    private String password = "";

    public String execute() {
        try {            
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement("INSERT INTO user(name, email, password) VALUES(?, ?, ?)");
            preparedStatement.setString(1, this.name);
            preparedStatement.setString(2, this.email);
            preparedStatement.setString(3, this.password);
            preparedStatement.executeUpdate();
        } catch(Exception e) {
            return ERROR;
        }

        return SUCCESS;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = BCrypt.hashpw(password, BCrypt.gensalt());
    }
}