/*
  Warnings:

  - You are about to drop the column `referreEmail` on the `referrals` table. All the data in the column will be lost.
  - You are about to drop the column `referreName` on the `referrals` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[referrerEmail,refereeEmail,courseName]` on the table `referrals` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `refereeEmail` to the `referrals` table without a default value. This is not possible if the table is not empty.
  - Added the required column `refereeName` to the `referrals` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `referrals_referrerEmail_referreEmail_courseName_key` ON `referrals`;

-- AlterTable
ALTER TABLE `referrals` DROP COLUMN `referreEmail`,
    DROP COLUMN `referreName`,
    ADD COLUMN `refereeEmail` VARCHAR(191) NOT NULL,
    ADD COLUMN `refereeName` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `referrals_referrerEmail_refereeEmail_courseName_key` ON `referrals`(`referrerEmail`, `refereeEmail`, `courseName`);
