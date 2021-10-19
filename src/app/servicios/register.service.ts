import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Cliente } from '../models/register.model';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root',
})
export class RegisterService {
  urlRegister: string = 'https://localhost:44345/api/Cliente';

  constructor(private http: HttpClient) {}

  postRegister(cliente: Cliente){
    // console.log(cliente);
    return this.http.post(this.urlRegister,cliente)
}
}

