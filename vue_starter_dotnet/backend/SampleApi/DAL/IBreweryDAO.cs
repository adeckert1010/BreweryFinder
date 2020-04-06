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
        void GetBreweries();
        //update

        //delete
    }
}
