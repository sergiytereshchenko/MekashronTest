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
    
    public partial class stations
    {
        public long StationID { get; set; }
        public byte[] Serial { get; set; }
        public Nullable<System.DateTime> StationTimeOut { get; set; }
        public byte[] ModemNumbers { get; set; }
        public byte[] Synchronization { get; set; }
        public byte[] Registration { get; set; }
        public byte[] Version { get; set; }
    }
}
