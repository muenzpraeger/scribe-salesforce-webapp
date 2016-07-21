package com.winkelmeyer.salesforce.scribe.controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.winkelmeyer.salesforce.scribe.ScribeHelper;

@WebServlet(name = "DemoServlet", urlPatterns = { "/demo", "/demo/callback" })
public class DemoServlet extends HttpServlet {

    private static final long serialVersionUID = 3168944695878864086L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String reqParameter = "";

        if (req.getRequestURI().contains("callback")) {
            reqParameter = req.getParameter("code");
            if (reqParameter != null) {
                String code = URLDecoder.decode(reqParameter, "UTF-8");
                String accessToken = ScribeHelper.getInstance().getAccessToken(code);
                req.getSession().setAttribute("accessToken", accessToken);
            }
        }

        req.getRequestDispatcher("/demo.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String reqParameter = "";

        if (req.getParameterMap().size() > 0) {
            reqParameter = req.getParameter("action");

            if (reqParameter != null) {
                switch (reqParameter) {
                case "oauth":
                    String redirectUrl = ScribeHelper.getInstance()
                            .getAuthorizationUrl(req.getRequestURL() + "/demo/callback");
                    resp.sendRedirect(redirectUrl);
                    return;
                case "userdata":
                    String userData = ScribeHelper.getInstance().getUserData();
                    if (userData != null) {
                        req.getSession().setAttribute("jsonResponse", userData);
                    }
                    break;
                case "accountdata":
                    String accountData = ScribeHelper.getInstance().getAccountData();
                    if (accountData != null) {
                        req.getSession().setAttribute("jsonResponse", accountData);
                    }
                    break;
                }
                req.getRequestDispatcher("/demo.jsp").forward(req, resp);
            }
        }

    }

}
