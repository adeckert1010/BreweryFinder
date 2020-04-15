using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using SampleApi.Models;

namespace SampleApi.DAL
{
    public interface IBreweryDAO
    {
        //create
        /// <summary>
        /// Adds a brewery to the database
        /// </summary>
        /// <returns></returns>
        Brewery AddBrewery();
        
        //read
        /// <summary>
        /// Gets all Breweries
        /// </summary>
        IList<Brewery> GetBreweries();
        Brewery GetBrewery(int id);
        //update
        bool UpdateBrewery(Brewery brewery);

        bool AddBeer(int beerId, int breweryId);
        bool DeleteBeer(Beer beer);
        //delete
        bool DeleteBrewery(Brewery brewery);
    }
}
