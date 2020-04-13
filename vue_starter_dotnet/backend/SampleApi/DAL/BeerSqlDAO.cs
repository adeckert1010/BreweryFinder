using SampleApi.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;


namespace SampleApi.DAL
{
    public class BeerSqlDAO : IBeerDAO
    {

        private readonly string connectionString;

        public BeerSqlDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public Beer AddBeer()
        {
            throw new NotImplementedException();
        }

        public bool DeleteBeer()
        {
            throw new NotImplementedException();
        }

        public Beer GetBeer(int beerId)
        {
            Beer beer = new Beer();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(@"SELECT * FROM beer_info
                                                    WHERE beer_id = @beer_id; ", conn);

                    cmd.Parameters.AddWithValue("@beer_id", beerId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        beer = MapToBeer(reader);
                    } 


                }

                return beer;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public IList<Beer> GetBeers()
        {
            IList<Beer> beers = new List<Beer>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM beer_info", conn);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        beers.Add(MapToBeer(reader));
                    }
                }

                return beers;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public IList<Beer> GetBeersByName(string query)
        {
            IList<Beer> beers = new List<Beer>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM beer_info WHERE beer_name LIKE '%@query%'", conn);
                    cmd.Parameters.AddWithValue("@query", query);

                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        beers.Add(MapToBeer(reader));
                    }
                }

                return beers;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public bool UpdateBeer()
        {
            throw new NotImplementedException();
        }

        public IList<Beer> GetBeersAtBrewery(int breweryId)
        {
            IList<Beer> beers = new List<Beer>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(@"SELECT * FROM beer_info 
                                                    JOIN beer_location ON beer_location.beer_id = beer_info.beer_id 
                                                    JOIN brewery ON brewery.location_id = beer_location.location_id 
                                                    WHERE brewery.location_id = @breweryId; ", conn);

                    cmd.Parameters.AddWithValue("@breweryId", breweryId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        beers.Add(MapToBeer(reader));
                    }
                }

                return beers;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// convert an entry from the sql reader to a beer
        /// </summary>
        /// <param name="reader"></param>
        /// <returns></returns>
        private Beer MapToBeer(SqlDataReader reader)
        {

            var b = new Beer
            {
                Id = Convert.ToInt32(reader["beer_id"]),
                Name = Convert.ToString(reader["beer_name"]),
                ImageLocation = Convert.ToString(reader["beer_image"]),
                Type = Convert.ToString(reader["beer_type"]),
                Description = Convert.ToString(reader["beer_description"]),
                ABV = Convert.ToInt32(reader["abv"]),
                IBU = Convert.ToInt32(reader["ibu"])
            };

            return b;
        }
    }
}
