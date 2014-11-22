using System;
using System.Activities.Expressions;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace MekashronTest.Helpers
{
    public class ErrorList
    {
        private List<string> errList;

        public ErrorList()
        {
            errList = new List<string>();
        }

        public void Add(string inErr)
        {
            errList.Add(inErr);
        }

        public string ToHTML()
        {
            StringBuilder result = new StringBuilder();
            foreach (string s in errList)
            {
                result.Append(String.Format("{0}<br/>", s));
            }

            return result.ToString();
        }

        public bool isEmpty()
        {
            bool result = false;

            if (errList.Count == 0)
            {
                result = true;
            }

            return result;
        }
    }
}