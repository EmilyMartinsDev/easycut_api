import { IsEmail, IsEnum, IsPhoneNumber, IsString, Matches, MaxLength, MinLength } from "class-validator";
import { User } from "../entities/user.entity";
import { UserType } from "src/enums/userRole";


export class CreateUserDto extends User {
    
    @IsEmail()
    email: string;

    @IsString()
    @MinLength(4)
    @MaxLength(20)
    @Matches(/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, {
      message: 'password too weak',
    })
    password: string;
    
    @IsString()
    name: string;

    @IsEnum(UserType)
    userType: UserType;

    @IsString()
    fone: string;
}
 