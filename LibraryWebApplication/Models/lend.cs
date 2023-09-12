namespace LibraryWebApplication.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class lend
    {
        public int Id { get; set; }
        public int book_id { get; set; }
        public string name { get; set; }
        public string surname { get; set; }
        public System.DateTime lend_date { get; set; }
        public System.DateTime return_date { get; set; }
    
        public virtual books books { get; set; }
    }
}