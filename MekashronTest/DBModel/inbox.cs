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
    
    public partial class inbox
    {
        public long inboxID { get; set; }
        public Nullable<long> messageType { get; set; }
        public Nullable<long> entityID { get; set; }
        public byte[] Subject { get; set; }
        public byte[] Body { get; set; }
        public byte[] MessageFrom { get; set; }
        public byte[] MessageTo { get; set; }
        public Nullable<System.DateTime> InboxDate { get; set; }
        public Nullable<long> stationID { get; set; }
        public byte[] device { get; set; }
        public Nullable<long> userID { get; set; }
        public Nullable<long> deviceID { get; set; }
        public Nullable<long> deleted { get; set; }
        public Nullable<System.DateTime> ReadDate { get; set; }
        public byte[] CallId { get; set; }
        public byte[] Attachments { get; set; }
        public byte[] MailCC { get; set; }
        public byte[] MailBCC { get; set; }
        public byte[] Images { get; set; }
        public Nullable<long> User_GroupID { get; set; }
        public Nullable<byte> StatusID { get; set; }
        public Nullable<System.DateTime> FinishDate { get; set; }
        public Nullable<System.DateTime> AnsweredDate { get; set; }
        public Nullable<long> AnsweredUserID { get; set; }
        public Nullable<long> AnsweredStatusID { get; set; }
    }
}
