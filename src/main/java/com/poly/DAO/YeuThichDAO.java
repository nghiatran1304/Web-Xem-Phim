package com.poly.DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import com.poly.Entity.FavoriteUserReport;
import com.poly.Entity.Phims;
import com.poly.Entity.YeuThichs;
import com.poly.Utils.JpaUtils;

public class YeuThichDAO {
	private EntityManager em = JpaUtils.getEntityManager();
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
	    em.close();
	    super.finalize();
	}
	
	public YeuThichs create(YeuThichs entity) {
		try {
			em.getTransaction().begin();
			em.persist(entity);
			em.getTransaction().commit();
			return entity;
		}catch(Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException(e);
		}
	}
	
	public YeuThichs update(YeuThichs entity) {
		try {
			em.getTransaction().begin();
			em.merge(entity);
			em.getTransaction().commit();
			return entity;
		}catch(Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}
	
	public YeuThichs delete(Long id) {
			YeuThichs entity = this.findById(id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return entity;
		}catch(Exception e) {
			em.getTransaction().rollback();
			throw new RuntimeException();
		}
	}
	
	public YeuThichs findById(Long id) {
		YeuThichs entity = em.find(YeuThichs.class, id);
		return entity;
	}
	
	public List<YeuThichs> findAll(){
		String jpql = "Select o from YeuThichs o";
		TypedQuery<YeuThichs> query = em.createQuery(jpql, YeuThichs.class);
		List<YeuThichs> list = query.getResultList();
		return list;
	}
	
	public YeuThichs selectByUser(String user, String film) {
		String jpql = "select o from YeuThichs o where (o.phims.maPhim like :film) and (o.nguoidungs.tenDN like :user)";
		TypedQuery<YeuThichs> query = em.createQuery(jpql, YeuThichs.class);
		query.setParameter("film", film);
		query.setParameter("user", user);
		YeuThichs entity =  query.getSingleResult();
		return entity;
	}
	
	public Long countById(String id) {
		String jpql = "select count(o) from YeuThichs o where o.nguoidungs.tenDN like :uid";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter("uid", id);
		long result = query.getSingleResult();
		return result;
	}
	
	public List<Phims> fillToFavo(String id){
		String jpql = "select * from Phim inner join YeuThich on Phim.maPhim = YeuThich.maPhim where tenDN like :uid";
		Query query = em.createNativeQuery(jpql, Phims.class);
		query.setParameter("uid", id);
		List<Phims> list = query.getResultList();
		return list;
	}
	
	public Long selectId(String idP, String idND) {
		String jpql = "select o.maYeuThich from YeuThichs o where o.phims.maPhim like :up and o.nguoidungs.tenDN like :und";
		TypedQuery<Long> query = em.createQuery(jpql, Long.class);
		query.setParameter("up", idP);
		query.setParameter("und", idND);
		long result = query.getSingleResult();
		return result;
	}
	
	public List<Phims> getListMoveTitle(){
		String jpql = "select * from Phim inner join YeuThich on Phim.maPhim = YeuThich.maPhim where tenDN like :uid";
		Query query = em.createNativeQuery(jpql, Phims.class);
		return query.getResultList();
	}
	
	public List<Phims> getListFavorites(){
		String jpql = "Select o from Phims o where o.yeuThich.maPhim = o.maPhim";
		TypedQuery<Phims> query = em.createQuery(jpql, Phims.class);
		List<Phims> list = query.getResultList();
		return list;
	}
	
	public List<FavoriteUserReport> reportFavoriteUsersByVideo(String videoId){
		String jpql = "SELECT NEW com.poly.Entity.FavoriteUserReport(f.nguoidungs.tenDN, f.nguoidungs.Ten, f.nguoidungs.Email, f.ngayThich)"
				+ " FROM YeuThichs f WHERE f.phims.maPhim = :maPhim";
		
		EntityManager em = JpaUtils.getEntityManager();
		
		List<FavoriteUserReport> list = null;
		
		try {
			TypedQuery<FavoriteUserReport> query = em.createQuery(jpql, FavoriteUserReport.class);
			query.setParameter("maPhim", videoId);
			list = query.getResultList();
		} finally {
			em.close();
		}
		return list.size() > 0 ? list : null;
	}
	
	
}
