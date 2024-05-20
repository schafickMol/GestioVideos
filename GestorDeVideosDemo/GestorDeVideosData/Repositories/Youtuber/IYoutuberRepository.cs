using GestorDeVideosData.Models;

namespace GestorDeVideosData.Repositories.Youtuber
{
    public interface IYoutuberRepository
    {
        Task AddYoutuberAsync(YoutuberModel youtuber);
        Task DeleteYoutuberAsync(int id);
        Task EditYoutuberAsync(YoutuberModel youtuber);
        Task<IEnumerable<YoutuberModel>> GetAllYoutuberAsync();
        Task<YoutuberModel?> GetYoutuberByIdAsync(int id);
    }
}