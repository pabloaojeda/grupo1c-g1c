using API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace API.Controllers
{
  [RoutePrefix("api/localidad")]
  [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
  public class LocalidadController : ApiController
    {
    public List<Localidad> Get(int id)
    {
      GestorCliente localidad = new GestorCliente();
      //List < Localidad > listLocal = localidad.ObtenerLocalidadPorPr(id);
      return localidad.ObtenerLocalidadPorPr(id);
    }

  }
}
