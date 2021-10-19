import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Provincia } from '../models/provincia.model';
// import { Provincia } from '../interfaces/provincia.interface';
import { HttpClient, HttpHeaders } from '@angular/common/http';


const urlProvincia: string = 'https://localhost:44345/api/provincia';
const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root',
})

export class ProvinciaService {
  
  list: Provincia[] = [];

  constructor(private http: HttpClient) {}

  getProvincia(): Observable<Provincia[]> {
    return this.http.get<Provincia[]>(urlProvincia, httpOptions);
  }
}
