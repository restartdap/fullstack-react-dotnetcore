using System;
using System.Net;
using System.Threading.Tasks;
using Aplicacion.ManejadorError;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace WebAPI.Middleware
{
    public class ManejadorErrorMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ManejadorErrorMiddleware> _logger;
        
        public ManejadorErrorMiddleware(RequestDelegate next, ILogger<ManejadorErrorMiddleware> logger) {
            _next = next;
            _logger = logger;
        }

        public async Task Invoke(HttpContext context) {
            try {
                // Si no hay alguna excepcion, continua con los procesos
                await _next(context);
            }
            catch (Exception ex) {
                // Si hay alguna excepcion, se invoca la funcion manejadora de excepciones
                await ManejadorExcepcionAsync(context, ex, _logger);
            }
        }

        private async Task ManejadorExcepcionAsync(HttpContext context, Exception ex, ILogger<ManejadorErrorMiddleware> logger) {
            object errores = null;
            switch (ex) {
                // Excepcion controlada por nosotros con Aplicacion/ManejadorError/ManejadorExcepcion.cs
                case ManejadorExcepcion me:
                    logger.LogError(ex, "Manejador Error");
                    errores = me.Errores;
                    context.Response.StatusCode = (int)me.Codigo;
                break;
                // Excepcion por defecto de AspNetCore
                case Exception e:
                    logger.LogError(ex, "Error de Servidor");
                    errores = string.IsNullOrWhiteSpace(e.Message) ? "Error" : e.Message;
                    context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
                break;
            }
            
            context.Response.ContentType = "application/json";

            if(errores != null) {
                var resultados = JsonConvert.SerializeObject(new {errores});
                await context.Response.WriteAsync(resultados);
            }
        }
    }
}