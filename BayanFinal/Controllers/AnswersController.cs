using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BayanFinal.Models;
using BayanFinal.BayanServices;
using BayanFinal.BayanData;

namespace BayanFinal.Controllers
{
    public class AnswersController : Controller
    {
        BayanTestEntities db = new BayanTestEntities();

        private readonly AnswersService _AnswersService;
        public AnswersController()
        {
            _AnswersService = new AnswersService();
        }
        //
        // GET: /Answers/
        public ActionResult Index(int QuestID)
        {
            var model = _AnswersService.GetAnswers(QuestID);
            ViewBag.QuestionID = QuestID;
            return View(model);
        }

        public ActionResult AddAnswers()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddAnswers(Answer answer)
        {
            string QuestionID = Request["Question_ID"];
            string answers = Request["Answer"];
            Answer obj = new Answer();

            obj.QuestionID = int.Parse(QuestionID);
            obj.AnswerDetails = answers;

            db.Answers.Add(obj);
            db.SaveChanges();

            return Json("OK!");

        }
	}
}