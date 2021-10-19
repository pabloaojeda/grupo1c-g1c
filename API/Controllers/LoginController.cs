using API.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Web.Http;
using System.Web.Http.Cors;

namespace API.Controllers
{
  [AllowAnonymous]
  [RoutePrefix("api/login")]
  [EnableCors(origins: "http://localhost:4200", headers: "*", methods: "*")]
  public class LoginController : ApiController
  {
    [HttpGet]
    [Route("echoping")]
    public IHttpActionResult EchoPing()
    {
      return Ok(true);
    }

    [HttpGet]
    [Route("echouser")]
    public IHttpActionResult EchoUser()
    {
      var identity = Thread.CurrentPrincipal.Identity;
      return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
    }

    [HttpPost]
    [System.Web.Mvc.AllowAnonymous]
    [Route("authenticate")]
    public IHttpActionResult Authenticate(LoginRequest login)
    {
      if (login == null)
        throw new HttpResponseException(HttpStatusCode.BadRequest);

      //TODO: Validate credentials Correctly, this code is only for demo !!
      GestorLogin loginGestor = new GestorLogin();
      bool isCredentialValid = loginGestor.ValidarLogin(login);
      if (isCredentialValid)
      {
        var id = ClienteController.GetID(login.Mail); 
        var token = TokenGenerator.GenerateTokenJwt(login.Mail);
        var userToken = new UserToken();
        userToken.ID_Cliente = id;
        userToken.Mail = login.Mail;
        userToken.Token = token;

        return Ok(userToken);
      }
      else
      {
        return Unauthorized();
      }
    }
  }
}
