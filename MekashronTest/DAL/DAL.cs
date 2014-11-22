using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MekashronTest.DBModel;
using System.Transactions;
using MekashronTest.Helpers;

namespace MekashronTest.DAL
{
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

        private string ConvertByteArrayToString(Byte[] ByteOutput)
        {

            string StringOutput = System.Text.Encoding.UTF8.GetString(ByteOutput);

            return StringOutput;
        }

        private byte[] ConvertStringToByte(string Input)
        {

            return System.Text.Encoding.UTF8.GetBytes(Input);
        }


        public bool InsertUser(ErrorList errors)
        {
            bool result = true;

            //TO DO
           
            //2. Hash password
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
                        newUserEntity.Email = ConvertStringToByte(RegUser.eMail);
                        newUserEntity.FirstName = ConvertStringToByte(RegUser.FirstName);
                        newUserEntity.LastName = ConvertStringToByte(RegUser.LastName);
                        newUserEntity.Phone = ConvertStringToByte(RegUser.Phone);
                        newUserEntity.Country = ConvertStringToByte(RegUser.Country);
                        newUserEntity.Address = ConvertStringToByte(RegUser.Address);
                        newUserEntity.City = ConvertStringToByte(RegUser.City);
                        newUserEntity.Zip = ConvertStringToByte(RegUser.ZIP);

                        me.entities.Add(newUserEntity);
                        me.SaveChanges();

                        if (newUserEntity.entityID > 0)
                        {
                            users newUser = new users();
                            newUser.Email = ConvertStringToByte(RegUser.eMail);
                            newUser.FirstName = ConvertStringToByte(RegUser.FirstName);
                            newUser.LastName = ConvertStringToByte(RegUser.LastName);
                            newUser.Phone = ConvertStringToByte(RegUser.Phone);
                            newUser.password = ConvertStringToByte(RegUser.Password);
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

        public bool CheckCredentials(string inEMail, string inPassword, ErrorList errors)
        {
            bool result = false;

            using (mekashrontvEntities me = new mekashrontvEntities())
            {
                try
                {
                    byte[] inEmailByteArray = ConvertStringToByte(inEMail);

                    var query = me.users.Where(a => a.Email.Equals(inEmailByteArray));
                    if (query.Count()>0)
                    {
                        var firstRecord = query.First();
                        if (ConvertByteArrayToString(firstRecord.password) == inPassword)
                        {
                            result = true;
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
                    result = false;
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
                    byte[] inEmailByteArray = ConvertStringToByte(inEMail);

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