using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BayanFinal.BayanData;
using BayanFinal.Models;
using System.Data.Entity;

namespace BayanFinal.BayanServices
{
    public class AnswersService
    {
        BayanTestEntities _db;
        public AnswersService()
        {
            _db = new BayanTestEntities();
        }

        public List<AnswerVM> GetAnswers(int QuestID)
        {
            try
            {
                var model = (from g in _db.GetAnswers(QuestID)
                             select new AnswerVM()
                             {
                                 AnswerID = g.AnswerID,
                                 AnswerDetails = g.AnswerDetails,
                                 QuestionID = g.QuestionID,
                                 QuestionDetails = g.QuestionTitle
                             }).ToList();
                return model;
            }
            catch (Exception ex)
            {
                return new List<AnswerVM>();
            }
        }


    }
}