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
        [Route("api/addContact")]
        public void AddContact([FromBody]NoteBookWebForms.Models.Contact contact)
        {
            contact.Date = DateTime.Now;
            ContactDataHelper.AddContact(contact);
        }

        [HttpPost]
        [Route("api/editContact")]
        public void EditContact([FromBody] NoteBookWebForms.Models.Contact contact)
        {
            contact.Date = DateTime.Now;
            ContactDataHelper.EditContact(contact);
        }

        // DELETE: api/Contact/5
        [HttpPost]        
        public void Delete(int id)
        {
            ContactDataHelper.ContactRemove(id);
        }
    }
}
