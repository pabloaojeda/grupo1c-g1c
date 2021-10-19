import { Localidad } from './localidades.model';

export class Cliente {

    ID_Cliente! : number;
    Cuit_Cuil! : number;
    Nombre! : string;
    Apellido! : string;
    Password! : string;
    Mail! : string;
    ID_Localidad!: Localidad;
    Foto_Frontal! : string;
    DNI_delante! : string;
    DNI_detras! : string;
    Domicilio! : string;   

}