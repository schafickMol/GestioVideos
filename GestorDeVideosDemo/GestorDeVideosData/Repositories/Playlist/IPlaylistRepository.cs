using GestorDeVideosData.Models;

namespace GestorDeVideosData.Repositories.Playlist
{
    public interface IPlaylistRepository
    {
        Task AddPlaylistAsync(PlaylistModel playlist);
        Task DeletePlaylistAsync(int id);
        Task EditPlaylistAsync(PlaylistModel playlist);
        Task<IEnumerable<PlaylistModel>> GetAllPlaylistAsync();
        Task<PlaylistModel?> GetPlaylistByIdAsync(int id);
        Task<IEnumerable<VideoModel>> GetVideosByPlaylistIdAsync(int id);
    }
}