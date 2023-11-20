using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SachOnline.Models
{
    public class OrderDetailsViewModel
    {
        dbSachOnlineDataContext db = new dbSachOnlineDataContext();
        public DONDATHANG Order { get; set; }
        public List<donhang> OrderDetails { get; set; }
        public string customerName { get; set; }

        
        public int Soluong => OrderDetails?.Sum(item => item.Soluong) ?? 0;
        public decimal Dongia => OrderDetails?.Sum(item => item.Dongia) ?? 0;

        
    }
}