import { Injectable } from '@nestjs/common';
import { User } from '@prisma/client';

import { JwtService } from '@nestjs/jwt';
import { UserService } from 'src/user/user.service';
import * as bcrypt from 'bcrypt';
import { UserToken } from './models/UserToken';
import { UserPayload } from './models/UserPayload';
@Injectable()

    export class AuthService {
        constructor(
          private readonly jwtService: JwtService,
          private readonly userService: UserService,
        ) {}
      
        async validateUser(email: string, password: string): Promise<User> {
            const user = await this.userService.findByEmail(email);
        
            if (user) {
              const isPasswordValid = await bcrypt.compare(password, user.password);
        
              if (isPasswordValid) {
                return {
                  ...user,
                  password: undefined,
                };
              }
            }
        }

    async login(user: User): Promise<UserToken> {
        const payload: UserPayload = {
          sub: user.id,
          email: user.email,
          name: user.name,
        };
    
        return {
          access_token: this.jwtService.sign(payload),
        };
      }
    }