using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MekashronTest.Helpers
{
    public static class StringByteConverter
    {
        public static string ConvertByteArrayToString(Byte[] ByteOutput)
        {

            string StringOutput = System.Text.Encoding.UTF8.GetString(ByteOutput);

            return StringOutput;
        }

        public static byte[] ConvertStringToByte(string Input)
        {

            return System.Text.Encoding.UTF8.GetBytes(Input);
        }


    }
}