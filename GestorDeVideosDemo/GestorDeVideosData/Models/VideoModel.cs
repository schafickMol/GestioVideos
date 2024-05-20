using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorDeVideosData.Models
{
    public class VideoModel
    {
        public int VideoID { get; set; }
        public int PlaylistID { get; set; }
        public string? VideoTitle { get; set; }
        public DateTime UploadDate { get; set; }
        public int Duration { get; set; }
    }
}
