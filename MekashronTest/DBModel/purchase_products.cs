//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MekashronTest.DBModel
{
    using System;
    using System.Collections.Generic;
    
    public partial class purchase_products
    {
        public long productID { get; set; }
        public Nullable<long> InventoryID { get; set; }
        public Nullable<long> BusinessID { get; set; }
        public Nullable<long> entityID { get; set; }
        public Nullable<long> ParentID { get; set; }
        public Nullable<long> InvoiceID { get; set; }
        public Nullable<long> RefundID { get; set; }
        public Nullable<long> ShippingLabelID { get; set; }
        public Nullable<long> ReturnLabelID { get; set; }
        public Nullable<long> purchaseID { get; set; }
        public Nullable<long> userID { get; set; }
        public byte[] productName { get; set; }
        public Nullable<decimal> Cost { get; set; }
        public Nullable<decimal> CostVat { get; set; }
        public Nullable<decimal> QtyOrdered { get; set; }
        public Nullable<decimal> QtyArrived { get; set; }
        public Nullable<decimal> QtyInStock { get; set; }
        public Nullable<decimal> Total { get; set; }
        public Nullable<decimal> TotalVat { get; set; }
        public Nullable<long> CostIncVAT { get; set; }
        public Nullable<long> currencyID { get; set; }
        public Nullable<decimal> ExchangeRate { get; set; }
        public Nullable<long> isDeleted { get; set; }
        public Nullable<long> isRecurrence { get; set; }
        public Nullable<int> AllowPriceChange { get; set; }
        public Nullable<System.DateTime> productdate { get; set; }
    }
}
