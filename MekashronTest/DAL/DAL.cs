using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MekashronTest.DBModel;
using System.Transactions;
using MekashronTest.Helpers;

namespace MekashronTest.DAL
{
    public enum CheckResults
    {
        AllRight,
        NotActivated,
        Error
    }


    public class DAL
    {
        // public static DAL CommonDal = new DAL();


        private static volatile DAL commonDal;
        private static object syncRoot = new Object();

        private DAL() { }

        public static DAL CommonDal
        {
            get
            {
                if (commonDal == null)
                {
                    lock (syncRoot)
                    {
                        if (commonDal == null)
                            commonDal = new DAL();
                    }
                }
                return commonDal;
            }
        }

        public bool InsertUser(ErrorList errors)
        {
            bool result = true;

            //TO DO
           
            //3. Check format of email and other inputs

            mekashrontvEntities me = new mekashrontvEntities();
            bool success = false;

            using (TransactionScope transaction = new TransactionScope())
            {

                try
                {
                    if (!IsEmailAlreadyInDB(RegUser.eMail))
                    {

                        entities newUserEntity = new entities();
                        newUserEntity.Email = StringByteConverter.ConvertStringToByte(RegUser.eMail);
                        newUserEntity.FirstName = StringByteConverter.ConvertStringToByte(RegUser.FirstName);
                        newUserEntity.LastName = StringByteConverter.ConvertStringToByte(RegUser.LastName);
                        newUserEntity.Phone = StringByteConverter.ConvertStringToByte(RegUser.Phone);
                        newUserEntity.Country = StringByteConverter.ConvertStringToByte(RegUser.Country);
                        newUserEntity.Address = StringByteConverter.ConvertStringToByte(RegUser.Address);
                        newUserEntity.City = StringByteConverter.ConvertStringToByte(RegUser.City);
                        newUserEntity.Zip = StringByteConverter.ConvertStringToByte(RegUser.ZIP);

                        me.entities.Add(newUserEntity);
                        me.SaveChanges();

                        if (newUserEntity.entityID > 0)
                        {
                            users newUser = new users();
                            newUser.Email = StringByteConverter.ConvertStringToByte(RegUser.eMail);
                            newUser.FirstName = StringByteConverter.ConvertStringToByte(RegUser.FirstName);
                            newUser.LastName = StringByteConverter.ConvertStringToByte(RegUser.LastName);
                            newUser.Phone = StringByteConverter.ConvertStringToByte(RegUser.Phone);
                            newUser.password = StringByteConverter.ConvertStringToByte(HashPassword.GetMd5Hash(RegUser.Password));
                            newUser.EntityID = newUserEntity.entityID;

                            me.users.Add(newUser);
                            me.SaveChanges();

                            transaction.Complete();
                            success = true;
                        }
                        
                    }
                    else
                    {
                        errors.Add("Selected e-mail address is already in use by another user. Please use another e-mail address.");
                    }

                }
                catch (Exception ex)
                {
                    errors.Add(ex.Message);
                    result = false;
                }

            }

            if (!success)
            {
                errors.Add("Failed to add a new user.");
            }

            // Dispose the object context.
            me.Dispose();

            return result;
        }

        public users GetUser(string inEMail, ErrorList errors)
        {
            users result = null;

            using (mekashrontvEntities me = new mekashrontvEntities())
            {
                try
                {
                    byte[] inEmailByteArray = StringByteConverter.ConvertStringToByte(inEMail);

                    var query = me.users.Where(a => a.Email.Equals(inEmailByteArray));
                    if (query.Any())
                    {
                        result = query.First();
                    }
                    else
                    {
                        errors.Add("E-mail is wrong!");
                    }
                }
                catch (Exception ex)
                {
                    errors.Add(ex.Message);
                }
            }

            return result;
        }

        public CheckResults CheckCredentials(string inEMail, string inPassword, ErrorList errors)
        {
            CheckResults result = CheckResults.Error;

            using (mekashrontvEntities me = new mekashrontvEntities())
            {
                try
                {
                    byte[] inEmailByteArray = StringByteConverter.ConvertStringToByte(inEMail);

                    var query = me.users.Where(a => a.Email.Equals(inEmailByteArray));
                    if (query.Any())
                    {
                        //check password
                        var firstRecord = query.First();
                        if (HashPassword.VerifyMd5Hash(inPassword, StringByteConverter.ConvertByteArrayToString(firstRecord.password)))
                        {
                            result = CheckResults.AllRight;

                            //check activation
                            var querya = me.entities.Where(a => a.entityID == firstRecord.EntityID);
                            if (querya.Any())
                            {
                                var firstRecorda = querya.First();
                                if (firstRecorda.AllowEmail == 3)
                                {
                                    result = CheckResults.AllRight;
                                }
                                else
                                {
                                    result = CheckResults.NotActivated;
                                    errors.Add("Account is not activated!");
                                }
                            }
                        }
                        else
                        {
                            errors.Add("Password is wrong!");
                        }
                    }
                    else
                    {
                        errors.Add("E-mail is wrong!");
                    }
                }
                catch (Exception ex)
                {
                    errors.Add(ex.Message);
                    result = CheckResults.Error;
                }
            }

            return result;
        }

        public bool ActivateAcount(string inEMail, ErrorList errors)
        {
            bool result = false;

            using (mekashrontvEntities me = new mekashrontvEntities())
            {
                try
                {
                    byte[] inEmailByteArray = StringByteConverter.ConvertStringToByte(inEMail);

                    var query = me.users.Where(a => a.Email.Equals(inEmailByteArray));
                    if (query.Any())
                    {
                        var firstRecord = query.First();
                        //check activation
                        var querya = me.entities.Where(a => a.entityID == firstRecord.EntityID);
                        if (querya.Any())
                        {
                            var firstRecorda = querya.First();
                            if (firstRecorda.AllowEmail != 3)
                            {
                                firstRecorda.AllowEmail=3;
                                me.SaveChanges();
                                result = true;
                            }
                        }
                    }
                    else
                    {
                        errors.Add("E-mail is wrong!");
                    }
                }
                catch (Exception ex)
                {
                    errors.Add(ex.Message);
                }
            }

            return result;
        }

        public bool ChangePassword(string inEMail, string inPassword, ErrorList errors)
        {
            bool result = false;

            using (mekashrontvEntities me = new mekashrontvEntities())
            {
                try
                {
                    byte[] inEmailByteArray = StringByteConverter.ConvertStringToByte(inEMail);

                    var query = me.users.Where(a => a.Email.Equals(inEmailByteArray));
                    if (query.Any())
                    {
                        var firstRecord = query.First();
                        firstRecord.password = StringByteConverter.ConvertStringToByte(HashPassword.GetMd5Hash(inPassword));
                        me.SaveChanges();
                    }
                    else
                    {
                        errors.Add("E-mail is wrong!");
                    }
                }
                catch (Exception ex)
                {
                    errors.Add(ex.Message);
                }
            }

            return result;
        }

        public bool IsEmailAlreadyInDB(string inEMail)
        {
            bool result = false;

            using (mekashrontvEntities me = new mekashrontvEntities())
            {
                try
                {
                    byte[] inEmailByteArray = StringByteConverter.ConvertStringToByte(inEMail);

                    var query = me.users.Where(a => a.Email.Equals(inEmailByteArray));

                    if (query.Any())
                    {
                        result = true;
                    }
                }
                catch (Exception ex)
                {
                    result = true;
                }
            }

            return result;
        }

    }
}