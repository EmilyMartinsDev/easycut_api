import { Barber } from "../entities/barber.entity";
import { IsString, IsNotEmpty, IsUUID, IsInt, MinLength, MaxLength, Matches } from 'class-validator';
export class CreateBarberDto extends Barber {
   
  
    @IsString()
    @IsNotEmpty()
    cnpj: string;
}
