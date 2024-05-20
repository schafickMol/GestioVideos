using FluentValidation;
using FluentValidation.Results;
using GestorDeVideosData.Models;
using GestorDeVideosData.Repositories.Playlist;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace GestorDeVideosDemo.Controllers
{
    [Route("api/Playlist")]
    [ApiController]
    public class PlaylistController : ControllerBase
    {
        private readonly IPlaylistRepository _playlistRepository;
        private readonly IValidator<PlaylistModel> _validator;

        public PlaylistController(IPlaylistRepository playlistRepository, IValidator<PlaylistModel> validator)
        {
            _playlistRepository = playlistRepository;
            _validator = validator;
        }

        // GET: api/<PlaylistController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var playlist = await _playlistRepository.GetAllPlaylistAsync();
            return Ok(playlist);
        }

        // GET api/<PlaylistController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var playlist = await _playlistRepository.GetPlaylistByIdAsync(id);
            if (playlist == null)
                return NotFound();
            return Ok(playlist);
        }


        // POST api/<PlaylistController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] PlaylistModel album)
        {
            ValidationResult validationResult = await _validator.ValidateAsync(album);
            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _playlistRepository.AddPlaylistAsync(album);
            return Created();
        }

        // PUT api/<PlaylistController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] PlaylistModel playlist)
        {
            var playlistEditable = await _playlistRepository.GetPlaylistByIdAsync(id);
            if (playlistEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(playlist);
            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            playlist.PlaylistID = id;
            await _playlistRepository.EditPlaylistAsync(playlist);
            return Accepted();
        }


        // DELETE api/<PlaylistController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var playlist = await _playlistRepository.GetPlaylistByIdAsync(id);
            if (playlist == null)
                return NotFound();
            await _playlistRepository.DeletePlaylistAsync(id);
            return NoContent();
        }
    }
}
