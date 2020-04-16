using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleApi.DAL;
using SampleApi.Models;
using SampleApi.Models.Account;
using Microsoft.AspNetCore.Authorization;
using SampleApi.Providers.Security;

namespace SampleApi.Controllers
{
    //move routes for each function/method/whatever
    [Route("api/[controller]")]
    [ApiController]
    public class BreweriesController : ControllerBase
    {
        private IBreweryDAO breweryDao;

        public BreweriesController(IBreweryDAO dao)
        {
            this.breweryDao = dao;
        }

        /// <summary>
        /// Get breweries based on a search query
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        [Route("searchresults/{query}")]
        [HttpGet]
        public IEnumerable<Brewery> GetSearchResults(string query)
        {
            return breweryDao.GetBreweries();

        }

        // GET: api/Breweries
        [HttpGet]
        public IEnumerable<Brewery> Get()
        {
            return breweryDao.GetBreweries();
            
        }

        // GET: api/Breweries/5
        [HttpGet("{id}")]
        public Brewery Get(int id)
        {
            return breweryDao.GetBrewery(id);
        }

        // POST: api/Breweries
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Breweries/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
