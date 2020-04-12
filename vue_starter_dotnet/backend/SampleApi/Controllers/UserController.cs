using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using SampleApi.DAL;
using SampleApi.Models;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace SampleApi.Controllers
{
    [Route("/api/")]
    [ApiController]
    public class UserController : Controller
    {
        private IUserDAO userDao;

        public UserController(IUserDAO beerDao)
        {
            this.userDao = beerDao;
        }

        // GET: /<controller>/
        [Route("favoritebeers/{userId}")]
        [HttpGet("{userId}")]
        public IEnumerable<Beer> GetFavorites(int userId) 
        {
            return userDao.GetFavoriteBeers(userId);
        }

        //This needs to use the user's token to do stuff. How Do?
        // PUT: api/Beers/5
        [HttpPut("{beer-id}")]
        public void AddFavBeer(int id, [FromBody] int beerId)
        {
            //Get User ID?

        }
    }
}
