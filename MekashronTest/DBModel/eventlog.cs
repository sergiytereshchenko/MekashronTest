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
    
    public partial class eventlog
    {
        public long LogID { get; set; }
        public byte[] Type { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public byte[] Source { get; set; }
        public byte[] Terminal { get; set; }
        public byte[] IP { get; set; }
        public byte[] Description { get; set; }
    }
}
