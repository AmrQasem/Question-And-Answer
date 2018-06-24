using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BayanFinal.BayanData;
using BayanFinal.Models;
using System.Data.Entity;

namespace BayanFinal.BayanServices
{
    public class QuestionsService
    {
        BayanTestEntities _db;
        public QuestionsService()
        {
            _db = new BayanTestEntities();
        }

        public List<QuestionsVM> GetAllQuestions()
        {
            try
            {
                var model = (from g in _db.GetAllQuestions()
                             select new QuestionsVM()
                             {
                                 QuestionID = g.QuestionID,
                                 QuestionTitle = g.QuestionTitle,
                             }).ToList();
                return model;
            }
            catch (Exception ex)
            {
                return new List<QuestionsVM>();
            }

        }

    }
}