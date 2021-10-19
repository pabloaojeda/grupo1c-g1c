import { TipoMovimiento } from './tipoMovimiento.model';
import { Cuenta } from './cuenta.model';

export class Movimiento {
  ID_Movimiento!: number;
  ID_Tipo_Movimiento!: number;
  Descripcion!: string;
  Fecha!: Date;
  Monto!: number;
  ID_Cuenta_Origen!: number;
  ID_Cuenta_Final!: number;
  ID_Cuenta!: number;
}
