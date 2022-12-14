-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Дек 14 2022 г., 22:27
-- Версия сервера: 10.4.27-MariaDB
-- Версия PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mybank`
--

-- --------------------------------------------------------

--
-- Структура таблицы `branch`
--

CREATE TABLE `branch` (
  `branchId` int(11) NOT NULL,
  `branchNo` varchar(111) NOT NULL,
  `branchName` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `branch`
--

INSERT INTO `branch` (`branchId`, `branchNo`, `branchName`) VALUES
(1, '100101', 'Msk'),
(2, '100102', 'msk');

-- --------------------------------------------------------

--
-- Структура таблицы `feedback`
--

CREATE TABLE `feedback` (
  `feedbackId` int(11) NOT NULL,
  `message` text NOT NULL,
  `userId` double NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `feedback`
--

INSERT INTO `feedback` (`feedbackId`, `message`, `userId`, `date`) VALUES
(1, 'This is testing message to admin or manager by fk', 1, '2022-12-15 04:30:48'),
(3, 'This is testing message to admin or manager by fk', 2, '2022-12-15 04:30:48'),
(4, 'this is help card for admin', 1, '2022-12-17 06:45:20');

-- --------------------------------------------------------

--
-- Структура таблицы `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `email` varchar(111) NOT NULL,
  `password` varchar(111) NOT NULL,
  `type` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `login`
--

INSERT INTO `login` (`id`, `email`, `password`, `type`, `date`) VALUES
(1, 'cashier@cashier.com', 'cashier', 'cashier', '2022-12-15 04:36:27'),
(2, 'manager@manager.com', 'manager', 'manager', '2022-12-15 04:36:27'),
(3, 'sadfas@gmail.com', 'sdfas', 'type', '2022-12-16 07:13:12'),
(4, 'fkgeo@gmail.com', 'asdfsa', 'type', '2022-12-16 07:13:18'),
(6, 'cashier2@cashier.com', 'cashier2', 'cashier', '2022-12-16 07:14:47');

-- --------------------------------------------------------

--
-- Структура таблицы `notice`
--

