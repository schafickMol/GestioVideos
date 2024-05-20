using FluentValidation;
using GestorDeVideosData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorDeVideosData.Validations
{
    public class VideoValidator : AbstractValidator<VideoModel>
    {
        public VideoValidator()
        {
            RuleFor(x => x.PlaylistID)
                .NotEmpty().WithMessage("El ID de la playlist es obligatorio");

            RuleFor(x => x.VideoTitle)
              .Cascade(CascadeMode.Stop)
              .NotEmpty().WithMessage("El titulo del Video es obligatorio")
              .MinimumLength(2).WithMessage("Debe contener mínimo 2 letras");


            RuleFor(x => x.UploadDate)
                .NotEmpty().WithMessage("La fecha de subida del video es obligatorio");


            RuleFor(x => x.Duration)
                .NotEmpty().WithMessage("La duracion del video es obligatoria");

            

        }
    }
        

    
}

