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

        public Beer GetBeer()
        {
            throw new NotImplementedException();
        }

        public IList<Beer> GetBeers()
        {
            IList<Beer> beers = new List<Beer>();
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM brewery", conn);

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
            throw new NotImplementedException();
        }

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
