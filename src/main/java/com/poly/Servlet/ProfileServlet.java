package com.poly.Servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import com.poly.DAO.BinhLuanDAO;
import com.poly.DAO.NguoiDungDAO;
import com.poly.DAO.TheLoaiDAO;
import com.poly.DAO.YeuThichDAO;
import com.poly.Entity.NguoiDungs;
import com.poly.Entity.TheLoais;
import com.poly.Utils.JpaUtils;

@WebServlet({ "/ProfileServlet", "/page/profile/index", "/page/profile/update", "/update" })
public class ProfileServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		TheLoaiDAO daotl = new TheLoaiDAO();
		List<TheLoais> listTL = daotl.findAll();
		req.setAttribute("nav", listTL);

		String id = (String) req.getSession().getAttribute("taiKhoan");
		NguoiDungDAO dao = new NguoiDungDAO();
		BinhLuanDAO daoBL = new BinhLuanDAO();
		YeuThichDAO daoYT = new YeuThichDAO();
		NguoiDungs entity = dao.findById(id);

		req.setAttribute("comment", daoBL.countById(id));
		req.setAttribute("profile", entity);
		req.setAttribute("path", "Thông tin");
		req.setAttribute("favorite", daoYT.countById(id));

		req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
//		doUpdate(req, resp);
		
		
		String id = (String) req.getSession().getAttribute("taiKhoan");
		NguoiDungDAO dao = new NguoiDungDAO();
		NguoiDungs entity = dao.findById(id);
//		System.out.println("Test ID >> " + id);
//		System.out.println("Test Entity >> " + entity.getEmail());
		
		entity.setEmail("nghiaupdate123@gmail.com");
		entity.setHo("Trung");
		entity.setTen("Nghĩa");
		entity.setMatKhau("nghiatran123");
		dao.update(entity);
		
		String Ho = req.getParameter("Ho");
		String Ten = req.getParameter("Ten");
		String Email = req.getParameter("Email");
		String matKhau = req.getParameter("matKhau");
		String xnMatKhau = req.getParameter("xnMatKhau");
//		System.out.println("Test matKhau >> " + matKhau);
		doGet(req, resp);
//		
//		String uri = req.getRequestURI();
//		if (uri.contains("update")) {
//			
//		}

		/*
		 * EntityManager em = JpaUtils.getEntityManager(); // NguoiDungDAO dao = new
		 * NguoiDungDAO(); NguoiDungs entity = new NguoiDungs();
		 * 
		 * 
		 * TheLoaiDAO daotl = new TheLoaiDAO(); List<TheLoais> listTL = daotl.findAll();
		 * req.setAttribute("nav", listTL);
		 * 
		 * String id = (String) req.getSession().getAttribute("taiKhoan"); NguoiDungDAO
		 * dao = new NguoiDungDAO(); BinhLuanDAO daoBL = new BinhLuanDAO(); YeuThichDAO
		 * daoYT = new YeuThichDAO(); entity = dao.findById(id);
		 * 
		 * try {
		 * 
		 * BeanUtils.populate(entity, req.getParameterMap());
		 * 
		 * // String id = (String) req.getSession().getAttribute("taiKhoan"); String Ho
		 * = req.getParameter("Ho"); String Ten = req.getParameter("Ten"); String Email
		 * = req.getParameter("Email"); String matKhau = req.getParameter("matKhau"); //
		 * String xnMatKhau = req.getParameter("xnMatKhau");
		 * 
		 * // entity = em.find(NguoiDungs.class, id);
		 * 
		 * if (entity != null) { // entity.setTenDN(id); entity.setHo(Ho);
		 * entity.setTen(Ten); entity.setEmail(Email); entity.setMatKhau(matKhau); try {
		 * em.getTransaction().begin(); em.merge(entity); em.getTransaction().commit();
		 * } catch (Exception e) { em.getTransaction().rollback(); throw new
		 * RuntimeException(e); } } } catch (Exception e) {
		 * 
		 * } req.setAttribute("comment", daoBL.countById(id));
		 * req.setAttribute("profile", entity); req.setAttribute("path", "Thông tin");
		 * req.setAttribute("favorite", daoYT.countById(id));
		 * req.getRequestDispatcher("/views/profile.jsp").forward(req, resp); //
		 * req.getRequestDispatcher("/page/profile/index").forward(req, resp);
		 */

	}

	private void doUpdate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");

		String id = (String) req.getSession().getAttribute("taiKhoan");
		NguoiDungDAO dao = new NguoiDungDAO();
		NguoiDungs entity = dao.findById(id);
		System.out.println("Test ID >> " + id);
		System.out.println("Test Entity >> " + entity.getEmail());
		
		String Ho = req.getParameter("Ho");
		String Ten = req.getParameter("Ten");
		String Email = req.getParameter("Email");
		String matKhau = req.getParameter("matKhau");
		String xnMatKhau = req.getParameter("xnMatKhau");
		System.out.println("Test matKhau >> " + matKhau);
		
		/*
		NguoiDungDAO dao = new NguoiDungDAO();
		NguoiDungs entity = dao.findById(id);
		entity.setTenDN(id);
		entity.setHo(Ho);
		entity.setTen(Ten);
		entity.setEmail(Email);
		entity.setMatKhau(matKhau);
		dao.update(entity);
		*/

		
//		if(matKhau.equals(xnMatKhau) == false) {
//			req.setAttribute("backround", "danger");
//			req.setAttribute("message", "Xác nhận mật khẩu không khớp!");
//			req.setAttribute("check", "true");
//		}
//		else {
//			req.setAttribute("check", null);
//			entity.setHo(Ho);
//			entity.setTen(Ten);
//			entity.setEmail(Email);
//			entity.setMatKhau(xnMatKhau);
//			
//			dao.update(entity);
//			
//	
//		}
//		req.getRequestDispatcher("/views/profile.jsp").forward(req, resp);

		doGet(req, resp);
	}

}
