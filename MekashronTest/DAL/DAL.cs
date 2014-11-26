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
        private static volatile DAL commonDal;
        private static object syncRoot = new Object();

        public const int ACTIVATED_USER = 3;
        public const long EMPTY_ID = 0;

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

        public long InsertUser(UserModel inUser, ErrorList errors)
        {
            long result = EMPTY_ID;

            //TO DO
           //3. Check format of email and other inputs

            if (inUser == null)
            {
                errors.Add("User is empty!");
                return EMPTY_ID;
            }

            mekashrontvEntities me = new mekashrontvEntities();

            using (TransactionScope transaction = new TransactionScope())
            {

                try
                {
                    if (!IsEmailAlreadyInDB(RegUser.eMail))
                    {

                        entities newUserEntity = new entities();
                        newUserEntity.Email = StringByteConverter.ConvertStringToByte(inUser.eMail);
                        newUserEntity.FirstName = StringByteConverter.ConvertStringToByte(inUser.FirstName);
                        newUserEntity.LastName = StringByteConverter.ConvertStringToByte(inUser.LastName);
                        newUserEntity.Phone = StringByteConverter.ConvertStringToByte(inUser.Phone);
                        newUserEntity.Country = StringByteConverter.ConvertStringToByte(inUser.Country);
                        newUserEntity.Address = StringByteConverter.ConvertStringToByte(inUser.Address);
                        newUserEntity.City = StringByteConverter.ConvertStringToByte(inUser.City);
                        newUserEntity.Zip = StringByteConverter.ConvertStringToByte(inUser.ZIP);

                        me.entities.Add(newUserEntity);
                        me.SaveChanges();

                        if (newUserEntity.entityID > EMPTY_ID)
                        {
                            users newUser = new users();
                            newUser.Email = StringByteConverter.ConvertStringToByte(inUser.eMail);
                            newUser.FirstName = StringByteConverter.ConvertStringToByte(inUser.FirstName);
                            newUser.LastName = StringByteConverter.ConvertStringToByte(inUser.LastName);
                            newUser.Phone = StringByteConverter.ConvertStringToByte(inUser.Phone);
                            newUser.password = StringByteConverter.ConvertStringToByte(HashPassword.GetMd5Hash(inUser.Password));
                            newUser.EntityID = newUserEntity.entityID;

                            me.users.Add(newUser);
                            me.SaveChanges();

                            transaction.Complete();
                            result = newUser.userID;
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
                    result = EMPTY_ID;
                }

            }

            // Dispose the object context.
            me.Dispose();

            return result;
        }

        public UserModel GetUser(string inEMail, ErrorList errors)
        {
            UserModel result = null;

            using (mekashrontvEntities me = new mekashrontvEntities())
            {
                try
                {
                    byte[] inEmailByteArray = StringByteConverter.ConvertStringToByte(inEMail);

                    var query = me.users.Where(a => a.Email.Equals(inEmailByteArray));
                    if (query.Any())
                    {
                        users firstUser = query.First();
                        var querye = me.entities.Where(a => a.entityID ==firstUser.EntityID);
                        if (querye.Any())
                        {
                            entities firstEntity = querye.First();

                            result = new UserModel(StringByteConverter.ConvertByteArrayToString(firstUser.Email), StringByteConverter.ConvertByteArrayToString(firstUser.FirstName),
                                StringByteConverter.ConvertByteArrayToString(firstUser.LastName), StringByteConverter.ConvertByteArrayToString(firstUser.Phone),
                                StringByteConverter.ConvertByteArrayToString(firstEntity.Country), StringByteConverter.ConvertByteArrayToString(firstUser.password),
                                StringByteConverter.ConvertByteArrayToString(firstEntity.Address), StringByteConverter.ConvertByteArrayToString(firstEntity.City),
                                StringByteConverter.ConvertByteArrayToString(firstEntity.Zip), "", firstEntity.AllowEmail==DAL.ACTIVATED_USER);
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

        public bool UpdateUser(long inId, UserModel inUser, ErrorList errors)
        {
            bool result = false;

            if (inUser == null)
            {
                errors.Add("User is empty!");
                return false;
            }

            mekashrontvEntities me = new mekashrontvEntities();

            using (TransactionScope transaction = new TransactionScope())
            {

                    try
                    {
                        var query = me.users.Where(a => a.userID == inId);
                        if (query.Any())
                        {
                            users firstUser = query.First();
                            var queryE = me.entities.Where(a => a.entityID == firstUser.EntityID);
                            if (queryE.Any())
                            {
                                entities firstEntity = queryE.First();

                                firstEntity.Email = StringByteConverter.ConvertStringToByte(inUser.eMail);
                                firstEntity.FirstName = StringByteConverter.ConvertStringToByte(inUser.FirstName);
                                firstEntity.LastName = StringByteConverter.ConvertStringToByte(inUser.LastName);
                                firstEntity.Phone = StringByteConverter.ConvertStringToByte(inUser.Phone);
                                firstEntity.Country = StringByteConverter.ConvertStringToByte(inUser.Country);
                                firstEntity.Address = StringByteConverter.ConvertStringToByte(inUser.Address);
                                firstEntity.City = StringByteConverter.ConvertStringToByte(inUser.City);
                                firstEntity.Zip = StringByteConverter.ConvertStringToByte(inUser.ZIP);

                                firstUser.Email = StringByteConverter.ConvertStringToByte(inUser.eMail);
                                firstUser.FirstName = StringByteConverter.ConvertStringToByte(inUser.FirstName);
                                firstUser.LastName = StringByteConverter.ConvertStringToByte(inUser.LastName);
                                firstUser.Phone = StringByteConverter.ConvertStringToByte(inUser.Phone);
                                firstUser.password = StringByteConverter.ConvertStringToByte(HashPassword.GetMd5Hash(inUser.Password));

                                me.SaveChanges();
                                transaction.Complete();
                                result = true;
                            }
                            else
                            {
                                errors.Add("Entity ID is wrong!");
                            }

                        }
                        else
                        {
                            errors.Add("User ID is wrong!");
                        }
                    }
                    catch (Exception ex)
                    {
                        errors.Add(ex.Message);
                    }
                }

            if (!result)
            {
                errors.Add("Failed to update the user.");
            }

            // Dispose the object context.
            me.Dispose();

            return result;
        }


        public CheckResults CheckCredentials(string inEMail, string inPassword, out long userId, ErrorList errors)
        {
            CheckResults result = CheckResults.Error;
            userId = EMPTY_ID;

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
                            userId = firstRecord.userID;

                            //check activation
                            var querya = me.entities.Where(a => a.entityID == firstRecord.EntityID);
                            if (querya.Any())
                            {
                                var firstRecorda = querya.First();
                                if (firstRecorda.AllowEmail == DAL.ACTIVATED_USER)
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
                            if (firstRecorda.AllowEmail != DAL.ACTIVATED_USER)
                            {
                                firstRecorda.AllowEmail = DAL.ACTIVATED_USER;
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


        public bool ChangeEmail(long inId, string inEmail, ErrorList errors)
        {
            bool result = false;

            if (inId <= 0)
            {
                errors.Add("ID is empty!");
                return false;
            }
            if (String.IsNullOrEmpty(inEmail))
            {
                errors.Add("e-Mail is empty!");
                return false;
            }

            mekashrontvEntities me = new mekashrontvEntities();

            using (TransactionScope transaction = new TransactionScope())
            {

                try
                {
                    var query = me.users.Where(a => a.userID == inId);
                    if (query.Any())
                    {
                        users firstUser = query.First();
                        var queryE = me.entities.Where(a => a.entityID == firstUser.EntityID);
                        if (queryE.Any())
                        {
                            entities firstEntity = queryE.First();

                            firstEntity.Email = StringByteConverter.ConvertStringToByte(inEmail);

                            firstUser.Email = StringByteConverter.ConvertStringToByte(inEmail);

                            me.SaveChanges();
                            transaction.Complete();
                            result = true;
                        }
                        else
                        {
                            errors.Add("Entity ID is wrong!");
                        }

                    }
                    else
                    {
                        errors.Add("User ID is wrong!");
                    }
                }
                catch (Exception ex)
                {
                    errors.Add(ex.Message);
                }
            }

            if (!result)
            {
                errors.Add("Failed to change the user's eMail.");
            }

            // Dispose the object context.
            me.Dispose();

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