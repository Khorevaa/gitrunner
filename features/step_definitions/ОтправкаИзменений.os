﻿// Реализация шагов BDD-фич/сценариев c помощью фреймворка https://github.com/artbear/1bdd

Перем БДД; //контекст фреймворка 1bdd

// Метод выдает список шагов, реализованных в данном файле-шагов
Функция ПолучитьСписокШагов(КонтекстФреймворкаBDD) Экспорт
	БДД = КонтекстФреймворкаBDD;

	ВсеШаги = Новый Массив;

	ВсеШаги.Добавить("ЯОтправляюИзмененияВоВнешнийРепозиторийВВетку");
	ВсеШаги.Добавить("ЯСоздаюНовыйОбъектНастройкаРежимаОтправки");
	ВсеШаги.Добавить("ЯУстанавливаюНастройкуОтправкиРежимаТишины");
	ВсеШаги.Добавить("ЯУстанавливаюНастройкуОтправкиПолнаяОтправка");
	ВсеШаги.Добавить("ЯУстанавливаюНастройкуОтправкиОтображениеПрогресса");
	ВсеШаги.Добавить("ЯОтправляюИзмененияЧерезНастройкуРежимаОтправки");
	ВсеШаги.Добавить("ЯУстанавливаюНастройкуОтправкиПроизвольныйЗаголовок");
	ВсеШаги.Добавить("ЯДобавляюЗаголовокОтправкиИзВ");
	ВсеШаги.Добавить("ЯИнициализируюBareРепозиторийВоВременномКаталоге");
	ВсеШаги.Добавить("ЯУстанавливаюНастройкуРежимаОтправки");
	ВсеШаги.Добавить("ЯУстанавливаюРепозиторийОтправки");
		
	ВсеШаги.Добавить("ВыводКомандыСодержит");
	
	Возврат ВсеШаги;
КонецФункции

// Реализация шагов

// Процедура выполняется перед запуском каждого сценария
Процедура ПередЗапускомСценария(Знач Узел) Экспорт
	
КонецПроцедуры

// Процедура выполняется после завершения каждого сценария
Процедура ПослеЗапускаСценария(Знач Узел) Экспорт
	
КонецПроцедуры
//Вывод команды содержит ""
Процедура ВыводКомандыСодержит(Знач ОжидаемыйВыводКоманды) Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	
	ВыводКоманды = ГитРепозиторий.ПолучитьВыводКоманды();
	Ожидаем.Что(ВыводКоманды).Содержит(ОжидаемыйВыводКоманды);
КонецПроцедуры

//Я сообщаю вывод команды
Процедура ЯСообщаюВыводКоманды() Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	
	ВыводКоманды = ГитРепозиторий.ПолучитьВыводКоманды();
	Сообщить(СокрЛП(ВыводКоманды));
	
КонецПроцедуры

//Я инициализирую bare репозиторий во временном каталоге
Процедура ЯИнициализируюBareРепозиторийВоВременномКаталоге() Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ВременныйКаталог = БДД.ПолучитьИзКонтекста("ВременныйКаталог");
	ГитРепозиторий.УстановитьРабочийКаталог(ВременныйКаталог);
	ПараметрыКоманды = Новый Массив;
	ПараметрыКоманды.Добавить("init");
	ПараметрыКоманды.Добавить("--bare");
	ГитРепозиторий.ВыполнитьКоманду(ПараметрыКоманды);
КонецПроцедуры

//Я отправляю изменения во внешний репозиторий "origin" в ветку "test"
Процедура ЯОтправляюИзмененияВоВнешнийРепозиторийВВетку(Знач ИмяВнешнегоРепозитория,Знач ИмяВетки) Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ГитРепозиторий.Отправить(ИмяВнешнегоРепозитория, ИмяВетки);
КонецПроцедуры
//Я создаю новый объект НастройкаРежимаОтправки
Процедура ЯСоздаюНовыйОбъектНастройкаРежимаОтправки() Экспорт
	НастройкиРежимаОтправки = Новый НастройкаКомандыОтправить;
	БДД.СохранитьВКонтекст("НастройкиРежимаОтправки", НастройкиРежимаОтправки);
КонецПроцедуры

//Я устанавливаю настройку отправки режима тишины
Процедура ЯУстанавливаюНастройкуОтправкиРежимаТишины() Экспорт
	НастройкиРежимаОтправки = БДД.ПолучитьИзКонтекста("НастройкиРежимаОтправки");
	НастройкиРежимаОтправки.РежимТишины();
КонецПроцедуры

//Я устанавливаю настройку отправки полная отправка
Процедура ЯУстанавливаюНастройкуОтправкиПолнаяОтправка() Экспорт
	НастройкиРежимаОтправки = БДД.ПолучитьИзКонтекста("НастройкиРежимаОтправки");
	НастройкиРежимаОтправки.ПолнаяОтправка();
КонецПроцедуры

//Я устанавливаю настройку отправки отображение прогресса в значение "true"
Процедура ЯУстанавливаюНастройкуОтправкиОтображениеПрогресса() Экспорт
	НастройкиРежимаОтправки = БДД.ПолучитьИзКонтекста("НастройкиРежимаОтправки");
	НастройкиРежимаОтправки.ОтображатьПрогресс();
КонецПроцедуры

//Я отправляю изменения через настройку режима отправки
Процедура ЯОтправляюИзмененияЧерезНастройкуРежимаОтправки() Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	ГитРепозиторий.Отправить();
КонецПроцедуры

//Я устанавливаю настройку режима отправки
Процедура ЯУстанавливаюНастройкуРежимаОтправки() Экспорт
	ГитРепозиторий = БДД.ПолучитьИзКонтекста("ГитРепозиторий");
	НастройкиРежимаОтправки = БДД.ПолучитьИзКонтекста("НастройкиРежимаОтправки");
	ГитРепозиторий.УстановитьНастройкуКомандыОтправить(НастройкиРежимаОтправки);
КонецПроцедуры

//Я устанавливаю репозиторий отправки "origin"
Процедура ЯУстанавливаюРепозиторийОтправки(Знач URLРепозитория) Экспорт
	НастройкиРежимаОтправки = БДД.ПолучитьИзКонтекста("НастройкиРежимаОтправки");
	НастройкиРежимаОтправки.УстановитьURLРепозиторияОтправки(URLРепозитория);
КонецПроцедуры

//Я устанавливаю настройку отправки произвольный заголовок "push origin :test"
Процедура ЯУстанавливаюНастройкуОтправкиПроизвольныйЗаголовок(Знач ПроизвольныйЗаголовок) Экспорт
	НастройкиРежимаОтправки = БДД.ПолучитьИзКонтекста("НастройкиРежимаОтправки");
	НастройкиРежимаОтправки.ДобавитьПроизвольныйЗаголовокОтправки(ПроизвольныйЗаголовок);
КонецПроцедуры
//Я добавляю заголовок отправки из "refs/heads/test" в "refs/heads/my/test"
Процедура ЯДобавляюЗаголовокОтправкиИзВ(Знач ЗаголовокРабочейКопии, Знач ЗаголовокУдаленногоСервера) Экспорт
	НастройкиРежимаОтправки = БДД.ПолучитьИзКонтекста("НастройкиРежимаОтправки");
	НастройкиРежимаОтправки.ДобавитьЗаголовкиОтправки(ЗаголовокРабочейКопии, ЗаголовокУдаленногоСервера);
КонецПроцедуры





