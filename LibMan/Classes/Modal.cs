using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibMan.Classes
{
    public class Modal
    {

    }

    public class TotalCount
    {
        public int Count { get; set; }
        public int Filtered { get; set; }
    }

    public class Area
    {
        public string Row { get; set; }
        public int ID { get; set; }
        public string Name { get; set; }
        public string code { get; set; }
        public string city { get; set; }
        public string pincode { get; set; }
        public string state { get; set; }
        public string country { get; set; }
        public bool status { get; set; }

    }
    public class City
    {
        public string Row { get; set; }
        public int ID { get; set; }
        public string Name { get; set; }
        public string code { get; set; }
        public string cityCat { get; set; }
        public string state { get; set; }
        public string country { get; set; }
        public int status { get; set; }

    }

    public class Libicine
    {
        public string Row { get; set; }
        public int ID { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Group { get; set; }
        public string Salt { get; set; }
        public bool Status { get; set; }

    }

    //------------------------------------------------------Prescription Related ------------------------------------------------

    public class LibData1
    {
        public int LibID { get; set; }
        public string Flag { get; set; }
    }
    public class Diagnosis
    {
        public int ID { get; set; }
        public string remark { get; set; }
    }

    public class IPDServicePopUp
    {
        public string ID { get; set; }
    }

    //--------------------------------------------------------------Prescription Related ----------------------------------------------------

}