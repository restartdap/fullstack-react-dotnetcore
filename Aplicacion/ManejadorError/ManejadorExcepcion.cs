using System;
using System.Net;

namespace Aplicacion.ManejadorError
{
    public class ManejadorExcepcion : Exception
    {
        // Almacena el codigo de estado
        public HttpStatusCode Codigo { get; }
        // Almacena la lista de errores como un objeto
        public object Errores { get; }

        public ManejadorExcepcion(HttpStatusCode codigo, object errores = null) {
            Codigo = codigo;
            Errores = errores;
        }
    }
}