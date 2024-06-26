INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (1, N'НЗ_ЗК_МаксОблагаемаяСумма', N'Используется для вычисления максимально налого-облагаеммой суммы', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (10, N'НЗ_ЗК_УдержаниеПодоходногоНалога', N'Используется для расчета подоходного налога в приложении кадры и зарплата', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (11, N'НЗ_ЗК_УдержаниеВПенсионныйФонд', N'Используется для вычисления суммы пенсионного фонда при начислении зарплаты', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (12, N'НЗ_ЗК_УдаржаниеВФондБезработицы', N'Используется для вычисления суммы фонда безработицы при начислении зарплаты', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (13, N'НЗ_ЗК_УдержаниеВФондСоцСтрохования', N'Используется для вычисления суммы фонда социального страхования при начислении зарплаты', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (14, N'НЗ_ЗК_НачислениеВПенсионныйФонд', N'Используется для вычисления суммы начисления в пенсионный фонд', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (15, N'НЗ_ЗК_НачислениеВСоцСтрахФонд', N'Используется для вычисления суммы начисления в фонд социального страхования', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (16, N'НЗ_ЗК_НачислениеВФондБезработицы', N'Используется для вычисления суммы начисления в фонд по безработице', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (17, N'НЗ_ЗК_НачислениеВФондНесчСлуч', N'Используется для вычисления суммы начисления в фонд социального страхования по несчастному случаю', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (18, N'НЗ_ЗК_СуммаНачисленнойЗарплаты', N'Используется для вычисления суммы начисленной заработной платы', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (19, N'НЗ_БУ_КоммунальныйНалог', N'НЗ_БУ_КоммунальныйНалог', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (20, N'НЗ_ЗК_НеоблагаемыйМинимум', N'НЗ_ЗК_НеоблагаемыйМинимум', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (22, N'НЗ_БУ_ПрожиточныйМинимум', N'НЗ_БУ_ПрожиточныйМинимум', 0, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (23, N'НЗ_БУ_БазаНалогообложения', N'Возвращает общую сумму базы налогообложения', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (24, N'НЗ_БУ_БазаПодоходныйПенсионный', N'Возвращает базу налогообложения для расчета удержаний в Пенсионный фонд и подоходного налога', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (25, N'НЗ_БУ_ПенсионныйФонд', N'Возвращает сумму удержаний в ПФ с сотрудника', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (26, N'НЗ_БУ_Соцстрах', N'Возвращает сумму удержания с зарплаты в фонд социального страхования', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (27, N'НЗ_БУ_ФондЗанятости', N'Возвращает сумму удержания с зарплаты в фонд занятости (синоним - безработица)', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (28, N'НЗ_БУ_Профвзносы', N'НЗ_БУ_Профвзносы', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (29, N'НЗ_БУ_СтавкаПрофвзносов', N'Возвращает ставку профвзносов в процентах', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (30, N'НЗ_БУ_СПредпрПФ', N'Возвращает ставку начислений на зарплату в Пенсионный фонд для служащих (не льготников), %', 0, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (31, N'НЗ_БУ_СПредпрПФ_льгота', N'Возвращает ставку начислений на зарплату в Пенсионный фонд для служащих-инвалидов, %', 0, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (32, N'НЗ_БУ_СПредпрСоцстрах', N'Возвращает ставку начислений на зарплату в Фонд социального страхования для служащих (не льготников), %', 0, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (33, N'НЗ_БУ_СПредпрСоцстрах_льгота', N'Возвращает ставку начислений на зарплату в Фонд социального страхования для служащих-инвалидов, %', 0, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (34, N'НЗ_БУ_СПредпрФондЗанятости', N'Возвращает ставку начислений на зарплату в Фонд занятости, %', 0, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (35, N'НЗ_БУ_СПредпрНесчСлучай', N'Возвращает ставку начислений на зарплату по страхованию от несчастного случая, %', 0, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (36, N'НЗ_БУ_СуммаПФсПредприятия', N'Возвращает сумму начисления на зарплату в Пенсионный фонд. Параметр 1 - База налогообложения. Параметр 2 - Максимально облагаемая сумма', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (37, N'НЗ_БУ_СуммаСоцстрахсПредприятия', N'Возвращает сумму начисления на зарплату в Фонд социального страхования. Параметр 1 - База налогообложения. Параметр 2 - Максимально облагаемая сумма', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (38, N'НЗ_БУ_СуммаФЗсПредприятия', N'Возвращает сумму начисления на зарплату в Фонд занятости. Параметр 1 - База налогообложения. Параметр 2 - Максимально облагаемая сумма', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (39, N'НЗ_БУ_СуммаНесчСлучайсПредприятия', N'Возвращает сумму начисления на зарплату в Фонд страхования от несчастных случаев. Параметр 1 - База налогообложения. Параметр 2 - Максимально облагаемая сумма', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (40, N'БУ_БланкСтрогойОтчетности', N'Возвращает 1, если ТМЦ является бланком строгой отчетности, и 0, если не является', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (41, N'БУ_Доверенность', N'Возвращает 1, если ТМЦ является доверенностью, и 0, если не является', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (42, N'БУ_Золото', N'Возвращает 1, если ТМЦ является золотом, платиной или драгоценными камнями (для оплаты 5% в ПФ), в противно случае возвращает 0', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (43, N'БУ_СчетПФ_НачислениеЗП', N'Возвращает код субсчета для начисления сбора в ПФ (32% или 4%) в зависимости от статуса служащего (инвалид или нет)', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (44, N'БУ_СчетСоцстраха_НачислениеЗП', N'БУ_СчетСоцстраха_НачислениеЗП', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (45, N'НЗ_ЗК_ПроцентИнвалидов', N'Возвращает % инвалидов к общему числу сотрудников предприятия.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (46, N'НЗ_ЗК_СтавкаПФИнвалиды', N'Возвращает ставку отчислений в пенсионный фонд для инвалидов в %. Внутренняя функция, не предназначена для использования в проводках.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (47, N'НЗ_ЗК_СтавкаПФПрочие', N'Возвращает ставку отчислений в пенсионный фонд для служащих, не являющихся инвалидами, в %. Внутренняя функция, не предназначена для использования в проводках.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (48, N'НЗ_ЗК_СтавкаПФ', N'Возвращает ставку для начисления в Пенсионный фонд В ДОЛЯХ ОТ ЕДИНИЦЫ. Автоматически анализирует % инвалидов на предприятии и статус текущего служащего.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (49, N'НЗ_ЗК_СтавкаСоцстрахИнвалиды', N'Возвращает ставку отчислений в Фонд социального страхования для инвалидов в %. Внутренняя функция, не предназначена для использования в проводках.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (50, N'НЗ_ЗК_СтавкаСоцстрахПрочие', N'Возвращает ставку отчислений в Фонд социального страхования для служащих, не являющихся инвалидами, в %. Внутренняя функция, не предназначена для использования в проводках.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (51, N'НЗ_ЗК_СтавкаСоцстрах', N'Возвращает ставку для начисления в Фонд социального страхования В ДОЛЯХ ОТ ЕДИНИЦЫ. Автоматически анализирует % инвалидов на предприятии и статус текущего служащего.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (52, N'НЗ_ЗК_СтавкаБезработицы', N'Возвращает ставку для начисления в фонд безработицы В ДОЛЯХ ОТ ЕДИНИЦЫ. Автоматически анализирует % инвалидов на предприятии и статус текущего служащего.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (53, N'НЗ_ЗК_СтавкаБезработицыПрочие', N'Возвращает ставку отчислений в фонд безработицы для служащих, не являющихся инвалидами, в %. Внутренняя функция, не предназначена для использования в проводках.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (54, N'НЗ_ЗК_СтавкаБезработицыИнвалиды', N'Возвращает ставку отчислений в фонд безработицы для инвалидов в %. Внутренняя функция, не предназначена для использования в проводках.', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (55, N'НЗ_ЗК_СтавкаУдержанияСоцстрах', N'Возвращает ставку удержания в фонд социального страхования в ДОЛЯХ ОТ ЕДИНИЦЫ', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (56, N'НЗ_ЗК_СтавкаУдержанияБезработица', N'Возвращает ставку удержания в фонд страхования на случай безработицы в ДОЛЯХ ОТ ЕДИНИЦЫ', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (58, N'НЗ_ЗК_СтавкаУдержанияПФ', N'Возвращает 2-й предел (более 150 грн) ставки удержания в Пенсионный фонд в ДОЛЯХ ОТ ЕДИНИЦЫ', 0, 1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (59, N'НЗ_ЗК_КоммунальныйНалог', N'НЗ_ЗК_КоммунальныйНалог', 0, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (60, N'НЗ_БУ_УдержаниеПодоходногоНалога', N'Возвращает сумму подоходного налога для модуля "Бухгалтерия". Используется при автоматичесокм расчете сумм налогов в документе "Начисление зарплаты"', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (61, N'КЗ_СписокАлименты', N'КЗ_СписокАлименты', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (62, N'КЗ_СписокБольничныеОтПредприятия', N'КЗ_СписокБольничныеОтПредприятия', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (63, N'КЗ_СписокБольничныеОтСоцстраха', N'КЗ_СписокБольничныеОтСоцстраха', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (64, N'КЗ_СписокКомпенсационныеВыплаты', N'КЗ_СписокКомпенсационныеВыплаты', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (65, N'КЗ_СписокМатериальнаяПомощь', N'КЗ_СписокМатериальнаяПомощь', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (66, N'КЗ_СписокНедостачи', N'КЗ_СписокНедостачи', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (67, N'КЗ_СписокНесчастныйСлучай', N'КЗ_СписокНесчастныйСлучай', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (68, N'КЗ_СписокОсновнаяЗП', N'КЗ_СписокОсновнаяЗП', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (69, N'КЗ_СписокОтпускные', N'КЗ_СписокОтпускные', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (72, N'КЗ_СписокПремииПоощрения', N'КЗ_СписокПремииПоощрения', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (73, N'КЗ_СписокПрофвзносы', N'КЗ_СписокПпрофвзносы', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (74, N'КЗ_СписокСсуды', N'КЗ_СписокСсуды', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (75, N'НЗ_ЗК_СуммаЛьготыПН', N'НЗ_ЗК_СуммаЛьготыПН', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (76, N'НЗ_ЗК_СтавкаПодоходногоНалога', N'НЗ_ЗК_СтавкаПодоходногоНалога', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (78, N'НЗ_ЗК_РазницаЗП', N'НЗ_ЗК_РазницаЗП', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (79, N'НЗ_ЗК_ПроцентЛьготыПН', N'НЗ_ЗК_ПроцентЛьготыПН', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (80, N'НЗ_ЗК_ПроцентИндексации', N'НЗ_ЗК_ПроцентИндексации', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (81, N'НЗ_ЗК_ПринятВЭтомМесяце', N'НЗ_ЗК_ПринятВЭтомМесяце', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (82, N'НЗ_ЗК_ПризнакЛьготыПН', N'НЗ_ЗК_ПризнакЛьготыПН', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (83, N'НЗ_ЗК_МинимальнаяЗП', N'НЗ_ЗК_МинимальнаяЗП', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (84, N'НЗ_ЗК_ИндексацияЗП', N'НЗ_ЗК_ИндексацияЗП', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (85, N'НЗ_ЗК_ДатаТекущегоКС', N'НЗ_ЗК_ДатаТекущегоКС', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (86, N'КЗ_ТипДоговора', N'КЗ_ТипДоговора', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (87, N'НЗ_БУ_ПризнакЛьготыПН', N'НЗ_БУ_ПризнакЛьготыПН', 1, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (88, N'НЗ_ЗК_УволенВЭтомМесяце', N'НЗ_ЗК_УволенВЭтомМесяце', 0, 1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (89, N'НЗ_ЗК_СтавкаКомНалога', N'НЗ_ЗК_СтавкаКомНалога', 0, 1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (90, N'НЗ_ЗК_ГраничныйДоходЛьготыПН', N'Граничный доход, к которму применяется налоговая социальная льгота', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (91, N'ЗК_ЕСВ_Удержание', N'Сумма удержаний ЕСВ', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (92, N'ЗК_ЕСВ_Начисление', N'Сумма начислений ЕСВ', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (93, N'ЗК_ЕСВ_СтавкаНачислений_ФОП_Прочие', N'Ставка начислений на выплаты входящие в фонд оплаты труда. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (94, N'ЗК_ЕСВ_СтавкаНачислений_ФОП_Инвалиды', N'Ставка начислений на выплаты входящие в фонд оплаты труда для не инвалидов. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (95, N'ЗК_ЕСВ_СтавкаНачислений_ФОП', N'Ставка начислений на выплаты входящие в фонд оплаты труда. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (96, N'ЗК_ЕСВ_СтавкаНачислений_ДВР', N'Ставка начислений на выплаты по договорам за выполненные работы, предоставленные услуги. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (97, N'ЗК_ЕСВ_СтавкаНачислений_ВН_Инвалиды', N'Ставка начислений на выплаты по временной нетрудоспособности для инвалидов. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (98, N'ЗК_ЕСВ_СтавкаНачислений_ВН_Прочие', N'Ставка начислений на выплаты по временной нетрудоспособности для не инвалидов. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (99, N'ЗК_ЕСВ_СтавкаНачислений_ВН', N'Ставка начислений на выплаты по временной нетрудоспособности. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (100, N'ЗК_ЕСВ_СтавкаУдержаний_ФОП', N'Ставка удержаний с выплат входящих в фонд оплаты труда. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (101, N'ЗК_ЕСВ_СтавкаУдержаний_ДВР', N'Ставка удержаний с вознаграждений по договорам за выполненные работы, предоставленные услуги. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (102, N'ЗК_ЕСВ_СтавкаУдержаний_ВН', N'Ставка удержаний с выплат по временной нетрудоспособности. Величина в процентах.', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (103, N'КЗ_ЕСВ_СписокФОП', N'Список выплат основной заработной платы', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (104, N'КЗ_ЕСВ_СписокВН', N'Список выплат по больничным', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (105, N'КЗ_ЕСВ_СписокДВР', N'Список выплат по договорам', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (106, N'КЗ_ЕСВ_СубсчетНачислений', N'КЗ_ЕСВ_СубсчетНачислений', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (107, N'КЗ_ЕСВ_СубсчетУдержаний', N'КЗ_ЕСВ_СубсчетУдержаний', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (108, N'БУ_ЕСВ_Начисление_ФОП', N'БУ_ЕСВ_Начисление_ФОП', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (109, N'БУ_ЕСВ_Удержание_ФОП', N'БУ_ЕСВ_Удержание_ФОП', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (110, N'БУ_ЕСВ_Начисление_ВН', N'БУ_ЕСВ_Начисление_ВН', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (111, N'БУ_ЕСВ_Удержание_ВН', N'БУ_ЕСВ_Удержание_ВН', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (112, N'БУ_ЕСВ_Начисление_ДВР', N'БУ_ЕСВ_Начисление_ДВР', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (113, N'БУ_ЕСВ_Удержание_ДВР', N'БУ_ЕСВ_Удержание_ДВР', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (114, N'БУ_ЕСВ_Начисление', N'БУ_ЕСВ_Начисление', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (115, N'БУ_ЕСВ_Удержание', N'БУ_ЕСВ_Удержание', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (116, N'НЗ_ЗК_СтавкаПодоходногоНалога2', N'НЗ_ЗК_СтавкаПодоходногоНалога2', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (117, N'НЗ_ЗК_БазисПодоходногоНалога', N'НЗ_ЗК_БазисПодоходногоНалога', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (118, N'НЗ_БУ_СуммаСтавкиПодоходногoНалога2', N'НЗ_БУ_СуммаСтавкиПодоходногoНалога2', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (119, N'КЗ_СуммаПредыдущихПозиций', N'КЗ_СуммаПредыдущихПозиций', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (120, N'ЗК_ЕСВ_УдержаниеПоТипуВыплаты', N'ЗК_ЕСВ_УдержаниеПоТипуВыплаты', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (121, N'ЗК_ЕСВ_НачислениеПоТипуВыплаты', N'ЗК_ЕСВ_НачислениеПоТипуВыплаты', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (122, N'БУ_Валюта_СтавкаКомиссииБанка', N'Процент комиссии банка за услуги при покупке валюты (%)', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (123, N'НЗ_ЗК_ГраничнаяСуммаПочтовогоСбора', N'НЗ_ЗК_ГраничнаяСуммаПочтовогоСбора', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (124, N'НЗ_ЗК_РазмерПочтовогоСбора', N'НЗ_ЗК_РазмерПочтовогоСбора', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (125, N'НЗ_ЗК_РазмерПочтовогоСбора2', N'НЗ_ЗК_РазмерПочтовогоСбора2', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (126, N'НЗ_ЗК_ПроцентПочтовогоСбора', N'НЗ_ЗК_ПроцентПочтовогоСбора', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (127, N'НЗ_ЗК_ДетейПоЛьготе', N'НЗ_ЗК_ДетейПоЛьготе', 0, -1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (128, N'ЗК_ВоенныйСбор_СтавкаУдержаний', N'ЗК_ВоенныйСбор_СтавкаУдержаний', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (129, N'НЗ_ЗК_УдержаниеВоенногоСбора', N'НЗ_ЗК_УдержаниеВоенногоСбора', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (130, N'ЗК_ЕСВ_КоэффициентНачислений', N'ЗК_ЕСВ_КоэффициентНачислений', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (131, N'КЗ_КорректировкаЕСВ', N'Формирование расчетной ведомости используя данные из двух режимов: "Начисление заработной платы за месяц" и "Начисление заработной платы за месяц: Корректировка ЕСВ".', 1, 1)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (132, N'НЗ_ЗК_ПроцентИндексацииПредКС', N'НЗ_ЗК_ПроцентИндексацииПредКС', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (133, N'НЗ_ЗК_ИндексацияЗПФИКС', N'НЗ_ЗК_ИндексацияЗПФИКС', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (134, N'НЗ_БУ_ПроцентЛьготыПН', N'НЗ_БУ_ПроцентЛьготыПН', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (135, N'НЗ_ЗК_ИндексацияПредКС', N'НЗ_ЗК_ИндексацияПредКС', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (136, N'ЗК_ЕСВ_КоэффициентНачисленийКор', N'ЗК_ЕСВ_КоэффициентНачисленийКор', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (137, N'НЗ_ЗК_НачислениеДоУровняМинЗП', N'НЗ_ЗК_НачислениеДоУровняМинЗП', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (138, N'НЗ_ЗК_КоэффициентСрЗП', N'НЗ_ЗК_КоэффициентСрЗП', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (139, N'НЗ_ЗК_СуммаНалоговойСоциальнойЛьготы', N'НЗ_ЗК_СуммаНалоговойСоциальнойЛьготы', 1, 0)
INSERT INTO [dbo].[z_FRUDFR] ([UDFID], [UDFName], [UDFDesc], [IsInt], [RevID]) VALUES (140, N'НЗ_ЗК_НачислениеДоСреднОкладаКоман', N'НЗ_ЗК_НачислениеДоСреднОкладаКоман', 1, 0)