CREATE TABLE `notice` (
  `id` int(11) NOT NULL,
  `userId` varchar(111) NOT NULL,
  `notice` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `notice`
--

INSERT INTO `notice` (`id`, `userId`, `notice`, `date`) VALUES
(1, '1', 'Dear Customer! <br> OUr privacy policy is changed for account information get new prospectus from your nearest branch', '2022-12-14 13:11:46'),
(6, '2', 'Dear Splessh,<br>\nOur privacy policy has been changed please visit nearest <kbd> MCB </kbd> branch for new prospectus.', '2022-12-16 06:29:23'),
(7, '1', 'dfsfsfsdf', '2022-12-11 20:23:37');

-- --------------------------------------------------------

--
-- Структура таблицы `otheraccounts`
--

CREATE TABLE `otheraccounts` (
  `id` int(11) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `bankName` varchar(111) NOT NULL,
  `holderName` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `otheraccounts`
--

INSERT INTO `otheraccounts` (`id`, `accountNo`, `bankName`, `holderName`, `balance`, `date`) VALUES
(1, '12001122', 'UBL', 'Yaqoob Quraishi', '40800', '2022-12-14 11:55:07'),
(2, '12001123', 'HBL', 'Yousaf Khan', '71000', '2022-12-14 11:55:07'),
(3, '12001124', 'HBL', 'Yousaf Khan', '71000', '2022-12-14 11:55:07');

-- --------------------------------------------------------

--
-- Структура таблицы `transaction`
--

CREATE TABLE `transaction` (
  `transactionId` int(11) NOT NULL,
  `action` varchar(111) NOT NULL,
  `credit` varchar(111) NOT NULL,
  `debit` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `beneId` varchar(111) NOT NULL,
  `other` varchar(111) NOT NULL,
  `userId` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `transaction`
--

INSERT INTO `transaction` (`transactionId`, `action`, `credit`, `debit`, `balance`, `beneId`, `other`, `userId`, `date`) VALUES
(4, 'transfer', '', '200', '', '', '12001122', 1, '2022-12-14 12:33:40'),
(5, 'transfer', '', '200', '', '', '10054777', 1, '2022-12-14 12:56:48'),
(6, 'transfer', '', '333', '', '', '10054777', 1, '2022-12-14 12:57:20'),
(7, 'transfer', '', '222', '', '', '10054777', 1, '2022-12-14 12:58:19'),
(8, 'transfer', '', '333', '', '', '10054777', 1, '2022-12-14 13:00:23'),
(16, 'withdraw', '', '100', '', '', '23423', 1, '2022-12-15 08:31:59'),
(17, 'deposit', '1200', '', '', '', '234232', 1, '2022-12-15 08:32:17'),
(18, 'transfer', '', '467', '', '', '12001122', 1, '2022-12-17 06:44:48'),
(22, 'deposit', '1200', '', '', '', '32424', 2, '2022-12-17 06:56:29'),
(23, 'withdraw', '', '12', '', '', '23423', 2, '2022-12-17 06:59:02'),
(24, 'deposit', '12', '', '', '', '21321', 2, '2022-12-17 06:59:20'),
(25, 'transfer', '', '1200', '', '', '10054777', 1, '2022-12-17 07:01:37'),
(26, 'deposit', '600', '', '', '', '342342', 2, '2022-12-17 07:04:39'),
(27, 'withdraw', '', '1012', '', '', '23423', 2, '2022-12-17 07:04:58');

-- --------------------------------------------------------

--
-- Структура таблицы `useraccounts`
--

CREATE TABLE `useraccounts` (
  `id` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `name` varchar(111) NOT NULL,
  `balance` varchar(111) NOT NULL,
  `cnic` varchar(111) NOT NULL,
  `number` varchar(111) NOT NULL,
  `city` varchar(111) NOT NULL,
  `address` varchar(111) NOT NULL,
  `source` varchar(111) NOT NULL,
  `accountNo` varchar(111) NOT NULL,
  `branch` varchar(111) NOT NULL,
  `accountType` varchar(111) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Дамп данных таблицы `useraccounts`
--

INSERT INTO `useraccounts` (`id`, `email`, `password`, `name`, `balance`, `cnic`, `number`, `city`, `address`, `source`, `accountNo`, `branch`, `accountType`, `date`) VALUES
(1, 'some@gmail.com', 'some', 'Splessh', '9800', '3210375555426', '03356910260', 'msk', 'Some where in msk', 'Programmer', '1005469', '1', 'Current', '2022-12-14 05:50:06'),
(2, 'some2@gmail.com', 'some2', 'Kusakame', '16000', '3210375555343', '03356910260', 'msk', 'Some where in msk', 'Programmer', '10054777', '1', 'Saving', '2022-12-14 04:50:06'),
(6, 'realx4rd@gmail.com', 'afsdfasd', 'Richard', '234234', '3240338834902', '03356910260', 'msk', 'Some where in msk', 'Govt. job', '1513410739', '1', 'saving', '2022-12-16 07:52:40'),
(7, 'realx4rd@gmail.com', 'safsadf', 'Ben', '12121', '3240338834902', '03356910260', 'msk', 'Some where in msk', 'Govt. job', '1513410837', '1', 'current', '2022-12-16 07:54:18');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`branchId`);

--
-- Индексы таблицы `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedbackId`);

--
-- Индексы таблицы `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `otheraccounts`
--
ALTER TABLE `otheraccounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionId`);

--
-- Индексы таблицы `useraccounts`
--
ALTER TABLE `useraccounts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `branch`
--
ALTER TABLE `branch`
  MODIFY `branchId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedbackId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `notice`
--
ALTER TABLE `notice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `otheraccounts`
--
ALTER TABLE `otheraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transactionId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `useraccounts`
--
ALTER TABLE `useraccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
