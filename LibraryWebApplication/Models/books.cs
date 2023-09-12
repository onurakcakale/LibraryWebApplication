namespace LibraryWebApplication.Models
{
    using System;
    using System.Collections.Generic;
    using System.Web;

    public partial class books
    {
        public books()
        {
            this.lend = new HashSet<lend>();
        }

        public virtual HttpPostedFileBase imageFile { get; set; }
        public int Id { get; set; }
        public string book_image { get; set; }
        public string book_name { get; set; }
        public string book_writer { get; set; }
        public bool record_state { get; set; }
    
        public virtual ICollection<lend> lend { get; set; }
    }
}