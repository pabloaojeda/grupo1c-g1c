import { TipoCuenta } from "./tipo_Cuenta.model"
import { Cuenta } from "./cuenta.model"

export class Balance {
    ID_Balance!: number;
    Balance! : number;
    ID_Tipo_Cuenta! : TipoCuenta;
    ID_Cuenta! : Cuenta;
}