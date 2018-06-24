using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BayanFinal.BayanData;
using BayanFinal.Models;
using BayanFinal.BayanServices;

namespace BayanFinal.Controllers
{
    public class QuestionsController : Controller
    {
        BayanTestEntities db = new BayanTestEntities();

        private readonly QuestionsService _QuestionService;
        public QuestionsController()
        {
            _QuestionService = new QuestionsService();
        }
        //
        // GET: /Questions/
        public ActionResult Index()
        {
            var model = _QuestionService.GetAllQuestions();
            return View(model);
        }

        public ActionResult AddQuestions()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddQuestions(Question quest)
        {
            string Question = Request["Questions"];
            Question obj = new Question();

            obj.QuestionTitle = Question;

            db.Questions.Add(obj);
            db.SaveChanges();

            return Json(obj.QuestionID);
        }

	}
}