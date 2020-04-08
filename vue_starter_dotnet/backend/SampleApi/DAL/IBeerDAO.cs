using SampleApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SampleApi.DAL
{
    public interface IBeerDAO
    {
        //create
        /// <summary>
        /// Adds a brewery to the database
        /// </summary>
        /// <returns></returns>
        Beer AddBeer();

        //read
        /// <summary>
        /// Gets all Beers
        /// </summary>
        /// <returns>List of beers</returns>
        IList<Beer> GetBeers();

        IList<Beer> GetBeersAtBrewery(int breweryId);
        
        /// <summary>
        /// Gets one Beer
        /// </summary>
        /// <returns></returns>
        Beer GetBeer(int beerId);
        
        //update
        bool UpdateBeer();

        //delete
        bool DeleteBeer();

    }
}
