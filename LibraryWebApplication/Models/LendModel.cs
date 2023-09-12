using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LibraryWebApplication.Models
{
    public class LendModel
    {
        public int book_id { get; set; }
        public string book_image { get; set; }
        public string book_name { get; set; }
        public string book_writer { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public System.DateTime lend_date { get; set; }
        public System.DateTime return_date { get; set; }
    }
}