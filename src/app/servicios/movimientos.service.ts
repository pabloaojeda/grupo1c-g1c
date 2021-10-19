import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Movimiento } from '../models/movimiento.model';

@Injectable({
  providedIn: 'root',
})
export class MovimientosService {
  urlMovimientos: string = 'https://localhost:44345/api/Movimientos';
  constructor(private http: HttpClient) {}
  postTransferencia(transferencia: Movimiento) {
    return this.http.post(this.urlMovimientos, transferencia);
  }
}
