package com.lasalle.apg2;

import com.lasalle.apg2.DbConnection;
import com.opensymphony.xwork2.ActionSupport;
import org.mindrot.jbcrypt.BCrypt;
import org.apache.struts2.interceptor.SessionAware;

import java.util.Map;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginAction extends ActionSupport implements SessionAware {
    private String email = "";
    private String password = "";
    private Map session;

    public String execute() {
        try {            
            PreparedStatement preparedStatement = DbConnection.getConnection().prepareStatement("SELECT * FROM user WHERE email = ? LIMIT 1");
            preparedStatement.setString(1, this.email);
            ResultSet result = preparedStatement.executeQuery();
            result.next();
            if(!BCrypt.checkpw(this.password, result.getString("password"))) {
                throw new Exception();
            }
        } catch(Exception e) {
            addFieldError("email", "Credenciais inválidas");
            return INPUT;
        }

        session.put("loggedEmail", this.email);
        return SUCCESS;
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
    }

    public Map getSession() {
        return session;
    }
   
    public void setSession(Map session) {
        this .session = session;
    }

    @Override
    public void validate() {
        if(this.email == "") {
            addFieldError("email", "Email inválido");
        } else if(this.password.length() < 6) {
            addFieldError("password", "Senha precisa ter pelo menos 6 caracteres");
        }
    }
}