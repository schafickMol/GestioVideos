using FluentValidation.Results;
using FluentValidation;
using GestorDeVideosData.Models;
using GestorDeVideosData.Repositories.Video;
using GestorDeVideosData.Repositories.Youtuber;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace GestorDeVideosDemo.Controllers
{
    [Route("api/Videos")]
    [ApiController]
    public class VideoController : ControllerBase
    {
        private readonly IVideoRepository _videoRepository;
        private readonly IValidator<VideoModel> _validator;

        public VideoController(IVideoRepository videoRepository, IValidator<VideoModel> validator)
        {
            _videoRepository = videoRepository;
            _validator = validator;
        }


        // GET: api/<VideoController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var videos = await _videoRepository.GetAllVideosAsync();
            return Ok(videos);
        }

        // GET api/<VideoController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get(int id)
        {
            var video = await _videoRepository.GetVideoByIdAsync(id);
            if (video == null)
                return NotFound();
            return Ok(video);
        }

        // POST api/<VideoController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] VideoModel video)
        {
            FluentValidation.Results.ValidationResult validationResult = await _validator.ValidateAsync(video);
            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _videoRepository.AddVideoAsync(video);
            return Created();
        }


        // PUT api/<VideoController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] VideoModel video)
        {
            var videoEditable = await _videoRepository.GetVideoByIdAsync(id);
            if (videoEditable == null)
                return NotFound();

            FluentValidation.Results.ValidationResult validationResult = await _validator.ValidateAsync(video);
            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            video.VideoID = id;
            await _videoRepository.EditVideoAsync(video);
            return Accepted();
        }


        // DELETE api/<VideoController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var video = await _videoRepository.GetVideoByIdAsync(id);
            if (video == null)
                return NotFound();
            await _videoRepository.DeleteVideoAsync(id);
            return NoContent();
        }
    }
}
