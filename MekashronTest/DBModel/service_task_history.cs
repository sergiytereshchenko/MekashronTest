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
    
    public partial class service_task_history
    {
        public int TaskLogID { get; set; }
        public int UserID { get; set; }
        public int TaskID { get; set; }
        public Nullable<System.DateTime> ChangeTime { get; set; }
        public Nullable<int> StatusID { get; set; }
        public Nullable<int> AssignedTo { get; set; }
        public Nullable<int> Deleted { get; set; }
        public byte[] Solution { get; set; }
        public byte[] Reason { get; set; }
        public Nullable<long> Reassigned { get; set; }
        public Nullable<long> Child { get; set; }
        public Nullable<long> AccessKind { get; set; }
    }
}