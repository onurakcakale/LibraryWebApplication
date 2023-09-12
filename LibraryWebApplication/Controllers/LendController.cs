using LibraryWebApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LibraryWebApplication.Controllers
{
    public class LendController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LendBook(int id)
        {
            using (libraryAppEntities db = new libraryAppEntities())
            {
                var model = db.books.Find(id);

                if (model == null)
                {
                    return HttpNotFound();
                }

                return View("LendBook", model);
            }
        }

        public ActionResult Save(FormCollection form, books book)
        {
            using (libraryAppEntities db = new libraryAppEntities())
            {
                string name = form["name"];
                string surname = form["surname"];
                DateTime lendDate = DateTime.Parse(form["lendDate"]);
                DateTime returnDate = DateTime.Parse(form["returnDate"]);
                int book_id = book.Id;

                lend lends = new lend();
                lends.book_id = book_id;
                lends.name = name;
                lends.surname = surname;
                lends.lend_date = lendDate;
                lends.return_date = returnDate;

                var query = db.books.Where(x => x.Id == book.Id).FirstOrDefault();
                query.record_state = false;

                db.lend.Add(lends);
                db.SaveChanges();

                TempData["book"] = "Başarılı bir şekilde ödünç verildi.";
                return RedirectToAction("Index", "Home");
            }
        }

        public ActionResult Details(int id)
        {
            using (libraryAppEntities db = new libraryAppEntities())
            {
                var model = db.lend
                    .Join(db.books,
                        a => a.book_id,
                        b => b.Id, (a, b) => new { a, b })
                    .Where(x => x.b.Id == id)
                    .Select(o => new LendModel
                    {
                        book_id = o.b.Id,
                        book_image = o.b.book_image,
                        book_name = o.b.book_name,
                        book_writer = o.b.book_writer,
                        name = o.a.name,
                        surname = o.a.surname,
                        lend_date = o.a.lend_date,
                        return_date = o.a.return_date
                    }).FirstOrDefault();

                if (model == null)
                {
                    return HttpNotFound();
                }

                return View("Details", model);
            }
        }

        public ActionResult ReturnBook(int id)
        {
            using (libraryAppEntities db = new libraryAppEntities())
            {
                var model = db.books.Find(id);
                model.record_state = true;
                db.SaveChanges();
            }

            TempData["book"] = "İşlem başarılı.";
            return RedirectToAction("Index", "Home");
        }
    }
}