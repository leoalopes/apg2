package com.lasalle.apg2;

import org.apache.struts2.dispatcher.SessionMap;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class AuthInterceptor implements Interceptor {
    @Override
    public void destroy() {

    }

    @Override
    public void init() {
        
    }

    @Override
    public String intercept(ActionInvocation inv) throws Exception {
        ActionContext context = inv.getInvocationContext();

        Boolean loggedIn = false;
        SessionMap<String,Object> session = (SessionMap<String,Object>) inv.getInvocationContext().getSession();
        if(session != null) {
            String email = (String) session.get("loggedEmail");      
            if(email != null){                  
                loggedIn = true;
            }
        }

        if(
            context.getName().equalsIgnoreCase("login") ||
            context.getName().equalsIgnoreCase("loginAction")
        ) {
            if(loggedIn) {
                return "home";
            }
            
            return inv.invoke();
        }
        
        if(loggedIn) {
            return inv.invoke();
        }
        
        return "login";
    }
}