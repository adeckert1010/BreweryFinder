using SampleApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SampleApi.DAL
{
    /// <summary>
    /// An interface for user data objects.
    /// </summary>
    public interface IUserDAO
    {
        /// <summary>
        /// Retrieves a user from the system by username.
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        User GetUser(string username);

        /// <summary>
        /// Creates a new user.
        /// </summary>
        /// <param name="user"></param>
        void CreateUser(User user);

        /// <summary>
        /// Updates a user.
        /// </summary>
        /// <param name="user"></param>
        void UpdateUser(User user);

        /// <summary>
        /// Deletes a user from the system.
        /// </summary>
        /// <param name="user"></param>
        void DeleteUser(User user);

        /// <summary>
        /// Lets a user add a beer to favorites list
        /// </summary>
        /// <param name="beer">The beer to be added to favorites</param>
        void AddFavoriteBeer(int userId, int beerId);

        /// <summary>
        /// Gets a list of a user's favorite beers
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        IEnumerable<Beer> GetFavoriteBeers(int UserId);
    }
}
