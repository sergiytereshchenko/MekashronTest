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
    
    public partial class categories
    {
        public long CategoryID { get; set; }
        public Nullable<long> ParentID { get; set; }
        public byte[] Name { get; set; }
        public long CategoryType { get; set; }
        public byte[] SharedCategory { get; set; }
        public Nullable<long> isDeleted { get; set; }
        public long AccessKind { get; set; }
    }
}