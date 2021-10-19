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
  [RoutePrefix("api/cliente")]
  [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
  public class ClienteController : ApiController
    {

    // GET: api/Cuenta/5
    public Cliente Get(Int64 cuit)
    {
      GestorCliente cliente = new GestorCliente();
      return cliente.BuscarCliente(cuit);
    }

    public static int GetID(string mail)
    {
      GestorCliente buscarID = new GestorCliente();
      return buscarID.obtenerIDClienteM(mail);
    }

    public int Post(Cliente c)
    {
      GestorCliente cliente = new GestorCliente();
      return cliente.RegistrarCliente(c);     
    }

  }


}
