package com.poly.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.DAO.NguoiDungDAO;
import com.poly.Entity.NguoiDungs;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		Cookie[] listCookie = req.getCookies();
		String tenDN = "";
		String matKhau = "";
		String luuTK = "";
		int co = 0;
		if (listCookie != null) {
			while (co < listCookie.length) {
				if (listCookie[co].getName().equals("tenDN")) {
					tenDN = listCookie[co].getValue();
				}
				if (listCookie[co].getName().equals("matKhau")) {
					matKhau = listCookie[co].getValue();
				}
				if (listCookie[co].getName().equals("luuTK")) {
					luuTK = listCookie[co].getValue();
				}
				co++;
			}
		}

		req.setAttribute("tenDN", tenDN);
		req.setAttribute("matKhau", matKhau);
		req.setAttribute("luuTK", luuTK);
		req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		String tenDN = req.getParameter("tenDN");
		String matKhau = req.getParameter("matKhau");
     //   String luuTK = req.getParameter("luuTK");
		int i = 0;
		if (i == 0) {
			if (tenDN.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Vui lòng nhập tên đăng nhập!");
				req.setAttribute("show", "true");
			} else {
				doFill(req, resp);
				i++;
			}
		}
		if (i == 1) {
			if (matKhau.isEmpty()) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Vui lòng nhập mật khẩu!");
				req.setAttribute("show", "true");
			} else {
				doFill(req, resp);
				i++;
			}
		}
		if (i == 2) {
			NguoiDungDAO dao = new NguoiDungDAO();
			NguoiDungs entity = new NguoiDungs();
			entity = dao.findById(tenDN);

			if (entity == null) {
				doFill(req, resp);
				req.setAttribute("backround", "danger");
				req.setAttribute("message", "Tài khoản không đúng !");
				req.setAttribute("show", "true");
			} else {
				if (matKhau.equals(entity.getMatKhau()) == false) {
					doFill(req, resp);
					req.setAttribute("backround", "danger");
					req.setAttribute("message", "Mật khẩu không đúng !");
					req.setAttribute("show", "true");
				} else {

					req.getSession().setAttribute("taiKhoan", tenDN);
					Cookie user = new Cookie("tenDN", tenDN);
					Cookie password = new Cookie("matKhau", matKhau);
					Cookie remember = new Cookie("luuTK", "true");

					if (req.getParameter("luuTK") != null) {
						user.setMaxAge(60 * 60 * 24);
						password.setMaxAge(60 * 60 * 24);
						remember.setMaxAge(60*60*24);
					} else {
						user.setMaxAge(0);
						password.setMaxAge(0);
						remember.setMaxAge(0);
					}
					resp.addCookie(user);
					resp.addCookie(password);
					resp.addCookie(remember);
					if(entity.isVaiTro()) {
						resp.sendRedirect("/WebMovie/manager/index.jsp");
					}
					else {
						resp.sendRedirect("/WebMovie/index");
					}					
				}
			}
		}
		try {
			req.getRequestDispatcher("/views/login.jsp").forward(req, resp);
		} catch (Exception e) {

		}
	}

	private void doFill(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String tenDN = req.getParameter("tenDN");
		String matKhau = req.getParameter("matKhau");
		Boolean luuTK = Boolean.valueOf(req.getParameter("luuTK"));
		req.setAttribute("tenDN", tenDN);
		req.setAttribute("matKhau", matKhau);
		req.setAttribute("luuTK", luuTK);
	}

}
