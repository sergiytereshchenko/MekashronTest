using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MekashronTest.DAL
{
    public class UserModel
    {
        public string eMail { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Phone { get; set; }

        public string Country { get; set; }

        public string Password { get; set; }

        public string Address { get; set; }

        public string City { get; set; }

        public string ZIP { get; set; }

        public string promo { get; set; }

        public bool NotActivated { get; set; }

        public UserModel()
        {
            
        }

        public UserModel(string eMail, string firstName, string lastName, string phone, string country, string password, string address, string city, string zip, string promo, bool notActivated)
        {
            this.eMail = eMail;
            FirstName = firstName;
            LastName = lastName;
            Phone = phone;
            Country = country;
            Password = password;
            Address = address;
            City = city;
            ZIP = zip;
            this.promo = promo;
            NotActivated = notActivated;
        }
    }
}