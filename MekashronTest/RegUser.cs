using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MekashronTest
{
    public static class RegUser
    {
        public static string eMail { get; set; }

        public static string FirstName { get; set; }

        public static string LastName { get; set; }

        public static string Phone { get; set; }

        public static string Country { get; set; }

        public static string Password { get; set; }

        public static string Address { get; set; }

        public static string City { get; set; }

        public static string ZIP { get; set; }

        public static string promo { get; set; }

        public static bool NotActivated { get; set; }

        public static void Clear()
        {
            eMail = "";
            FirstName = "";
            LastName = "";
            Phone = "";
            Country = "";
            Password = "";
            Address = "";
            City = "";
            ZIP = "";
            NotActivated = false;
            promo = "";

        }
    }
}