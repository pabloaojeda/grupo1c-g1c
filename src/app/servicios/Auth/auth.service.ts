import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs/internal/BehaviorSubject';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { LoginRequest } from '../../models/LoginRequest.model';

const TOKEN_KEY = 'auth-token';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  tokenOtro: any = localStorage.getItem('currentUser');
  loged: boolean = false;
  loggedIn = new BehaviorSubject<boolean>(false);
  url = 'https://localhost:44345/api/login/authenticate';
  currentUserSubject: BehaviorSubject<LoginRequest>;
  currentUser: Observable<LoginRequest>;
  constructor(private http: HttpClient) {
    console.log('Servicio de Autenticación esta corriendo');

    this.currentUserSubject = new BehaviorSubject<LoginRequest>(
      JSON.parse(localStorage.getItem('currentUser') || '{}')
    );
    this.currentUser = this.currentUserSubject.asObservable();
  }

  //----- Iniciar Sesion ------
  login(usuario: LoginRequest): Observable<any> {
    return this.http
      .post<any>(this.url, usuario)

      .pipe(
        map((data) => {
          localStorage.setItem('currentUser', JSON.stringify(data));
          // localStorage.setItem('currentUser', data);
          this.currentUserSubject.next(data);
          this.loged = true;

          this.loggedIn.next(true);

          return data;
        })
      );
  }

  logout(): void {
    localStorage.removeItem('currentUser');

    this.loggedIn.next(false);
  }

  get usuarioAutenticado(): LoginRequest {
    return this.currentUserSubject.value;
  }

  get estaAutenticado(): Observable<boolean> {
    return this.loggedIn.asObservable();
  }
}
