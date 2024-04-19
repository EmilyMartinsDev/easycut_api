-- CreateEnum
CREATE TYPE "UserType" AS ENUM ('PROVIDER', 'CUSTOMER', 'PROFESSIONAL');

-- CreateEnum
CREATE TYPE "SchedulingStatus" AS ENUM ('CANCELED', 'CONCLUDED', 'MARKED');

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "fone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "userType" "UserType" NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Barber" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "cnpj" TEXT NOT NULL,

    CONSTRAINT "Barber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Professional" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,
    "barber_id" TEXT NOT NULL,

    CONSTRAINT "Professional_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,
    "cpf" TEXT NOT NULL,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Location" (
    "id" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "road" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "complement" TEXT,
    "barber_id" TEXT NOT NULL,

    CONSTRAINT "Location_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "id" TEXT NOT NULL,
    "plan" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "customer_id" TEXT NOT NULL,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Haircut" (
    "id" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "barber_id" TEXT NOT NULL,

    CONSTRAINT "Haircut_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Professional_Haircut" (
    "haircut_id" TEXT NOT NULL,
    "professional_id" TEXT NOT NULL,

    CONSTRAINT "Professional_Haircut_pkey" PRIMARY KEY ("haircut_id","professional_id")
);

-- CreateTable
CREATE TABLE "Schedule" (
    "id" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "professional_id" TEXT NOT NULL,
    "defaultDuration" INTEGER DEFAULT 30,

    CONSTRAINT "Schedule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScheduleItem" (
    "sheduling_id" TEXT NOT NULL,
    "haircut_id" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "totalPriceItem" DOUBLE PRECISION NOT NULL,

    CONSTRAINT "ScheduleItem_pkey" PRIMARY KEY ("sheduling_id","haircut_id")
);

-- CreateTable
CREATE TABLE "Scheduling" (
    "id" TEXT NOT NULL,
    "status" "SchedulingStatus" NOT NULL,
    "totalPrice" DOUBLE PRECISION NOT NULL,
    "customer_id" TEXT NOT NULL,
    "shedule_id" TEXT NOT NULL,

    CONSTRAINT "Scheduling_pkey" PRIMARY KEY ("id")
);
