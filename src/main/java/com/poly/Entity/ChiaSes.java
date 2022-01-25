package com.poly.Entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ChiaSe")
public class ChiaSes implements Serializable{
	/*
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String id;

	@ManyToOne @JoinColumn(name = "tenDN")
    NguoiDungs nguoidungs;
    @ManyToOne @JoinColumn(name = "maPhim")
    Phims phims;
	
	@Column(name="tenDN")
	private String tenDN;
	
	
	@Column(name="maPhim")
	private String maPhim;
	
	@Column(name="ngayChiaSe")
	private Date ngayChiaSe = new Date();

	@Column(name="emails")
	private String emails;
	
	
	public ChiaSes() {

	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTenDN() {
		return tenDN;
	}

	public void setTenDN(String tenDN) {
		this.tenDN = tenDN;
	}

	public String getMaPhim() {
		return maPhim;
	}

	public void setMaPhim(String maPhim) {
		this.maPhim = maPhim;
	}

	public Date getNgayChiaSe() {
		return ngayChiaSe;
	}

	public void setNgayChiaSe(Date ngayChiaSe) {
		this.ngayChiaSe = ngayChiaSe;
	}

	public String getEmails() {
		return emails;
	}

	public void setEmails(String emails) {
		this.emails = emails;
	}*/

		private static final long serialVersionUID = 1L;

		@Id
		private int id;

		private String emails;

		private Date ngayChiaSe;

		//bi-directional many-to-one association to NguoiDung
		@ManyToOne
		@JoinColumn(name="tenDN")
		private NguoiDungs nguoiDung;

		//bi-directional many-to-one association to Phim
		@ManyToOne
		@JoinColumn(name="maPhim")
		private Phims phim;

		public ChiaSes() {
		}

		public int getId() {
			return this.id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getEmails() {
			return this.emails;
		}

		public void setEmails(String emails) {
			this.emails = emails;
		}

		public Date getNgayChiaSe() {
			return this.ngayChiaSe;
		}

		public void setNgayChiaSe(Date ngayChiaSe) {
			this.ngayChiaSe = ngayChiaSe;
		}

		public NguoiDungs getNguoiDung() {
			return this.nguoiDung;
		}

		public void setNguoiDung(NguoiDungs nguoiDung) {
			this.nguoiDung = nguoiDung;
		}

		public Phims getPhim() {
			return this.phim;
		}

		public void setPhim(Phims phim) {
			this.phim = phim;
		}

	
	

	
}
