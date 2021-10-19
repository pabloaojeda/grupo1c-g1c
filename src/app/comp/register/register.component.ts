import { Component, OnInit } from '@angular/core';
import {
  Validators,
  FormControl,
  FormBuilder,
  FormGroup,
} from '@angular/forms';

import { ToastrService } from 'ngx-toastr';
import { Router } from '@angular/router';
import { Provincia } from 'src/app/models/provincia.model';
import { ProvinciaService } from 'src/app/servicios/provincia.service';
import { RegisterService } from 'src/app/servicios/register.service';
import { Localidad } from 'src/app/models/localidades.model';
import { LocalidadService } from 'src/app/servicios/localidad.service';
import { Cliente } from 'src/app/models/register.model';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css'],
})
export class RegisterComponent implements OnInit {
  public clientes: Cliente[] = [];
  registroCliente: Cliente = new Cliente();
  clienteDefault: Cliente = new Cliente();

  public provincias: Provincia[] = [];
  public localidades: Localidad[] = [];

  selectorProvselected: Provincia = { ID_Provincia: 0, Provincia1: '' };

  public previsualizacion: string = '';
  public archivos: any = [];

  emailPatternReg = '^[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,4}$';
  passwordPatternReg =
    '(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[$@$!%*?&])[A-Za-zd$@$!%*?&].{8,15}';

  formRegister: FormGroup = this.formBuilder.group({});

  foto_frontal = new FormControl('', [Validators.required]);
  dni_delante = new FormControl('', [Validators.required]);
  dni_detras = new FormControl('', [Validators.required]);
  emailRegistro = new FormControl('', [
    Validators.pattern(this.emailPatternReg),
    Validators.required,
  ]);
  passwordRegistro = new FormControl('', [
    Validators.pattern(this.passwordPatternReg),
    Validators.minLength(8),
    Validators.required,
  ]);
  passwordRegistro2 = new FormControl('', [Validators.required]);
  provincia = new FormControl('', [Validators.required]);
  localidad = new FormControl('', [Validators.required]);
  nombre = new FormControl('', [Validators.required]);
  apellido = new FormControl('', [Validators.required]);
  cuil_cuit = new FormControl('', [Validators.required]);
  domicilio = new FormControl('', [Validators.required]);

  constructor(
    private registerService: RegisterService,
    private router: Router,
    private formBuilder: FormBuilder,
    private provinciaService: ProvinciaService,
    private localidadService: LocalidadService,
    private toastr: ToastrService
  ) {}

  ngOnInit(): void {
    //recibe las provincias al iniciar la página
    this.provinciaService.getProvincia().subscribe((res: Provincia[]) => {
      this.provincias = res;
      // console.log(this.provincias);
    });
  }

  //Obtiene las localidades de cada provincia.
  ObtenerLocalidadPorPr() {
    console.log(this.provincia.value);
    this.localidadService
      .getLocalidadPorId(this.provincia.value)
      .subscribe((res: Localidad[]) => {
        // console.log(res);
        this.localidades = res;
        // console.log(this.localidades);
      });
  }

  //transforma imagenes en Base645 string
  extraerBase64 = async ($event: any) =>
    new Promise((resolve, _reject) => {
      try {
        // const unsafeImg = window.URL.createObjectURL($event);
        // const image = this.sanitizer.bypassSecurityTrustUrl(unsafeImg);
        const reader = new FileReader();
        reader.readAsDataURL($event);
        reader.onload = () => {
          resolve({
            base: reader.result,
          });
        };
        reader.onerror = (error) => {
          resolve({
            base: null,
          });
        };
      } catch (e) {}
    });

  capturarFile(event: any): any {
    const archivoCapturado = event.target.files[0];
    this.extraerBase64(archivoCapturado).then((imagen: any) => {
      this.previsualizacion = imagen.base;
      // console.log(imagen.base);
      this.archivos.push(imagen.base);
    });
    // this.archivos.push(archivoCapturado);
  }

  clearImage(): any {
    this.previsualizacion = '';
    this.archivos = [];
  }

  transFFrontal(event: any) {
    this.registroCliente.Foto_Frontal = this.capturarFile(event);
  }

  transDDelante(event: any) {
    this.registroCliente.DNI_delante = this.capturarFile(event);
  }

  transDDetras(event: any) {
    this.registroCliente.DNI_detras = this.capturarFile(event);
  }

  //parte de la validacion de los campos

  get emailRegistroField() {
    return this.emailRegistro;
  }

  get passwordRegistroField() {
    return this.passwordRegistro;
  }

  get passwordRegistroField2() {
    return this.passwordRegistro2;
  }

  onEnviar(cliente: Cliente) {
    // console.log(this.registroCliente);
    this.registroCliente.Foto_Frontal = this.foto_frontal.value;

    this.registroCliente.DNI_delante = this.dni_delante.value;

    this.registroCliente.DNI_detras = this.dni_detras.value;

    // this.registroCliente.Foto_Frontal = this.archivos[0];
    // this.registroCliente.DNI_delante = this.archivos[1];
    // this.registroCliente.DNI_detras =  this.archivos[2];

    // console.log(this.registroCliente);

    this.registerService.postRegister(cliente).subscribe((data) => {
      // console.log(data);
        if(data===1){
          alert("Usuario ya registrado")
        }
        else if (data===0){
          this.toastr.success('Usuario registrado con exito','exito',{positionClass:"toast-top-center"})
          this.router.navigate(['/Login']);
        }   
    });
  }
}
