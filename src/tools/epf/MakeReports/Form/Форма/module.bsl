﻿
Процедура КнопкаВыполнитьНажатие(Кнопка)
	СформироватьXML_CheckStyle("C:\Users\a.krapivin\Documents\Repo\!ACC\reports\check-style-report.xml","\src\Калькулятор");
КонецПроцедуры

Процедура ПриОткрытии()
	Если ЗначениеЗаполнено(ПараметрЗапуска) Тогда
		ПараметрыЗапуска=РазложитьСтрокуВМассивПодстрок(ПараметрЗапуска,"|");
		EPF				= ПараметрыЗапуска[0];
		Синоним			= ПараметрыЗапуска[1];
		ПутьДляОтчетов	= ПараметрыЗапуска[2];
		
		ВнОбработка=ВнешниеОбработки.Создать(EPF+".epf");
		ВерсияНомер=ВнОбработка.ПолучитьНомерРелиза_Контур();
		Версия=Справочники.Версии.НайтиПоНаименованию(ВерсияНомер,,,Справочники.Конфигурации.НайтиПоНаименованию(Синоним));
		ВнОбработка=Неопределено;
		
		
		Отчет=Отчеты.НайденныеОшибки.Создать();
		ПараметрыНастроек = Новый Соответствие;
		ПараметрыНастроек.Вставить("Версия", Версия);
		ПараметрыНастроек.Вставить("Конфигурация", Версия.Владелец);
		
		ТабДокумент = Отчет.СформироватьТабличныйДокумент("Ошибки", ПараметрыНастроек);
		ТабДокумент.Записать(ПутьДляОтчетов+"\index.html",ТипФайлаТабличногоДокумента.HTML5);
		
		СформироватьXML_CheckStyle(ПутьДляОтчетов+"\reports\check-style-report.xml","\src\Калькулятор");
		ЗавершитьРаботуСистемы(Ложь,,0);
	КонецЕсли;
КонецПроцедуры

Функция РазложитьСтрокуВМассивПодстрок(Знач Стр, Разделитель = ",")
	
	МассивСтрок = Новый Массив();
	Если Разделитель = " " Тогда
		Стр = СокрЛП(Стр);
		Пока Истина Цикл
			Поз = Найти(Стр,Разделитель);
			Если Поз=0 Тогда
				МассивСтрок.Добавить(Стр);
				Возврат МассивСтрок;
			КонецЕсли;
			МассивСтрок.Добавить(Лев(Стр,Поз-1));
			Стр = СокрЛ(Сред(Стр,Поз));
		КонецЦикла;
	Иначе
		ДлинаРазделителя = СтрДлина(Разделитель);
		Пока Истина Цикл
			Поз = Найти(Стр,Разделитель);
			Если Поз=0 Тогда
				МассивСтрок.Добавить(Стр);
				Возврат МассивСтрок;
			КонецЕсли;
			МассивСтрок.Добавить(Лев(Стр,Поз-1));
			Стр = Сред(Стр,Поз+ДлинаРазделителя);
		КонецЦикла;
	КонецЕсли;
	
КонецФункции

