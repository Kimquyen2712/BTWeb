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
            var matkhau = collection["MatKhau"];
            var matkhaunhaplai = collection["MatKhauNL"];
            var diachi = collection["DiaChi"];
            var email = collection["Email"];
            var dienthoai = collection["DienThoai"];
            var ngaysinh = String.Format("{0:MM/dd/yyyy}", collection["NgaySinh"]);
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
            else if (String.IsNullOrEmpty(email))
            {
                ViewData["Loi5"] = "Email khong duoc bo trong  ";

            }
            else if (String.IsNullOrEmpty(dienthoai))
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
                return Redirect("~/User/Dangnhap?id=1");



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
            
            //gán các giá trị người dùng nhập cho biến
            var tendn = collection["TenDN"];
            var matkhau = collection["MatKhau"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";
                //ViewBag.Loi1 = "Phải nhập tên đăng nhập";

            }
            else if (string.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu";
            }
            else
            {
                int state = int.Parse(Request.QueryString["id"]);
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
                    else if(state ==3)
                    {
                        return RedirectToAction("taikhoan", "SachOnline");
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
        [HttpGet]
        public ActionResult QuenMatKhauSoDienThoai()
        {

            return View();
        }
        [HttpPost]
        public ActionResult QuenMatKhauSoDienThoai(FormCollection collection)
        {
            var soDienThoai = collection["DienThoaiKH"];
            var email = collection["Email"];
            // Kiểm tra xem số điện thoại có tồn tại trong CSDL hay không
            var khachHang = data.KHACHHANGs.SingleOrDefault(kh => kh.DienThoaiKH == soDienThoai && kh.Email== email);
            
            if (khachHang != null)
            {
                // Tạo mật khẩu mới (bạn có thể sử dụng logic phức tạp hơn nếu cần)
                return RedirectToAction("matkhaumoi", "User", new {khachHang.MaKH});


                // Gửi mật khẩu mới đến số điện thoại hoặc thông báo cho người dùng biết


            }
            else
            {
                ViewBag.ThongBao = "Số điện thoại hoặc email không đúng.";
                return View();
            }
        }
        [HttpGet]
        public ActionResult matkhaumoi()
        {
            

            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult matkhaumoi(FormCollection f)
        {
            var sach = data.KHACHHANGs.SingleOrDefault(n=>n.Taikhoan == f["TenDN"] && n.DienThoaiKH == f["Dienthoai"]);

            if (ModelState.IsValid)
            {


                //Lưu sách vào cơ sở dữ liệu
                
                if(f["Matkhau1"] == f["Matkhau2"]) { sach.Matkhau = f["Matkhau1"]; }
                

                


                data.SubmitChanges();
                //Về lại trang Quản lý sách
                return RedirectToAction("thanhcong");
            }
            return View(sach);
        }

        [HttpGet]
        public ActionResult thaydoi()
        {
           
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")

            {
                return Redirect("~/User/Dangnhap?id=3");

            }
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            var sach = data.KHACHHANGs.SingleOrDefault(n => n.MaKH ==kh.MaKH );
            return View(sach);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult thaydoi(FormCollection f)
        {
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            var sach = data.KHACHHANGs.SingleOrDefault(n => n.Taikhoan == kh.Taikhoan && n.Matkhau == kh.Matkhau);

            if (sach.Taikhoan == kh.Taikhoan)
            {
                if (ModelState.IsValid)
                {


                    //Lưu sách vào cơ sở dữ liệu
                    sach.HoTen= f["HoTen"];

                    sach.DiachiKH = f["DiachiKH"];
                    sach.Email = f["Email"];
                    sach.DienThoaiKH = f["DienThoaiKH"];
                    sach.Ngaysinh = Convert.ToDateTime(f["Ngaysinh"]);



                    data.SubmitChanges();
                    //Về lại trang Quản lý sách
                    return RedirectToAction("thanhcong");
                }
            }
            return View(sach);
        }
        public ActionResult thanhcong()
        {
            return View();
        }

        [HttpGet]
        public ActionResult thaydoimatkhau()
        {


            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult thaydoimatkhau(FormCollection f)
        {
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            var sach = data.KHACHHANGs.SingleOrDefault(n => n.Taikhoan == kh.Taikhoan && n.Matkhau == kh.Matkhau);

            if (ModelState.IsValid)
            {


                //Lưu sách vào cơ sở dữ liệu

                if (f["Matkhau3"] == f["Matkhau4"]) { sach.Matkhau = f["Matkhau3"]; }





                data.SubmitChanges();
                //Về lại trang Quản lý sách
                return RedirectToAction("thanhcong");
            }
            ViewData["Loi1"] = "Hai mật khẩu phaỉ trùng khớp";
            return View(sach);
        }

    }

}
