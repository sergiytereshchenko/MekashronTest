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
    
    public partial class historydata
    {
        public long HistoryID { get; set; }
        public Nullable<long> ObjectKind { get; set; }
        public Nullable<long> ObjectID { get; set; }
        public byte[] FieldName { get; set; }
        public byte[] Value { get; set; }
        public Nullable<System.DateTime> ChangeDate { get; set; }
        public Nullable<long> userID { get; set; }
        public Nullable<int> ChangePCT { get; set; }
        public Nullable<long> CustomFieldID { get; set; }
        public byte[] Title { get; set; }
        public byte[] ValueTitle { get; set; }
        public byte[] DataPath { get; set; }
        public Nullable<long> ChangeType { get; set; }
        public byte[] ChangedTo { get; set; }
        public Nullable<long> SubObjectID { get; set; }
        public Nullable<long> CFieldID { get; set; }
    }
}
