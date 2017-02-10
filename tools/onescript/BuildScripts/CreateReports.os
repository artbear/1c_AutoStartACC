#Использовать logos

Перем Лог;

Лог = Логирование.ПолучитьЛог("behavior.build.log");

Если АргументыКоманднойСтроки.Количество() = 3 Тогда
	ПутьКАПК		= АргументыКоманднойСтроки[0];
	Синоним			= АргументыКоманднойСтроки[1];
	Обработка		= АргументыКоманднойСтроки[2];
	
	ПодключитьСценарий("./vendor/vanessa-runner/runner.os", "Runner");
	VRun	= Новый Runner;
	VRun.ЗапуститьВРежимеПредприятия("/F"+ПутьКАПК, "Администратор", "", , Обработка+"|"+Синоним+"|"+ТекущийКаталог()+"\reports\", ПутьКАПК+"\ВыполнениеПроверки.epf");
Иначе
	Лог.Ошибка("В процедура надо передать 3 параметра");
КонецЕсли