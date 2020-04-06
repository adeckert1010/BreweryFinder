using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace SampleApi.Models
{
    public class Brewery
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address_1 { get; set; }
        public string Address_2 { get; set; }
        public string City { get; set; }
        public string District { get; set; }
        public string ZipCode { get; set; }
        public string ImageLocation { get; set; }
        public string Type { get; set; }
        public DateTime? Established { get; set; }
        public string BackgroundInfo { get; set; }
    }
}
