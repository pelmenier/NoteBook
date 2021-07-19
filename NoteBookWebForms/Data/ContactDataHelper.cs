using NoteBookWebForms.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NoteBookWebForms.Data
{
    public static class ContactDataHelper
    {
        public static List<NoteBookWebForms.Models.Contact> GetAllContactsList()
        {
            using (var ctx = new NoteBookDataBaseEntities())
            {
                var contacts = ctx.Contact.OrderByDescending(x => x.Date).ToList();

                return contacts;
            }
        }
    }
}