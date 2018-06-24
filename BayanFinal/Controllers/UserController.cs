using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BayanFinal.Models;
using BayanFinal.BayanData;
using BayanFinal.BayanServices;

namespace BayanFinal.Controllers
{
    public class UserController : Controller
    {
        BayanTestEntities db = new BayanTestEntities();

        private readonly UserServices _userService;
        public UserController()
        {
            _userService = new UserServices();
        }
        //
        // GET: /User/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserVM usr)
        {
            string username = Request["UserName"];
            string pass = Request["Password"];
            var model = _userService.Login(username, pass);

            if (model == null)
            {
                ViewBag.CheckUser = "Null";
                Response.Write("<script>alert('invalid user name or password');</script>");
                return View("Login");
            }
            else
            {
                Session["User"] = usr;
                return RedirectPermanent("/Questions/Index");
            }

        }
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserVM usr)
        {
            if (ModelState.IsValid)
            {
                string username = Request["UserName"];
                string pass = Request["Password"];
                string Email = Request["Email"];
                string Phone = Request["Phone"];
                string FirstName = Request["FirstName"];
                string LastName = Request["LastName"];
                User obj = new User();
                obj.UserName = username;
                obj.Password = pass;
                obj.Phone = Phone;
                obj.Email = Email;
                obj.FirstName = FirstName;
                obj.LastName = LastName;

                if (obj.UserName == null || obj.Password == null || obj.Phone == null || obj.Email == null || obj.FirstName == null || obj.LastName == null)
                {
                    Response.Write("<script>alert('Please enter all field in correct form');</script>");
                    return View("Login");
                }
                else
                {
                    db.Users.Add(obj);
                    db.SaveChanges();
                    return RedirectPermanent("/Questions/Index");
                }
            }
            Response.Write("<script>alert('Please enter all field in correct form');</script>");
            return View("Register");

        }

        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectPermanent("/User/Login");
        }
    }
}