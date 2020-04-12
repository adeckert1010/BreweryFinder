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
        [Route("favoritebeers/{id}")]
        [HttpGet("{userId}")]
        public IEnumerable<Beer> GetFavorites(int userId) 
        {
            return userDao.GetFavoriteBeers(userId);
        }
    }
}
