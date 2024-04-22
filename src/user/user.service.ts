import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { UserType } from 'src/enums/userRole';
import { PrismaService } from 'src/prisma/prisma.service';
import * as bcrypt from 'bcrypt'
import { User } from '@prisma/client';
@Injectable()
export class UserService {
  
    constructor(private readonly prisma: PrismaService) {}

    async create(createUserDto: CreateUserDto): Promise<User> {
   
      const hashedPassword = await bcrypt.hash(createUserDto.password, 10);
  
      // Criar o usuário no banco de dados
      const createdUser = await this.prisma.user.create({
        data: {
          ...createUserDto,
          password: hashedPassword,
        },
      });
  
 
      if (createUserDto.userType === UserType.PROVIDER) {
        await this.prisma.barber.create({
          data: {
           user_id: createdUser.id
          },
        });
      }
      if (createUserDto.userType === UserType.CUSTOMER) {
        await this.prisma.customer.create({
          data: {
           user_id: createdUser.id
          },
        });
      }
  
      return {
        ...createdUser,
        password: undefined,
      };
    }
async  findByEmail(email:string) {
    const user = await this.prisma.user.findFirst({where:{email:email}})
    return user
  }
  findAll() {
    return `This action returns all user`;
  }

 async findOne(id: string) {
  try{
    const user = await this.prisma.user.findUnique({
      where:{
        id:id
      },
      select:{
        email:true,
        name:true,
        fone:true,
        userType:true,
        id:true
      }
    })
    return user
  }catch(err){
    throw new Error('user not found')
  }
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
