using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
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

        /// <summary>
        /// 
        /// </summary>
        /// <param name="beerId"></param>
        /// <returns></returns>
        [Route("addfavbeer")]
        [HttpPost]
        //[ValidateAntiForgeryToken]//from reading
        [Authorize]//like ValuesController.cs
        public IActionResult AddFavBeer([FromBody] int beerId)
        {
            // Assume the user is not authorized
            IActionResult result = Unauthorized();//Can we say a message like 'log in to favorite'

            //Get User for ID to search the user/beer table
            User user = userDao.GetUser(User.Identity.Name);
            
            if (user != null)
            {
                // add the favorite beer/user combo to the databse
                //userDao.AddFavoriteBeer(user.Id, beerId);
                userDao.AddFavoriteBeer(user.Id, beerId);
                // Switch to 200 OK
                result = Ok();
            }


            return result;

        }
    }
}
