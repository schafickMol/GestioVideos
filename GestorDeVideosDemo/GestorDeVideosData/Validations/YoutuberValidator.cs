using FluentValidation;
using GestorDeVideosData.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestorDeVideosData.Validations
{
    public class YoutuberValidator : AbstractValidator<YoutuberModel>
    {
        public YoutuberValidator() 
        {
            RuleFor(x => x.YoutuberName)
               .Cascade(CascadeMode.Stop)
               .NotEmpty().WithMessage("El nombre del Youtuber es obligatorio")
               .MinimumLength(8).WithMessage("Debe contener mínimo 8 letras");

            RuleFor(x => x.ChannelName)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El nombre del canal es obligatorio")
                .MinimumLength(6).WithMessage("Debe contener mínimo 6 letras");

            RuleFor(x => x.Country)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage("El país del youtuber es obligatorio")
                .MinimumLength(6).WithMessage("Debe contener mínimo 6 letras");
        }
    }
}
