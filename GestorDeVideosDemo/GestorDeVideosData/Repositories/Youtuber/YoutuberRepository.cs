using GestorDeVideosData.Data;
using GestorDeVideosData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorDeVideosData.Repositories.Youtuber
{
    public class YoutuberRepository : IYoutuberRepository
    {
        private readonly IDbDataAccess _dataAccess;

        public YoutuberRepository(IDbDataAccess dataAccess)
        {
            _dataAccess = dataAccess;

        }

        public async Task<IEnumerable<YoutuberModel>> GetAllYoutuberAsync()
        {
            return await _dataAccess.GetDataAsync<YoutuberModel, dynamic>(
                "spYoutuber_GetAll",
                new { }
                );
        }

        public async Task<YoutuberModel?> GetYoutuberByIdAsync(int id)
        {
            var youtuber = await _dataAccess.GetDataAsync<YoutuberModel, dynamic>(
                "spYoutuber_GetByID",
                new { YoutuberID = id }
                );

            return youtuber.FirstOrDefault();
        }

        public async Task AddYoutuberAsync(YoutuberModel youtuber)
        {
            await _dataAccess.SaveDataAsync(
                "spYoutuber_Insert",
                new { youtuber.YoutuberName, youtuber.ChannelName, youtuber.Country }
                );
        }

        public async Task EditYoutuberAsync(YoutuberModel youtuber)
        {
            await _dataAccess.SaveDataAsync(
                "spYoutuber_Update",
                youtuber
                );
        }

        public async Task DeleteYoutuberAsync(int id)
        {
            await _dataAccess.SaveDataAsync(
                "spYoutuber_Delete",
                new { YoutuberID = id }
                );
        }

    }

}
