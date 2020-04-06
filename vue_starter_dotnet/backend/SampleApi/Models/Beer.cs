using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SampleApi.Models
{
    public class Beer
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ImageLocation { get; set; }
        public float ABV { get; set; }
        public int IBU { get; set; }
        public string Type { get; set; }

    }
}
