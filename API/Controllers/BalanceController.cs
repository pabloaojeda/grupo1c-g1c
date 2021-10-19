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
  [RoutePrefix("api/balance")]
  [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
  public class BalanceController : ApiController
    {

      public decimal Get(int iD_Cuenta)
      {
        GestorBalance obtenerBalance = new GestorBalance();
        return obtenerBalance.obtenerBalancePorID(iD_Cuenta);
      }

    //public int GetID(int iD_Cliente, int iD_Tipo_Cuenta)
    //{
    //  GestorCuenta cuenta = new GestorCuenta();
    //  return cuenta.obtenerCuentaID(iD_Cliente, iD_Tipo_Cuenta);
    //}

  }
}
