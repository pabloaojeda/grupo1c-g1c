import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Localidad } from '../models/localidades.model';

  // const urlLocalidad: string = 'https://localhost:44345/api/localidad/';
  const httpOptions = {
    headers: new HttpHeaders({ 'Content-Type': 'application/json' })
  };

@Injectable({
  providedIn: 'root'
})
export class LocalidadService {
  urlLocalidad: string;
  List: Localidad[] = [];

  constructor(private http: HttpClient) {
    this.urlLocalidad='https://localhost:44345/api/localidad/'
   }

  getLocalidadPorId(ID_Provincia : number): Observable<Localidad[]> {
    return this.http.get<Localidad[]>(this.urlLocalidad+ID_Provincia,httpOptions)
  }
}
