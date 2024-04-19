import { Customer } from "../entities/customer.entity";
import { IsString, IsNotEmpty, IsUUID, MinLength, MaxLength, Matches } from 'class-validator';


export class CreateCustomerDto extends Customer{

}
