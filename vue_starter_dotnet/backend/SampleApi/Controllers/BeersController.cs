using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SampleApi.DAL;
using SampleApi.Models;

namespace SampleApi.Controllers
{
    [Route("/")]
    [ApiController]
    public class BeersController : ControllerBase
    {
        private IBeerDAO beerDAO;

        public BeersController(IBeerDAO beerDao)
        {
            this.beerDAO = beerDao;
        }

        // GET: api/Beers
        [HttpGet]
        public IEnumerable<Beer> Get()
        {
            return beerDAO.GetBeers();
        }

        // GET: api/Beers/5
        [Route("api/beers/{id}")]
        [HttpGet("{id}")]
        public IEnumerable<Beer> Get(int id)
        {
            return beerDAO.GetBeersAtBrewery(id);
        }

        [Route("api/beer/{id}")]
        [HttpGet("{id}")]
        public Beer GetABeer(int id)
        {
            return beerDAO.GetBeer(id);
        }

        [Route("api/beers/searchresults/{query}")]
        [HttpGet("{query}")]
        public IEnumerable<Beer> GetBeersByName(string query)
        {
            return beerDAO.GetBeersByName(query);
        }

        // POST: api/Beers
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/Beers/5
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
