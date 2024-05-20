using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorDeVideosData.Models
{
    public class PlaylistModel
    {
        public int PlaylistID { get; set; }

        public int YoutuberID { get; set; }

        public string Title { get; set; }

        public string PlaylistDescription { get; set; }

        public DateTime CreationDate { get; set; }
        public List<VideoModel> Videos { get; set; }
    }

}
