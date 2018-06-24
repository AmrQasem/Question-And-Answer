using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BayanFinal.Models
{
    public class QuestionsVM
    {
        public int QuestionID { get; set; }
        public string QuestionTitle { get; set; }
        public int AnswerID { get; set; }
        public int UserID { get; set; }
    }
}
