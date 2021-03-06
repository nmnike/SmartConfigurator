// #Использовать logging

Перем Обмен;
// Перем _Лог;

Функция ОбработкаТекста(Данные)
	
	Данные = СокрП(Данные);
	
	СтрокиМодуля = СтрРазделить(Данные, Символы.ПС, Ложь);
	
	Результат = "";
	Для каждого Стр Из СтрокиМодуля Цикл
		Если СокрЛП(Стр) = "" Тогда
			Продолжить;
		КонецЕсли;
		Результат = Результат + ?(Результат = "", "", Символы.ПС) + Стр;
	КонецЦикла;

	Возврат Результат;
	
КонецФункции

Процедура ПриСозданииОбъекта(Параметры)

	Обмен = ЗагрузитьСценарий("core/Обмен.os");

	Параметры = АргументыКоманднойСтроки;
	// _Лог = Новый ЛогированиеВФайл("tmp/log.log");

	Если Параметры.Количество() > 0 Тогда
		
		ИмяФайла = Параметры[0];
		Приемник = ИмяФайла;
		
		Если Параметры.Количество() > 1 Тогда
			Приемник = Параметры[1];
		КонецЕсли;
		
		Результат = ОбработкаТекста(Обмен.ПолучитьТекстИзФайла(ИмяФайла));
		Обмен.ЗаписатьРезультатВФайл(Приемник, Результат);
	Иначе
		Результат = ОбработкаТекста(Обмен.ПолучитьВыделенныйТекст());
		Обмен.УстановитьТекстВВыделение(Результат);
	КонецЕсли;
	
КонецПроцедуры