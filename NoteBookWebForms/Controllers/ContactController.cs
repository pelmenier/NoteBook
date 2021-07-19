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
        public NoteBookWebForms.Models.Contact Get(int id)
        {
            return ContactDataHelper.GetContact(id);
        }

        // POST: api/Contact
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Contact/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Contact/5
        [HttpDelete]
        public void Delete(int id)
        {
            ContactDataHelper.ContactRemove(id);
        }
    }
}
