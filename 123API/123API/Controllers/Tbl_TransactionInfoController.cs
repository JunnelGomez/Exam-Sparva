using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using _123API.Models;

namespace _123API.Controllers
{
    public class Tbl_TransactionInfoController : ApiController
    {
        private Dbmodels db = new Dbmodels();

        // GET api/Tbl_TransactionInfo
        public IQueryable<Tbl_TransactionInfo> GetTbl_TransactionInfo()
        {
            return db.Tbl_TransactionInfo;
        }

        // GET api/Tbl_TransactionInfo/5
        [ResponseType(typeof(Tbl_TransactionInfo))]
        public IHttpActionResult GetTbl_TransactionInfo(int id)
        {
            Tbl_TransactionInfo tbl_transactioninfo = db.Tbl_TransactionInfo.Find(id);
            if (tbl_transactioninfo == null)
            {
                return NotFound();
            }

            return Ok(tbl_transactioninfo);
        }

        // PUT api/Tbl_TransactionInfo/5
        public IHttpActionResult PutTbl_TransactionInfo(int id, Tbl_TransactionInfo tbl_transactioninfo)
        {
           

            if (id != tbl_transactioninfo.TransactionCode)
            {
                return BadRequest();
            }

            db.Entry(tbl_transactioninfo).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!Tbl_TransactionInfoExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST api/Tbl_TransactionInfo
        [ResponseType(typeof(Tbl_TransactionInfo))]
        public IHttpActionResult PostTbl_TransactionInfo(Tbl_TransactionInfo tbl_transactioninfo)
        {
          

            db.Tbl_TransactionInfo.Add(tbl_transactioninfo);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tbl_transactioninfo.TransactionCode }, tbl_transactioninfo);
        }

        // DELETE api/Tbl_TransactionInfo/5
        [ResponseType(typeof(Tbl_TransactionInfo))]
        public IHttpActionResult DeleteTbl_TransactionInfo(int id)
        {
            Tbl_TransactionInfo tbl_transactioninfo = db.Tbl_TransactionInfo.Find(id);
            if (tbl_transactioninfo == null)
            {
                return NotFound();
            }

            db.Tbl_TransactionInfo.Remove(tbl_transactioninfo);
            db.SaveChanges();

            return Ok(tbl_transactioninfo);


        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool Tbl_TransactionInfoExists(int id)
        {
            return db.Tbl_TransactionInfo.Count(e => e.TransactionCode == id) > 0;
        }
    }
}