-- CreateEnum
CREATE TYPE "ApprovalStatus" AS ENUM ('PENDING', 'APPROVED', 'SLASHED');

-- CreateTable
CREATE TABLE "Fundraiser_Creator" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "profilePicture" TEXT NOT NULL,

    CONSTRAINT "Fundraiser_Creator_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Fundraisers" (
    "id" SERIAL NOT NULL,
    "fundraiseCreatorId" INTEGER NOT NULL,
    "receiverAddress" TEXT NOT NULL,
    "isApproved" BOOLEAN NOT NULL DEFAULT false,
    "approvedBy" TEXT NOT NULL,
    "amountToRaise" BIGINT NOT NULL,
    "amountRaised" BIGINT NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Fundraisers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Approvers" (
    "id" SERIAL NOT NULL,
    "approverAddress" TEXT NOT NULL,
    "aptStaked" BIGINT NOT NULL,
    "lastWithdrawalTimestamp" TIMESTAMP(3) NOT NULL,
    "approvalStatus" "ApprovalStatus" NOT NULL,

    CONSTRAINT "Approvers_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Fundraiser_Creator_address_key" ON "Fundraiser_Creator"("address");

-- CreateIndex
CREATE UNIQUE INDEX "Approvers_approverAddress_key" ON "Approvers"("approverAddress");

-- AddForeignKey
ALTER TABLE "Fundraisers" ADD CONSTRAINT "Fundraisers_fundraiseCreatorId_fkey" FOREIGN KEY ("fundraiseCreatorId") REFERENCES "Fundraiser_Creator"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
