using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BayanFinal.Models
{
    public class AnswerVM
    {
        public int AnswerID { get; set; }
        public string AnswerDetails { get; set; }
        public int QuestionID { get; set; }
        public string QuestionDetails { get; set; }
        

    }
}
