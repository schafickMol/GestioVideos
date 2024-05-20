using FluentValidation;
using GestorDeVideosData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorDeVideosData.Validations
{
    public class PlaylistValidator : AbstractValidator<PlaylistModel>
    {
        public PlaylistValidator()
        {
            RuleFor(x => x.YoutuberID)
                   .NotEmpty().WithMessage("El ID del Youtuber es obligatorio");

            RuleFor(x => x.Title)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El titulo de la playlist es obligatorio")
                .MinimumLength(2).WithMessage("Debe contener mínimo 2 letras");

            RuleFor(x => x.PlaylistDescription)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("La descripcion de la playlist es obligatorio")
                .MinimumLength(6).WithMessage("Debe contener mínimo 6 letras");

            RuleFor(x => x.CreationDate)
                   .NotEmpty().WithMessage("La fecha de creacion de la playlist es obligatorio");
        }
    }
}
