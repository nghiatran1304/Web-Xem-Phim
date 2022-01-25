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
import com.poly.Entity.FavoriteUserReport;
import com.poly.Entity.Phims;
import com.poly.Entity.Reports;
import com.poly.Entity.ShareUserEmail;
import com.poly.Utils.JpaUtils;

/**
 * Servlet implementation class VideoByYearServlet
 */
@WebServlet({ "/VideoByYearServlet", "/user", "/sendEmail" })
public class VideoByYearServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public VideoByYearServlet() {
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
//		EntityManager em = JpaUtils.getEntityManager();
//		String jpql = "SELECT o FROM YeuThichs o";
//		TypedQuery<YeuThichs> query = em.createQuery(jpql, YeuThichs.class);
//		List<YeuThichs> list = query.getResultList();
//		request.setAttribute("listVideos", list);
//		
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "SELECT NEW com.poly.Entity.Reports(o.phims.Title, count(o),"
				+ " MAX(o.ngayThich), MIN(o.ngayThich))" + " FROM YeuThichs o" + " WHERE YEAR(o.ngayThich) = ?0"
				+ " GROUP BY o.phims.Title";
		TypedQuery<Reports> query = em.createQuery(jpql, Reports.class);
		query.setParameter(0, 2021);
		List<Reports> list = query.getResultList();

		request.setAttribute("favList", list);

		PhimDAO phimDAO = new PhimDAO();

		List<Phims> list1 = phimDAO.findAll();
		request.setAttribute("listVideos", list1);

		request.getRequestDispatcher("/manager/thongke.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		EntityManager em = JpaUtils.getEntityManager();
		String uri = request.getRequestURI();
		if (uri.contains("user")) {
			PhimDAO phimDAO = new PhimDAO();
			List<Phims> list1 = phimDAO.findAll();
			request.setAttribute("listVideos", list1);

			String videoId = request.getParameter("maPhim");

//			System.out.println("Ma phim >>  " + videoId);

			String jpql = "SELECT NEW com.poly.Entity.FavoriteUserReport(f.nguoidungs.tenDN, f.nguoidungs.Ten, f.nguoidungs.Email, f.ngayThich)"
					+ " FROM YeuThichs f WHERE f.phims.maPhim = :maPhim";

			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class);
			query.setParameter("maPhim", videoId);
			List<FavoriteUserReport> list = query.getResultList();
//			System.out.println(list.size() > 0 ? "Co" : "Rong"); 
			

			request.setAttribute("listVideos", list1);
			request.setAttribute("favUsers", list);
			request.getRequestDispatcher("/manager/thongke.jsp").forward(request, response);
		} else {
			Integer year = Integer.valueOf(request.getParameter("year"));
			String jpql = "SELECT NEW com.poly.Entity.Reports(o.phims.Title, count(o),"
					+ " MAX(o.ngayThich), MIN(o.ngayThich))" + " FROM YeuThichs o" + " WHERE YEAR(o.ngayThich) = ?0"
					+ " GROUP BY o.phims.Title";
			TypedQuery<Reports> query = em.createQuery(jpql, Reports.class);
			query.setParameter(0, year);
			List<Reports> list = query.getResultList();

			request.setAttribute("favList", list);

			PhimDAO phimDAO = new PhimDAO();

			List<Phims> list1 = phimDAO.findAll();
			request.setAttribute("listVideos", list1);
			request.getRequestDispatcher("/manager/thongke.jsp").forward(request, response);
		}
	}

}
