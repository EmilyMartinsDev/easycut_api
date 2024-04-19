import { UserType } from "src/enums/userRole";

export class User {
    id?: string;
    email: string;
    password: string;
    name: string;
    userType:UserType
    fone : string
}
