using GestorDeVideosData.Data;
using GestorDeVideosData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorDeVideosData.Repositories.Playlist
{
    public class PlaylistRepository : IPlaylistRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public PlaylistRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;
        }

        public async Task<IEnumerable<PlaylistModel>> GetAllPlaylistAsync()
        {
            var playlists = await _dataAccess.GetDataAsync<PlaylistModel, dynamic>(
                "spPlaylist_GetAll",
                new { }
            );

            foreach (var playlist in playlists)
            {
                playlist.Videos = (List<VideoModel>)await GetVideosByPlaylistIdAsync(playlist.PlaylistID);
            }

            return playlists;
        }

        public async Task<PlaylistModel?> GetPlaylistByIdAsync(int id)
        {
            var playlist = await _dataAccess.GetDataAsync<PlaylistModel, dynamic>(
                "spPlaylist_GetByID",
                new { PlaylistID = id }
            );

            if (playlist.Any())
            {
                var playlistModel = playlist.First();
                playlistModel.Videos = (List<VideoModel>)await GetVideosByPlaylistIdAsync(id);
                return playlistModel;
            }

            return null;
        }

        public async Task AddPlaylistAsync(PlaylistModel playlist)
        {
            await _dataAccess.SaveDataAsync(
                "spPlaylist_Insert",
                new { playlist.YoutuberID, playlist.Title, playlist.PlaylistDescription, playlist.CreationDate }
            );
        }

        public async Task EditPlaylistAsync(PlaylistModel playlist)
        {
            await _dataAccess.SaveDataAsync(
                "spPlaylist_Update",
                new { playlist.Title, playlist.PlaylistDescription, playlist.CreationDate }
            );
        }

        public async Task DeletePlaylistAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "spPlaylist_Delete",
                new { PlaylistID = id }
            );
        }

        public async Task<IEnumerable<VideoModel>> GetVideosByPlaylistIdAsync(int id)
        {
            return await _dataAccess.GetDataAsync<VideoModel, dynamic>(
                "spVideos_GetByPlaylistID",
                new { PlaylistID = id }
            );
        }
    }
}
