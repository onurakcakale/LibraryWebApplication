using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LibraryWebApplication.Models;

namespace LibraryWebApplication.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            using (libraryAppEntities db = new libraryAppEntities())
            {
                var model = db.books.OrderBy(o => o.book_name).ToList();
                return View(model);
            }
        }

        public ActionResult AddBook()
        {
            var model = new books();
            return View("BookForm", model);
        }

        public ActionResult Save(books book)
        {
            if (!ModelState.IsValid)
            {
                return View("BookForm", book);
            }

            using (libraryAppEntities db = new libraryAppEntities())
            {
                if (book.Id == 0) //add new book
                {
                    if (book.imageFile == null)
                    {
                        return View("BookForm", book);
                    }

                    string imageName = book.imageFile.FileName;
                    book.book_image = imageName;
                    book.record_state = true;
                    db.books.Add(book);
                    book.imageFile.SaveAs(Path.Combine(Server.MapPath("~/Content/img"), Path.GetFileName(imageName)));
                    TempData["book"] = "Başarılı bir şekilde eklendi.";
                }

                else //update
                {
                    var updateData = db.books.Find(book.Id);

                    if (book.imageFile != null)
                    {
                        string imageName = book.imageFile.FileName;
                        book.book_image = imageName;
                        book.imageFile.SaveAs(Path.Combine(Server.MapPath("~/Content/img"), Path.GetFileName(imageName)));
                    }

                    db.Entry(updateData).CurrentValues.SetValues(book);
                    TempData["book"] = "Başarılı bir şekilde güncellendi.";
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        public ActionResult Update(int id)
        {
            using (libraryAppEntities db = new libraryAppEntities())
            {
                var model = db.books.Find(id);
                if (model == null)
                {
                    return HttpNotFound();
                }

                return View("BookForm", model);
            }
        }

        public ActionResult Delete(int id)
        {
            using (libraryAppEntities db = new libraryAppEntities())
            {
                var deletaData = db.books.Find(id);

                if (deletaData == null)
                {
                    return HttpNotFound();
                }

                db.books.Remove(deletaData);
                db.SaveChanges();
                TempData["book"] = "Başarılı bir şekilde silindi.";
                return RedirectToAction("Index");
            }
        }
    }
}