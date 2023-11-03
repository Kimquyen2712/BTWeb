using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;

namespace SachOnline.Controllers
{
    public class UserController : Controller
    {
        dbSachOnlineDataContext data = new dbSachOnlineDataContext();
        // GET: User
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
       public ActionResult Dangky()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangky(FormCollection collection, KHACHHANG kh)
        {
            var hoten = collection["Hoten"];
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            var matkhaunhaplai = collection["Matkhaunhaplai"];
            var diachi = collection["Diachi"];
            var email = collection["Email"];
            var dienthoai = collection["Dienthoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["Ngaysinh"]);
            if (String.IsNullOrEmpty(hoten))
            {
                ViewData["Loi1"] = "Ho ten khach hang khong duoc de trong";
            }
            else if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi2"] = "Phai nhap ten dang nhap";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi3"] = "Phai nhap mat khau";
            }
            else if (String.IsNullOrEmpty(matkhaunhaplai))
            {
                ViewData["Loi4"] = "Phai nhap lai mat khau";
            }
            if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Email khong duoc bo trong  ";

            }
            if (String.IsNullOrEmpty(dienthoai))
            {
                ViewData["Loi6"] = "Phai nhap dien thoai";
            }
            else
            {
                kh.HoTen = hoten;
                kh.Taikhoan = tendn;
                kh.Matkhau = matkhau;
                kh.Email = email;
                kh.DiachiKH = diachi;
                kh.DienThoaiKH = dienthoai;
                kh.Ngaysinh = DateTime.Parse(ngaysinh);
               data.KHACHHANGs.InsertOnSubmit(kh);
               data.SubmitChanges();
                return RedirectToAction("Dangnhap");

            }
            return this.Dangky();
        }
        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Dangnhap(FormCollection collection)
        {
            int state = int.Parse(Request.QueryString["id"]);
            //gán các giá trị người dùng nhập cho biến
            var tendn = collection["TenDN"];
            var matkhau = collection["Matkhau"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewBag["Loi1"] = "Phải nhập tên đăng nhập";
            }
            else if (string.IsNullOrEmpty(matkhau))
            {
                ViewBag["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                //gán giá trị cho đôi tượng tạo mới(kh)
                KHACHHANG kh = data.KHACHHANGs.SingleOrDefault(n => n.Taikhoan == tendn && n.Matkhau == matkhau);
                if(kh != null)
                {
                    ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                    Session["Taikhoan"] = kh;
                    if(state ==1)
                    {
                        return RedirectToAction("Index", "SachOnline");
                    }
                    else
                    {
                        return RedirectToAction("DatHang", "GioHang");
                    }
                    
                }
                else { ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng"; }
            }
            return View();
        }
        public ActionResult Dangxuat()
        {
            // Xóa thông tin đăng nhập của người dùng, ví dụ: xóa Session
            Session["TaiKhoan"] = null;

            // Redirect về trang chính hoặc trang đăng nhập
            return RedirectToAction("Index", "SachOnline"); // Điều hướng về trang chính
        }

        //public ActionResult LoginLogout()
        //{
        //return PartialView("LoginLogoutPartial");
        // }
    }
}
