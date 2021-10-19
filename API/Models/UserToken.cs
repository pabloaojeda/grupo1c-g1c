using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace API.Models
{
  public class UserToken
  {
    public int ID_Cliente { get; set; }
    public string Mail { get; set; }
    public string Token { get; set; }

  }
}
