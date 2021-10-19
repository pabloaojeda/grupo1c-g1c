import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LandingComponent } from './pages/landing/landing.component';
import { LoginComponent } from './comp/login/login.component';
import { RegisterComponent } from './comp/register/register.component';
import { HomeComponent } from './pages/home/home.component';
import { IngresarDineroComponent } from './comp/ingresar-dinero/ingresar-dinero.component';
import { EgresarDineroComponent } from './comp/egresar-dinero/egresar-dinero.component';
import { AuthGuard } from './servicios/Auth/auth.guard';

const routes: Routes = [
  { path: 'home', component: LandingComponent },
  { path: 'Login', component: LoginComponent },
  { path: 'Registro', component: RegisterComponent },
  { path: 'movimientos', component: HomeComponent, canActivate: [AuthGuard] },
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  {
    path: 'movimientos/ingreso',
    component: IngresarDineroComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'movimientos/egreso',
    component: EgresarDineroComponent,
    canActivate: [AuthGuard],
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
export const ruta = [HomeComponent];
