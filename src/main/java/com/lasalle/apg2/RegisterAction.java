package com.lasalle.apg2;

import com.lasalle.apg2.DbConnection;
import com.opensymphony.xwork2.ActionSupport;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.PreparedStatement;

public class RegisterAction extends ActionSupport {
    private String name = "";
    private String email = "";
    private String hash = "";
    private String password = "";

    public String execute() {
        try {            
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement("INSERT INTO user(name, email, password) VALUES(?, ?, ?)");
            preparedStatement.setString(1, this.name);
            preparedStatement.setString(2, this.email);
            preparedStatement.setString(3, this.hash);
            preparedStatement.execute();
        } catch(Exception e) {
            addFieldError("email", "Email já cadastrado");
            return INPUT;
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
        this.password = password;
        this.hash = BCrypt.hashpw(password, BCrypt.gensalt());
    }

    @Override
    public void validate() {
        if(this.name == "" || this.name.length() < 6) {
            addFieldError("name", "Nome precisa ter pelo menos 6 caracteres.");
        } else if(this.email == "") {
            addFieldError("email", "Email inválido");
        } else if(this.password.length() < 6) {
            addFieldError("password", "Senha precisa ter pelo menos 6 caracteres");
        }
    }
}