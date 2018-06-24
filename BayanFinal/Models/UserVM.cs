using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BayanFinal.Models
{
    public class UserVM
    {

        public int ID { get; set; }
        [Required(ErrorMessage = "UserName Is Required")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Email Is Required")]
        public string Email { get; set; }
        public string Phone { get; set; }
        [Required(ErrorMessage = "Password Is Required")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}
