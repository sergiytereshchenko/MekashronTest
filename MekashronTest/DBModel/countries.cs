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
    
    public partial class countries
    {
        public int CountryID { get; set; }
        public byte[] CountryName { get; set; }
        public byte[] CallingCode { get; set; }
        public byte[] ISO { get; set; }
        public Nullable<int> UTC { get; set; }
        public Nullable<int> CurrencyID { get; set; }
        public byte[] CurrencyCode { get; set; }
        public Nullable<System.DateTime> LastDateUsed { get; set; }
        public long Isdeleted { get; set; }
        public Nullable<long> Removezero { get; set; }
        public byte[] ISO3166 { get; set; }
        public byte[] Language { get; set; }
    }
}