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
    
    public partial class orders_documents
    {
        public int Order_DocumentID { get; set; }
        public Nullable<long> orderID { get; set; }
        public Nullable<long> documentID { get; set; }
        public Nullable<long> messageID { get; set; }
        public Nullable<long> Number { get; set; }
        public Nullable<System.DateTime> DocumentDate { get; set; }
        public Nullable<long> copies { get; set; }
        public string Body { get; set; }
        public Nullable<long> CanceledInvoiceID { get; set; }
        public Nullable<long> CanceledReceiptID { get; set; }
        public long entityID { get; set; }
        public Nullable<long> isCanceled { get; set; }
        public Nullable<long> currencyID { get; set; }
        public Nullable<long> PrintSrouce { get; set; }
        public Nullable<decimal> Total { get; set; }
        public Nullable<decimal> TotalVat { get; set; }
        public Nullable<decimal> VatPCT { get; set; }
        public Nullable<decimal> Vat { get; set; }
        public Nullable<decimal> TotalPayment { get; set; }
        public Nullable<decimal> Discount { get; set; }
        public Nullable<long> DocumentType { get; set; }
        public Nullable<long> BusinessID { get; set; }
    }
}
