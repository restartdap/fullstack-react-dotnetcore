using System.Threading.Tasks;
using Aplicacion.Seguridad;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers
{
    public class UsuarioController : MiControllerBase
    {
        [HttpPost("login")]
        public async Task<ActionResult<UsuarioData>> Login(Login.Ejecuta data) {
            return await Mediator.Send(data);
        }
    }
}