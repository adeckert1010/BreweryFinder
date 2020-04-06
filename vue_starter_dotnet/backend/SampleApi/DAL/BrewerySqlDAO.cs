using SampleApi.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace SampleApi.DAL
{
    public class BrewerySqlDAO : IBreweryDAO
    {
        private readonly string connectionString;
        
        /// <param name="connectionString"></param>
        public BrewerySqlDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }
        /// <summary>
        /// Add a beer to a particular brewery
        /// </summary>
        /// <param name="beer"></param>
        /// <returns></returns>
        public bool AddBeer(int beerId, int breweryId)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO beer_location VALUES (@beer_id, @location_id);", conn);
                    cmd.Parameters.AddWithValue("@beer_id", beerId);
                    cmd.Parameters.AddWithValue("@location_id", breweryId);
                    cmd.ExecuteNonQuery();

                    return true;
                }
            }
            catch (SqlException ex)
            {
                return false;
            }
        }

        public Brewery AddBrewery()
        {
            throw new NotImplementedException();
        }

        public bool DeleteBeer(Beer beer)
        {
            throw new NotImplementedException();
        }

        public bool DeleteBrewery(Brewery brewery)
        {
            throw new NotImplementedException();
        }

        public IList<Brewery> GetBreweries()
        {
            IList<Brewery> breweries = new List<Brewery>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM brewery", conn);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        breweries.Add(MapToBrewery(reader));
                    }
                }

                return breweries;
            }
            catch (SqlException ex)
            {
                return breweries;
            }
        }

        private Brewery MapToBrewery(SqlDataReader reader)
        {
            /*return new Brewery()
            {
                Id = Convert.ToInt32(reader["location_id"]),
                Name = Convert.ToString(reader["location_name"]),
                Address_1 = Convert.ToString(reader["address_line1"]),
                Address_2 = Convert.ToString(reader["address_line2"]),
                City = Convert.ToString(reader["city"]),
                District = Convert.ToString(reader["district"]),
                ZipCode = Convert.ToString(reader["zipcode"]),
                ImageLocation = Convert.ToString(reader["image_address"]),
                Type = Convert.ToString(reader["bar_brewery_brewpub"]),
                Established = Convert.ToDateTime(reader["established"]),
                BackgroundInfo = Convert.ToString(reader["background_info"])
            };*/
            var b = new Brewery();
            b.Id = Convert.ToInt32(reader["location_id"]);
            b.Name = Convert.ToString(reader["location_name"]);
            b.Address_1 = Convert.ToString(reader["address_line1"]);
            b.Address_2 = Convert.ToString(reader["address_line2"]);
            b.City = Convert.ToString(reader["city"]);
            b.District = Convert.ToString(reader["district"]);
            b.ZipCode = Convert.ToString(reader["zipcode"]);
            b.ImageLocation = Convert.ToString(reader["image_address"]);
            b.Type = Convert.ToString(reader["bar_brewery_brewpub"]);
            if (!Convert.IsDBNull(reader["established"])) { b.Established = Convert.ToDateTime(reader["established"]); }
            b.BackgroundInfo = Convert.ToString(reader["background_info"]);
            return b;
        }

        public Brewery GetBrewery()
        {
            throw new NotImplementedException();
        }

        public bool UpdateBrewery(Brewery brewery)
        {
            throw new NotImplementedException();
        }
    }
}
