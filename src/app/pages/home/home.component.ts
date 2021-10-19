import { Component, OnInit } from '@angular/core';
import { CuentaService } from 'src/app/servicios/cuenta.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  idcuenta: number = 0;
  balance: number = 0;
  constructor(private cuentaService: CuentaService) { }

  ngOnInit(): void {
    let idcliente = localStorage.getItem('currentUser');
    let user = {
      ID_Cliente : 0
    };
    if (idcliente) {
      user = JSON.parse(idcliente);
      console.log(user);
    }
    this.cuentaService.getCuentaPorClyTi(user.ID_Cliente, 0).subscribe((res: any) => {
      this.idcuenta = res;
      console.log(this.idcuenta);
      this.cuentaService.getBalancePorCuenta(this.idcuenta).subscribe((res: any) => {
        this.balance = res;
        console.log(this.balance);
      })
    });
  }

}
