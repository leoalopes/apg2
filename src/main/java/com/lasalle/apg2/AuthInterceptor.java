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

        if(
            context.getName().equalsIgnoreCase("login") ||
            context.getName().equalsIgnoreCase("loginAction") ||
            context.getName().equalsIgnoreCase("register") ||
            context.getName().equalsIgnoreCase("registerAction")
        ) {
            return inv.invoke();
        }

        SessionMap<String,Object> session = (SessionMap<String,Object>) inv.getInvocationContext().getSession();
        if(session == null) {
            return "login";
        }

        String email = (String) session.get("loggedEmail");      
        if(email == null){                  
            return "login";
        }

        return inv.invoke();
    }
}