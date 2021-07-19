using NoteBookWebForms.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace NoteBookWebForms.Controllers
{
    public class ContactController : ApiController
    {
        // GET: api/Contacts
        [HttpGet]
        public IEnumerable<NoteBookWebForms.Models.Contact> GetAllContacts()
        {
            return ContactDataHelper.GetAllContactsList();
        }

        // GET: api/Contact/5
        [HttpGet]
        public NoteBookWebForms.Models.Contact GetContact(int id)
        {
            return ContactDataHelper.GetContact(id);
        } 
        
        [HttpPost]
        public void AddContact(NoteBookWebForms.Models.Contact contact)
        {
            ContactDataHelper.AddContact(contact);
        }

        [HttpPost]
        public void EditContact(int id, [FromBody]string value, NoteBookWebForms.Models.Contact contact)
        {
            ContactDataHelper.EditContact(contact);
        }

        // DELETE: api/Contact/5
        [HttpDelete]
        public void Delete(int id)
        {
            ContactDataHelper.ContactRemove(id);
        }
    }
}
