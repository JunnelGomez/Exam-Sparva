//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _123API.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tbl_TransactionInfo
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
