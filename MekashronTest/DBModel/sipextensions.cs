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
    
    public partial class sipextensions
    {
        public long ExtID { get; set; }
        public byte[] Username { get; set; }
        public byte[] Password { get; set; }
        public byte[] Domain { get; set; }
        public Nullable<long> BindtoListenIP { get; set; }
        public byte[] ListenIP { get; set; }
        public Nullable<long> NumberOfLines { get; set; }
        public byte[] Prefix { get; set; }
        public byte[] Areacode { get; set; }
        public Nullable<long> GSM610 { get; set; }
        public Nullable<long> iLBC { get; set; }
        public Nullable<long> GSM711ALaw { get; set; }
        public Nullable<long> GSM711ULaw { get; set; }
        public byte[] AuthorizationUsername { get; set; }
        public Nullable<long> LoggedUserID { get; set; }
        public Nullable<long> Removeleadingzero { get; set; }
        public Nullable<long> UseFixedPrefix { get; set; }
        public byte[] UsedCodec { get; set; }
    }
}
