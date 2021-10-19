import { Cliente } from './register.model';
import { TipoCuenta } from './tipo_Cuenta.model';

export class Cuenta {
    ID_Cuenta!: number;
    CBU! : string;
    ID_Tipo_Cuenta!: TipoCuenta;
    ID_Cliente! : Cliente;
}