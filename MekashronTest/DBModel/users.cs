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
    
    public partial class users
    {
        public long userID { get; set; }
        public byte[] username { get; set; }
        public byte[] password { get; set; }
        public byte[] FirstName { get; set; }
        public byte[] LastName { get; set; }
        public byte[] Phone { get; set; }
        public byte[] Email { get; set; }
        public byte[] FaxNumber { get; set; }
        public byte[] Position { get; set; }
        public string permissions { get; set; }
        public string linenumbers { get; set; }
        public string emailaccounts { get; set; }
        public Nullable<long> CryptedID { get; set; }
        public Nullable<long> PermissionGroupID { get; set; }
        public Nullable<int> ExtID { get; set; }
        public Nullable<long> RegisterSIP { get; set; }
        public byte[] UserGroups { get; set; }
        public Nullable<long> isLogged { get; set; }
        public Nullable<System.DateTime> LoginDate { get; set; }
        public Nullable<int> isDeleted { get; set; }
        public long EntityID { get; set; }
        public Nullable<decimal> PerHour { get; set; }
        public Nullable<long> Fixedsalary { get; set; }
        public Nullable<long> Fixedtravel { get; set; }
        public Nullable<long> CreatedByUserID { get; set; }
    }
}
