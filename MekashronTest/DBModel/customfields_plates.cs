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
    
    public partial class customfields_plates
    {
        public long plateID { get; set; }
        public Nullable<long> FormID { get; set; }
        public Nullable<long> PlateActive { get; set; }
        public byte[] plateName { get; set; }
        public Nullable<long> PageIndex { get; set; }
        public byte[] DisallowedCategories { get; set; }
        public byte[] DisallowedUsers { get; set; }
        public Nullable<long> ParentFieldID { get; set; }
        public byte[] DisallowedGroups { get; set; }
    }
}
