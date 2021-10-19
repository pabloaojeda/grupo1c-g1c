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
  [RoutePrefix("api/Movimientos")]
  [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
  public class MovimientosController : ApiController
    {
    public List<Movimiento> Get(int id)
    {
      GestorMovimiento movimiento = new GestorMovimiento();
      List<Movimiento> listMov = movimiento.ObtenerMovimientoPorCuenta(id);
      return listMov;
    }

    public int Post(Movimiento transferencia)
    {
      GestorMovimiento Mtransfer = new GestorMovimiento();
      return Mtransfer.Transferencia(transferencia);
    }
    //public void Post(Cliente c)
    //{
    //  GestorCliente cliente = new GestorCliente();
    //  cliente.RegistrarCliente(c);
    //}

  }
}
