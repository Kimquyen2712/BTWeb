using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SachOnline.Models;
using PagedList;
using PagedList.Mvc;

namespace SachOnline.Controllers
{
    public class SachOnlineController : Controller
    {
        // GET: SachOnline
        //Tao đối tượng chứa csdl
        dbSachOnlineDataContext data = new dbSachOnlineDataContext();

        //Lấy ra sách cập nhật gần đây

            private List<Book> LaySachMoi(int count)
        {
            return data.Books.OrderByDescending(a => a.Published).Take(count).ToList();
        }
        private List<Book> LayProduct()
        {
            return data.Books.OrderByDescending(a => a.BookID).ToList();
        }
        public ActionResult Index( int ?page)
        {
            
            //return View(listSachMoi);
            
            //Tạo biến quy định số sản phẩm trên mỗi trang
            int iSize = 8;
            //Tạo biến số trang
            int iPageNum = (page ?? 1);
            var listSachMoi = LaySachMoi(16);
            return View(listSachMoi.ToPagedList(iPageNum, iSize));
        }
        public ActionResult Product(int? page)
        {

            //return View(listSachMoi);

            //Tạo biến quy định số sản phẩm trên mỗi trang
            int iSize = 8;
            //Tạo biến số trang
            int iPageNum = (page ?? 1);
            var listSachMoi = LayProduct();
            return View(listSachMoi.ToPagedList(iPageNum, iSize));
        }

        
        public ActionResult ChuDePartial()
        {
            var listChuDe = from CategoryID in data.Categories select CategoryID;
            return PartialView(listChuDe);
        }
        
        public ActionResult _NhaXuatBanPartial()
        {

            var listNXB = from NhaXuatBanID in data.NhaXuatBans select NhaXuatBanID;
            return PartialView(listNXB);
        }
        public ActionResult SachTheoChuDe(int? iMaCD, int ? page)
        {
            // var sach = from s in data.Books where s.CategoryID == id select s;
            //return View(sach);
            ViewBag.CategoryID = iMaCD;
            //Tạo biến quy định số sản phẩm trên mỗi trang
            int iSize = 3;
            //Tạo biến số trang
            int iPageNum = (page ?? 1);
            var sach = from s in data.Books where s.CategoryID == iMaCD select s;
            return View(sach.ToPagedList(iPageNum, iSize));
        }

        public ActionResult chudecss(int? iMaCD, int? page)
        {
            // var sach = from s in data.Books where s.CategoryID == id select s;
            //return View(sach);
            ViewBag.CategoryID = iMaCD;
            //Tạo biến quy định số sản phẩm trên mỗi trang
            int iSize = 4;
            //Tạo biến số trang
            int iPageNum = (page ?? 1);
            var sach = from s in data.Books where s.CategoryID == iMaCD select s;
            return View(sach.ToPagedList(iPageNum, iSize));
        }

