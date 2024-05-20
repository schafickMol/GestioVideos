using GestorDeVideosData.Models;

namespace GestorDeVideosData.Repositories.Video
{
    public interface IVideoRepository
    {
        Task AddVideoAsync(VideoModel video);
        Task DeleteVideoAsync(int id);
        Task EditVideoAsync(VideoModel video);
        Task<IEnumerable<VideoModel>> GetAllVideosAsync();
        Task<VideoModel?> GetVideoByIdAsync(int id);
    }
}