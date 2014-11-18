using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MekashronTest.DBModel;

namespace MekashronTest.DAL
{
    public class DAL
    {
        private string ConvertByteArrayToString(Byte[] ByteOutput)
        {

            string StringOutput = System.Text.Encoding.UTF8.GetString(ByteOutput);

            return StringOutput;
        }

        private byte[] ConvertStringToByte(string Input)
        {

            return System.Text.Encoding.UTF8.GetBytes(Input);
        }


        public bool InsertUser(List<string> errors)
        {
            bool result = true;

            

            using (mekashrontvEntities me = new mekashrontvEntities())
            {

                try
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

                    users newUser = new users();
                    newUser.Email = ConvertStringToByte(RegUser.eMail);
                    newUser.FirstName = ConvertStringToByte(RegUser.FirstName);
                    newUser.LastName = ConvertStringToByte(RegUser.LastName);
                    newUser.Phone = ConvertStringToByte(RegUser.Phone);
                    newUser.password = ConvertStringToByte(RegUser.Password);
                    newUser.EntityID = newUserEntity.entityID;

                    me.users.Add(newUser);
                    me.SaveChanges();

                }
                catch (Exception ex)
                {
                    errors.Add(ex.Message);
                    result = false;
                }

            }


            return result;
        }
    }
}