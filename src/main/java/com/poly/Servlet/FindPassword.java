package com.poly.Servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.DAO.NguoiDungDAO;
import com.poly.Entity.NguoiDungs;

/**
 * Servlet implementation class FindPassword
 */
@WebServlet("/FindPassword")
public class FindPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindPassword() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/views/FindPassword.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String id = request.getParameter("tenDN");
		NguoiDungDAO userDAO = new NguoiDungDAO();
		NguoiDungs user = userDAO.findById(id);
		String email = request.getParameter("email");

		if (user != null) {

			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.auth", "true");

			String username = "testemailnghiatran@gmail.com";
			String password = "a123456789A123";
			Session session = Session.getInstance(props, new Authenticator() {
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			});

			String emailTo = request.getParameter("email");
			String emailSubject = "LẤY LẠI MẬT KHẨU";
			String emailContent = "Mật khẩu của bạn là : " + user.getMatKhau();

			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(username));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailTo));
				message.setSubject(emailSubject, "UTF-8");
				message.setText(emailContent, "UTF-8", "html");
				// message.setContent(emailContent, "text/html; charset=utf-8");
				Transport.send(message);
				request.setAttribute("success", "Thành công");
				request.getRequestDispatcher("/views/FindPassword.jsp").forward(request, response);
			} catch (Exception e) {
				request.setAttribute("message", "Thất bại");
				request.getRequestDispatcher("/views/FindPassword.jsp").forward(request, response);
				e.printStackTrace();
			}
		} else {
			request.setAttribute("message", "Thất bại");
			request.getRequestDispatcher("/views/FindPassword.jsp").forward(request, response);
		}
	}

}
