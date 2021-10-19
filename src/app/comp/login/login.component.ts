import { Component, OnInit } from '@angular/core';
import {
  Validators,
  FormControl,
  FormBuilder,
  FormGroup,
} from '@angular/forms';
import { Router, RouterLink } from '@angular/router';
import { AuthService } from 'src/app/servicios/Auth/auth.service';
import { LoginRequest } from 'src/app/models/LoginRequest.model';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent {
  error?: string;
  usuario: LoginRequest = new LoginRequest();
  emailPattern = '^[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$';
  mail = new FormControl('', [
    Validators.required,
    Validators.pattern(this.emailPattern),
  ]);

  passwordPattern =
    '(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*?&])[A-Za-zd$@$!%*?&].{8,15}';
  password = new FormControl('', [
    Validators.required,
    Validators.pattern(this.passwordPattern),
    Validators.minLength(8),
  ]);

  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit(): void {}
  get mailField() {
    return this.mail;
  }

  get passwordField() {
    return this.password;
  }

  onEnviar() {
    console.log(this.usuario);
    this.usuario.Mail = this.mail.value;
    this.usuario.Password = this.password.value;
    this.authService.login(this.usuario).subscribe(
      (data) => {
        console.log('DATA' + JSON.stringify(data));

        this.router.navigate(['/movimientos']);
      },
      (error) => {
        this.error = error;
      }
    );
  }

  // redirect(){
  //     RouterLink {component: "HomeComponent"}
  // }
  // onEnviar(event: Event)
  // {
  //   // event.preventDefault(); //Cancela la funcionalidad por default.
  //   if (this.password.valid)
  //   {
  //     route = new RouterLink(this.);
  //   }
  //   else
  //   {
  //     this.password.markAllAsTouched(); //Activa todas las validaciones
  //   }
  // }
}
