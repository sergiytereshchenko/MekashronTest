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
    
    public partial class service
    {
        public int ServiceID { get; set; }
        public Nullable<long> ServiceGroupID { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public byte[] Issue { get; set; }
        public Nullable<long> CreatedByUserID { get; set; }
        public Nullable<long> StatusID { get; set; }
        public byte[] Subject { get; set; }
        public Nullable<long> IsDeleted { get; set; }
        public Nullable<System.DateTime> LastCreateDate { get; set; }
    }
}
