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
  [RoutePrefix("api/cuenta")]
  [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
  public class CuentaController : ApiController
    {

      public List<Cuenta> Get(int iD_Cliente)
      {
        GestorCuenta cuenta = new GestorCuenta();
        //List<Cuenta> listaCuenta = cuenta.ListarCuenta(iD_Cliente);
        //return listaCuenta;
        return cuenta.ListarCuenta(iD_Cliente);
        
      }

      public int GetID(int iD_Cliente, int iD_Tipo_Cuenta)
      {
        GestorCuenta cuenta = new GestorCuenta();
        return cuenta.obtenerCuentaID(iD_Cliente, iD_Tipo_Cuenta);
      }

      public void Post(Cuenta cu)
      {
        GestorCuenta cuentaNueva = new GestorCuenta();
        cuentaNueva.CrearCuenta(cu);
      }

  }
}
