import {Provincia} from './provincia.model'

export class Localidad{
    ID_Localidad! : number;
    Localidad1! : string;
    Codigo_Postal! : string;
    ID_Provincia! : Provincia;
}