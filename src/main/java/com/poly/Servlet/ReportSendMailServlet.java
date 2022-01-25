package com.poly.Servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.DAO.PhimDAO;
import com.poly.Entity.Phims;
import com.poly.Entity.ShareUserEmail;
import com.poly.Utils.JpaUtils;

/**
 * Servlet implementation class ReportSendMailServlet
 */
@WebServlet("/ReportSendMailServlet")
public class ReportSendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportSendMailServlet() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		EntityManager em = JpaUtils.getEntityManager();
		PhimDAO phimDAO = new PhimDAO();
		List<Phims> list1 = phimDAO.findAll();
		request.setAttribute("listVideos", list1);

		String maPhim = request.getParameter("maPhim");
		System.out.println("Ma phim >>> " + maPhim);
		
		String jpql = "SELECT NEW com.poly.Entity.ShareUserEmail(s.nguoiDung.tenDN, s.nguoiDung.Email, s.emails, s.ngayChiaSe) "
				+ "FROM ChiaSes s WHERE s.phim.maPhim = :maPhim";
		TypedQuery<ShareUserEmail> query = em.createQuery(jpql, ShareUserEmail.class);
		
		query.setParameter("maPhim", maPhim);
		List<ShareUserEmail> list = query.getResultList();
		System.out.println(list.size() > 0 ? "Co" : "Rong");

		request.setAttribute("lstUserMail", list);
		request.getRequestDispatcher("/manager/thongke.jsp").forward(request, response);

	}

}
