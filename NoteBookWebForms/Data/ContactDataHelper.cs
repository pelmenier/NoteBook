using NoteBookWebForms.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
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

        public static void AddContact(NoteBookWebForms.Models.Contact contact)
        {
            using (var ctx = new NoteBookDataBaseEntities())
            {
                ctx.Contact.Add(contact);
                ctx.SaveChanges();
            }
        }     
        
        public static void ContactRemove(int id)
        {
            using (var ctx = new NoteBookDataBaseEntities())
            {
                var contact = ctx.Contact.FirstOrDefault(x => x.ContactID == id);
                ctx.Contact.Remove(contact);
                ctx.SaveChanges();
            }
        }

        public static NoteBookWebForms.Models.Contact GetContact(int id)
        {
            using (var ctx = new NoteBookDataBaseEntities())
            {
                var contact = ctx.Contact.FirstOrDefault(x => x.ContactID == id);
                return contact;
            }
        }

        public static void EditContact(NoteBookWebForms.Models.Contact contact)
        {
            using (var ctx = new NoteBookDataBaseEntities())
            {     
                //var currentPerson = ctx.Contact.FirstOrDefault(x => x.ContactID == contact.ContactID);
                //currentPerson.ContactID = contact.ContactID;
                //currentPerson.Email = contact.Email;
                //currentPerson.Mobile = contact.Mobile;
                //currentPerson.Name = contact.Name;
                //currentPerson.Date = contact.Date;// set timestamp value
                ctx.Entry(contact).State = EntityState.Modified;
                ctx.SaveChanges();
            }
        }     
    }
}