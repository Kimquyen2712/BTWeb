using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace SachOnline.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin/Admin
        dbSachOnlineDataContext db = new dbSachOnlineDataContext();
        public ActionResult Index(int? page)
        {
            if (Session["Admin"] == null || Session["Admin"].ToString() == "")

            {
                return RedirectToAction("Login","Home");

            }
            else

            {
                ADMIN kh = (ADMIN)Session["Admin"];
                var sach = db.ADMINs.SingleOrDefault(n => n.Quyen == kh.Quyen);
                if(sach.Quyen == 1)
                {
                    int iPageNum = (page ?? 1);
                    int iPageSize = 7;
                    return View(db.ADMINs.ToList().OrderBy(n => n.MaAdmin).ToPagedList(iPageNum, iPageSize));
                }
                return RedirectToAction("Quyenthaotac", "Home");

            }
        }
        [HttpGet]
        public ActionResult Create()
        {
            //Lấy ds từ các table ChuDe, NhaXuatBan, Hiển thị tên, khi chọn sẽ lấy mã
            ViewBag.Quyen = new SelectList(db.QUYENs.ToList().OrderBy(n => n.QuyenName), "Quyen", "QuyenName");
            
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(ADMIN admin, FormCollection f)
        {
            //Ðưa dữ liệu vào DropDown
            ViewBag.Quyen = new SelectList(db.QUYENs.ToList().OrderBy(n => n.QuyenName), "Quyen", "QuyenName");

            if (f["sHoTen"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Nhập họ tên nhân viên";

                return View();
            }
            else if (f["sDiaChi"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Nhập địa chỉ nhân viên";

                return View();
            }
            else if (f["sDienThoai"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Nhập điện thoại nhân viên";

                return View();
            }
            else if (f["sTenDN"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Nhập tài khoản nhân viên";

                return View();
            }
            else if (f["sMatKhau"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Nhập mật khẩu nhân viên";

                return View();
            }
           
            else if (f["sNgaySinh"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Nhập ngày sinh nhân viên";

                return View();
            }
            else if (f["sEmail"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Nhập email nhân viên";

                return View();
            }

            else if (f["Quyen"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Chọn quyền";

                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {

                    //Lưu Sach vào csdl

                    admin.HoTen = f["sHoTen"];
                    admin.TenDN = f["sTenDN"];
                    admin.MatKhau = f["sMatKhau"];

                    admin.Email = f["sEmail"];
                    admin.DiaChi = f["sDiaChi"];
                    admin.DienThoai = f["sDienThoai"];
                    admin.NgaySinh = Convert.ToDateTime(f["sNgaySinh"]);
                    admin.Quyen = int.Parse(f["Quyen"]);
                    
                    db.ADMINs.InsertOnSubmit(admin);
                    db.SubmitChanges();
                    //Về lại trang Quản lý sách
                    return RedirectToAction("Index");
                }
                return View();
            }
        }

        public ActionResult Details(int id)
        {
            var sach = db.ADMINs.SingleOrDefault(n => n.MaAdmin == id);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var sach = db.ADMINs.SingleOrDefault(n => n.MaAdmin == id);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sach);
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int id, FormCollection f)
        {
            var sach = db.ADMINs.SingleOrDefault(n => n.MaAdmin == id);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            
            //Xóa sách
            db.ADMINs.DeleteOnSubmit(sach);
            db.SubmitChanges();

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var sach = db.ADMINs.SingleOrDefault(n => n.MaAdmin == id);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Hiển thị danh sách chủ đề và nhà xuất bản đồng thời chọn chủ đề và nhà xuất bản của cuốn hiện tại
            ViewBag.Quyen = new SelectList(db.QUYENs.ToList().OrderBy(n => n.QuyenName), "Quyen", "QuyenName", sach.Quyen);
            
            return View(sach);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f)
        {
            var admin = db.ADMINs.SingleOrDefault(n => n.MaAdmin == int.Parse(f["sMaAdmin"]));
            ViewBag.Quyen = new SelectList(db.QUYENs.ToList().OrderBy(n => n.QuyenName), "Quyen", "QuyenName", admin.Quyen);
            
            if (ModelState.IsValid)
            {


                //Lưu sách vào cơ sở dữ liệu
                admin.HoTen = f["sHoTen"];
                admin.TenDN = f["sTenDN"];
                admin.MatKhau = f["sMatKhau"];

                admin.Email = f["sEmail"];
                admin.DiaChi = f["sDiaChi"];
                admin.DienThoai = f["sDienThoai"];
                admin.NgaySinh = Convert.ToDateTime(f["sNgaySinh"]);
                admin.Quyen = int.Parse(f["Quyen"]);

                db.SubmitChanges();
                //Về lại trang Quản lý sách
                return RedirectToAction("Index");
            }
            return View(admin);
        }
    }
}