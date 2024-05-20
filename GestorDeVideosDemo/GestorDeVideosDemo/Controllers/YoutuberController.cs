using FluentValidation;
using FluentValidation.Results;
using GestorDeVideosData.Models;
using GestorDeVideosData.Repositories.Youtuber;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace GestorDeVideosDemo.Controllers
{
    [Route("api/Youtuber")]
    [ApiController]
    public class YoutuberController : ControllerBase
    {

        private readonly IYoutuberRepository _youtuberRepository;
        private readonly IValidator<YoutuberModel> _validator;

        public YoutuberController(IYoutuberRepository youtuberRepository,IValidator<YoutuberModel> validator)
        {
            _youtuberRepository = youtuberRepository;
            _validator = validator;
            
        }



        // GET: api/<YoutuberController>
        [HttpGet]
        public async Task<IActionResult> Get()
        {
            var youtuber = await _youtuberRepository.GetAllYoutuberAsync();

            return Ok(youtuber);
        }


        // GET api/<YoutuberController>/5
        [HttpGet("{id}")]
        public string Get(int id)
        {
            return "value";
        }


        // POST api/<YoutuberController>
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] YoutuberModel youtuber)
        {

            ValidationResult validationResult = await _validator.ValidateAsync(youtuber);
            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _youtuberRepository.AddYoutuberAsync(youtuber);

            return Created();
        }


        // PUT api/<YoutuberController>/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] YoutuberModel youtuber)
        {
            var youtuberEditable = await _youtuberRepository.GetYoutuberByIdAsync(id);

            if (youtuberEditable == null)
                return NotFound();

            ValidationResult validationResult = await _validator.ValidateAsync(youtuber);

            if (!validationResult.IsValid)
                return UnprocessableEntity(validationResult);

            await _youtuberRepository.EditYoutuberAsync(youtuber);

            return Accepted();
        }

        // DELETE api/<YoutuberController>/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var youtuber = await _youtuberRepository.GetYoutuberByIdAsync(id);
            if (youtuber == null)
                return NotFound();

            await _youtuberRepository.DeleteYoutuberAsync(id);
            return NoContent();
        }
    }
}
