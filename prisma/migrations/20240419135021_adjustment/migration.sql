/*
  Warnings:

  - You are about to drop the column `cnpj` on the `Barber` table. All the data in the column will be lost.
  - You are about to drop the column `cpf` on the `Customer` table. All the data in the column will be lost.
  - You are about to drop the column `cpf` on the `Professional` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Barber" DROP COLUMN "cnpj";

-- AlterTable
ALTER TABLE "Customer" DROP COLUMN "cpf";

-- AlterTable
ALTER TABLE "Professional" DROP COLUMN "cpf";
