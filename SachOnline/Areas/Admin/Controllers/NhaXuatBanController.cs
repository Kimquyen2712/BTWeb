﻿using System;
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
    public class NhaXuatBanController : Controller
    {
        dbSachOnlineDataContext db = new dbSachOnlineDataContext();


        public ActionResult Index(int? page)
        {
            if (Session["Admin"] == null || Session["Admin"].ToString() == "")

            {
                return RedirectToAction("Login", "Home");

            }
            else

            {
                ADMIN admina = (ADMIN)Session["Admin"];
                var sach = db.ADMINs.SingleOrDefault(n => n.Quyen == admina.Quyen);
                if (sach.Quyen == 1)
                {
                    int iPageNum = (page ?? 1);
                    int iPageSize = 10;
                    return View(db.NhaXuatBans.ToList().OrderBy(n => n.NhaXuatBanID).ToPagedList(iPageNum, iPageSize));
                }
                return RedirectToAction("Quyenthaotac", "Home");

            }
           
        }
        [HttpGet]
        public ActionResult Create()
        {

            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(NhaXuatBan nhaxuatban, FormCollection f)
        {

            if (f["sNhaXuatBanName"] == null)
            {
                //Nội dung thông báo yêu cầu chọn ảnh bìa
                ViewBag.Thongbao = "Hãy nhập tên chủ đề";

                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {


                    nhaxuatban.NhaXuatBanName = f["sNhaXuatBanName"];
                    db.NhaXuatBans.InsertOnSubmit(nhaxuatban);
                    db.SubmitChanges();
                    //Về lại trang Quản lý sách
                    return RedirectToAction("Index");
                }
                return View();
            }
        }
        public ActionResult Details(int id)
        {
            var sach = db.NhaXuatBans.SingleOrDefault(n => n.NhaXuatBanID == id);
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
            var chude = db.NhaXuatBans.SingleOrDefault(n => n.NhaXuatBanID == id);
            if (chude == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chude);
        }
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(int id, FormCollection f)
        {
            var chude = db.NhaXuatBans.SingleOrDefault(n => n.NhaXuatBanID == id);
            if (chude == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Xóa sách
            db.NhaXuatBans.DeleteOnSubmit(chude);
            db.SubmitChanges();

            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var sach = db.NhaXuatBans.SingleOrDefault(n => n.NhaXuatBanID == id);
            if (sach == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Hiển thị danh sách chủ đề và nhà xuất bản đồng thời chọn chủ đề và nhà xuất bản của cuốn hiện tại
            ViewBag.NhaXuatBanID = new SelectList(db.NhaXuatBans.ToList().OrderBy(n => n.NhaXuatBanName), "NhaXuatBanID", "NhaXuatBanName", sach.NhaXuatBanID);
            return View(sach);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(FormCollection f)
        {
            var sach = db.NhaXuatBans.SingleOrDefault(n => n.NhaXuatBanID == int.Parse(f["iNhaXuatBanID"]));

            if (ModelState.IsValid)
            {


                //Lưu sách vào cơ sở dữ liệu
                sach.NhaXuatBanName = f["sNhaXuatBanName"];


                db.SubmitChanges();
                //Về lại trang Quản lý sách
                return RedirectToAction("Index");
            }
            return View(sach);
        }
    }
}