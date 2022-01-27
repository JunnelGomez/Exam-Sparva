using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MVC_ClientApp.Models
{
    public class MVC_TransactionInfo
    {

        public int TransactionCode { get; set; }
        public Nullable<int> Account_No { get; set; }
        public string Account_Name { get; set; }
        public string Merchant { get; set; }
        public string Status { get; set; }
        public Nullable<decimal> Amount { get; set; }
        public Nullable<System.DateTime> Createddate { get; set; }
        public string Createdby { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
        public string Updatedby { get; set; }
        public string Documentinfo { get; set; }
    }
}