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
  [RoutePrefix("api/provincia")]
  [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
  public class ProvinciaController : ApiController
  {
    
      public List<Provincia> Get()
      {
        GestorCliente provincia = new GestorCliente();
        //List<Provincia> listProv = provincia.ObtenerProvincia();
        return provincia.ObtenerProvincia();  
      }

    
  }
}