        public ActionResult SachTheoNhaXuatBan(int? iMaNXB, int ? page)
        {
            //var sach = from s in data.Books where s.NhaXuatBanID == id select s;
            //return View(sach);
            ViewBag.NhaXuatBanID = iMaNXB;
            //Tạo biến quy định số sản phẩm trên mỗi trang
            int iSize = 3;
            //Tạo biến số trang
            int iPageNum = (page ?? 1);
            var sach = from s in data.Books where s.NhaXuatBanID == iMaNXB select s;
            return View(sach.ToPagedList(iPageNum, iSize));

        }
        public ActionResult NhaSanXuat(int? iMaNXB, int? page)
        {
            //var sach = from s in data.Books where s.NhaXuatBanID == id select s;
            //return View(sach);
            ViewBag.NhaXuatBanID = iMaNXB;
            //Tạo biến quy định số sản phẩm trên mỗi trang
            int iSize = 4;
            //Tạo biến số trang
            int iPageNum = (page ?? 1);
            var sach = from s in data.Books where s.NhaXuatBanID == iMaNXB select s;
            return View(sach.ToPagedList(iPageNum, iSize));

        }
        private List<Book> LaySachBanNhieu(int count)
        {
            return data.Books.OrderByDescending(a => a.ViewCount).Take(count).ToList();
        }
        public ActionResult SachBanNhieuPartial()
        {
            var listSachBanNhieu = LaySachBanNhieu(4);
            return View(listSachBanNhieu);
        }
        public ActionResult ChiTietSach(int id)
        {
            var sach = from s in data.Books where s.BookID == id select s;
            return View(sach.Single());
        }
        public ActionResult LoginLogout()
        {
            return PartialView("LoginLogout");
        }
        public ActionResult About()
        {
            
            return View();
        }
        public ActionResult Contact()
        {

            return View();
        }
        public ActionResult Timkiem(string searchString, int? page)
        {
            int iSize = 8;
            //Tạo biến số trang
            int iPageNum = (page ?? 1);
            
            
            var links = from l in data.Books
                        select l;

            if (!String.IsNullOrEmpty(searchString))
            {
                links = links.Where(s =>( s.Title.Contains(searchString))|| (s.Category.CategoryName.Contains(searchString)) || (s.NhaXuatBan.NhaXuatBanName.Contains(searchString)));
            }
            return View(links.ToPagedList(iPageNum, iSize));
            
        }
        public ActionResult Xem(int? page)
        {
            int iPageNum = (page ?? 1);
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")

            {
                return Redirect("~/User/Dangnhap?id=3");

            }
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            var links =
                         from l in data.CHITIETDATHANGs
                         join c in data.DONDATHANGs on l.MaDonHang equals c.MaDonHang

                         select c;
            var dem = links.Select(s => s.MaDonHang).Distinct().Count(); int iSize = dem;
            
            // if (!String.IsNullOrEmpty(TenKhachHang))
            //{
            links = links.Where(s => (s.KHACHHANG.Taikhoan == kh.Taikhoan)&&(s.KHACHHANG.Matkhau == kh.Matkhau));
            var demdon = links.Select(s => s.MaDonHang).Distinct().Count(); 
            ViewBag.DemDonHang = demdon;
            links = links.OrderByDescending(s => s.Ngaydat);
            return View(links.ToPagedList(iPageNum, iSize));
        }

        
        public ActionResult Xemlai(int? page)
        {

            int iPageNum = (page ?? 1);
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")

            {
                return Redirect("~/User/Dangnhap?id=2");

            }
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            var links =
                         from l in data.CHITIETDATHANGs
                         join c in data.DONDATHANGs on l.MaDonHang equals c.MaDonHang 

                         select c;
            var dem = links.Select(s => s.MaDonHang).Distinct().Count(); int iSize = dem;
            // if (!String.IsNullOrEmpty(TenKhachHang))
            //{
            links = links.Where(s => (s.KHACHHANG.Taikhoan == kh.Taikhoan) && (s.KHACHHANG.Matkhau == kh.Matkhau));
            links = links.OrderByDescending(s => s.Ngaydat);
            return View(links.ToPagedList(iPageNum, iSize));
        }
        public ActionResult Xemchitietcuadonhang(int id)
        {

            var order = data.DONDATHANGs.SingleOrDefault(n => n.MaDonHang == id);

            if (order == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            // Fetch details for the specific order
            var orderDetails = (from ctdh in data.CHITIETDATHANGs
                                join ctdhdh in data.DONDATHANGs on ctdh.MaDonHang equals ctdhdh.MaDonHang
                                join kh in data.KHACHHANGs on ctdhdh.MaKH equals kh.MaKH
                                join ms in data.Books on ctdh.BookID equals ms.BookID
                                where ctdh.MaDonHang == id
                                select new donhang
                                {
                                    MaDonHang = ctdh.MaDonHang,
                                    MaKH = ctdhdh.MaKH,
                                    HoTen = kh.HoTen,
                                    Ngaydat = ctdhdh.Ngaydat,
                                    Ngaygiao = ctdhdh.Ngaygiao,
                                    Soluong = ctdh.Soluong,
                                    BookID = ms.BookID,
                                    Title = ms.Title,
                                    Dongia = ctdh.Dongia,
                                    
                                }).ToList();

            // Fetch customer name for the specific order
            var customerName = data.KHACHHANGs.Where(kh => kh.MaKH == order.MaKH).Select(kh => kh.HoTen).FirstOrDefault();

            // Pass the order, customer name, and order details to the view
            var viewModel = new OrderDetailsViewModel
            {
                Order = order,
                customerName = customerName,
                OrderDetails = orderDetails
            };

            return View(viewModel);
        }
        public ActionResult MuaLaiDonHang(int madon)
        {
            // Lấy thông tin đơn hàng cần mua lại
            var orderToBuy = data.DONDATHANGs.SingleOrDefault(n => n.MaDonHang == madon);

            if (orderToBuy == null)
            {
                // Trả về trang lỗi 404 nếu không tìm thấy đơn hàng
                Response.StatusCode = 404;
                return null;
            }

            // Thực hiện các bước để mua lại đơn hàng, ví dụ: thêm đơn hàng mới với thông tin từ đơn hàng cũ
            var newOrder = new DONDATHANG
            {
                MaKH = orderToBuy.MaKH,
                Ngaydat = DateTime.Now,
                Dathanhtoan = false,
                Tinhtranggiaohang = 1,
                
                Ngaygiao = DateTime.Now.AddDays(5)
                // Thêm các thông tin khác tùy thuộc vào yêu cầu của bạn
            };

            // Lưu đơn hàng mới vào cơ sở dữ liệu
            data.DONDATHANGs.InsertOnSubmit(newOrder);
            data.SubmitChanges();

            // Thêm chi tiết đơn hàng mới
            var orderDetails = data.CHITIETDATHANGs.Where(x => x.MaDonHang == madon).ToList();

            foreach (var orderDetail in orderDetails)
            {
                var newOrderDetail = new CHITIETDATHANG
                {
                    MaDonHang = newOrder.MaDonHang,
                    BookID = orderDetail.BookID,
                    Soluong = orderDetail.Soluong,
                    Dongia = orderDetail.Dongia
                    // Thêm các thông tin khác tùy thuộc vào yêu cầu của bạn
                };

                // Lưu chi tiết đơn hàng mới vào cơ sở dữ liệu
                data.CHITIETDATHANGs.InsertOnSubmit(newOrderDetail);
            }
            data.SubmitChanges();

            // Redirect hoặc chuyển hướng đến trang xác nhận mua lại hoặc giỏ hàng
            return RedirectToAction("XacNhanMuaLai");
        }

        public ActionResult XacNhanMuaLai()
        {
            // Lấy thông tin đơn hàng cần mua lại
           
            // Hiển thị trang xác nhận mua lại hoặc giỏ hàng
            return View();
        }
        public ActionResult Xemchitietcuadonhangdatlai(int id, FormCollection f)
        {

            var order = data.DONDATHANGs.SingleOrDefault(n => n.MaDonHang == id);

            if (order == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            int thoigian;
            // Fetch details for the specific order
            var orderDetails = (from ctdh in data.CHITIETDATHANGs
                                where ctdh.MaDonHang == id
                                join ctdhdh in data.DONDATHANGs on ctdh.MaDonHang equals ctdhdh.MaDonHang
                                join kh in data.KHACHHANGs on ctdhdh.MaKH equals kh.MaKH
                                join ms in data.Books on ctdh.BookID equals ms.BookID
                             
                                select new donhang
                                {
                                    MaDonHang = ctdh.MaDonHang,
                                    MaKH = ctdhdh.MaKH,
                                    HoTen = kh.HoTen,
                                    Ngaydat = DateTime.Now,
                                    //Ngaygiao = DateTime.Parse(string.Format("{0:MM//dd/yyyy}", f["Ngaygiao"])),
                                     

                                     Soluong = ctdh.Soluong,
                                    
                                    BookID = ms.BookID,
                                    Title = ms.Title,
                                    Dongia = ctdh.Dongia,
                                    
                                }).ToList();


            // Fetch customer name for the specific order
            var customerName = data.KHACHHANGs.Where(kh => kh.MaKH == order.MaKH).Select(kh => kh.HoTen).FirstOrDefault();

            // Pass the order, customer name, and order details to the view
            var viewModel = new OrderDetailsViewModel
            {
                Order = order,
                customerName = customerName,
                OrderDetails = orderDetails
            };

            return View(viewModel);
        }
        public ActionResult taikhoan(int? page)
        {
            
            int iPageNum = (page ?? 1);
            if (Session["TaiKhoan"] == null || Session["TaiKhoan"].ToString() == "")

            {
                return Redirect("~/User/Dangnhap?id=3");

            }
            KHACHHANG kh = (KHACHHANG)Session["Taikhoan"];
            var sach = data.KHACHHANGs.SingleOrDefault(n => n.MaKH == kh.MaKH);
            
            return View(sach);
        }
    }
}