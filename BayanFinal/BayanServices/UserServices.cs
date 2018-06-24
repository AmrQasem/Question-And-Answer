using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BayanFinal.BayanData;
using BayanFinal.Models;

namespace BayanFinal.BayanServices
{
    public class UserServices
    {
        BayanTestEntities _db;
        public UserServices()
        {
            _db = new BayanTestEntities();
        }
        public UserVM Login(string UserName, string Password)
        {
            try
            {
                //var EncryptPassword = Encrypt(Password);
                var model = (from n in _db.UserLogin(UserName.ToLower(), Password)
                             select new UserVM
                             {
                                 ID = n.ID,
                                 UserName = n.UserName,
                             }).FirstOrDefault();
                return (model);
            }
            catch
            {
                return new UserVM();
            }
        }

    }
}