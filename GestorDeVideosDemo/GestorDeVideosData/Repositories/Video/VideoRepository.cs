using GestorDeVideosData.Data;
using GestorDeVideosData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorDeVideosData.Repositories.Video
{
    public class VideoRepository : IVideoRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public VideoRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<VideoModel>> GetAllVideosAsync()
        {
            return await _dataAccess.GetDataAsync<VideoModel, dynamic>(
                "spVideo_GetAll",
                new { }
            );
        }

        public async Task<VideoModel?> GetVideoByIdAsync(int id)
        {
            var videos = await _dataAccess.GetDataAsync<VideoModel, dynamic>(
                "spVideo_GetByID",
                new { VideoID = id }
            );

            return videos.FirstOrDefault();
        }

        public async Task AddVideoAsync(VideoModel video)
        {
            await _dataAccess.SaveDataAsync(
                "spVideo_Insert",
                new { video.PlaylistID, video.VideoTitle, video.UploadDate, video.Duration }
            );
        }

        public async Task EditVideoAsync(VideoModel video)
        {
            await _dataAccess.SaveDataAsync(
                "spVideo_Update",
                new { video.VideoID, video.PlaylistID, video.VideoTitle, video.UploadDate, video.Duration }
            );
        }

        public async Task DeleteVideoAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "spVideo_Delete",
                new { VideoID = id }
            );
        }
    }
}
