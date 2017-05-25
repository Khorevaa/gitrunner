# gitrunner

[![Quality Gate](https://sonar.silverbulleters.org/api/badges/gate?key=gitrunner)](https://sonar.silverbulleters.org/component_measures/?id=gitrunner)
[![Quality Gate](https://sonar.silverbulleters.org/api/badges/measure?key=gitrunner&metric=coverage&blinking=true)](https://sonar.silverbulleters.org/component_measures/?id=gitrunner)

## Библиотека для упрощения работы с git из oscript.

Позволяет выполнять рутинные операции с репозиторием в стиле [v8runner](https://github.com/oscript-library/v8runner).

Пример работы:
```bsl
ГитРепозиторий = Новый ГитРепозиторий();
ГитРепозиторий.УстановитьРабочийКаталог(КаталогРепозитория);

ГитРепозиторий.УстановитьНастройку("core.quotePath", "true", РежимУстановкиНастроекGit.Локально);

ГитРепозиторий.ДобавитьВнешнийРепозиторий("origin", ПутьКВнешнемуРепозиторию);

ГитРепозиторий.ПерейтиВВетку("master");
ГитРепозиторий.Получить();

ГитРепозиторий.ОбновитьПодмодули(Истина, Истина);
```

Расширенный режим работы (например, отправки изменений):
```bsl
ГитРепозиторий = Новый ГитРепозиторий();
НастройкаОтправить = Новый НастройкаКомандыОтправить;
НастройкаОтправить.УстановитьURLРепозиторияОтправки("origin");
НастройкаОтправить.ОтображатьПрогресс();
НастройкаОтправить.ПерезаписатьИсторию();
НастройкаОтправить.ПолнаяОтправка();

ГитРепозиторий.УстановитьНастройкуКомандыОтправить(НастройкаОтправить);

ГитРепозиторий.Отправить();
```


Так же описание функциональности содержится в папке `features`. В прилагающихся `step_definitions` можно подсмотреть больше примеров.

## Публичный интерфейс

### Класс ГитРепозиторий:

> Работа со свойствами объекта ГитРепозиторий

#### УстановитьРабочийКаталог
```bsl
// Установить текущий рабочий каталог.
// Все команды git будут выполняться относительно указанного каталога.
//
// Параметры:
//   ПутьРабочийКаталог - Строка - Путь к рабочему каталогу.
//		Может быть относительным.
//
```

#### ПолучитьРабочийКаталог
```bsl
// Получить текущий рабочий каталог.
//
//  Возвращаемое значение:
//   Строка - Путь к рабочему каталогу
//
```

#### ПолучитьПутьКГит
```bsl
// Получить путь к исполняемому файлу git.
//
//  Возвращаемое значение:
//   Строка - Путь к исполняемому файлу.
//		По умолчанию содержит значение "git".
//
```

#### УстановитьПутьКГит
```bsl
// Установить путь к исполняемому файлу git.
//
// Параметры:
//   Путь - Строка - Путь к исполняемому файлу.
//
```

#### ПолучитьВыводКоманды
```bsl
// Получить вывод последней выполненной команды.
//
//  Возвращаемое значение:
//   Строка - Вывод команды
//
```

> Общие команды git

#### Инициализировать
```bsl
// Выполняет инициализиацию репозитория в рабочем каталоге
// git init
//
```

#### Статус
```bsl
// Получает состояние репозитория
// git status
//
//  Возвращаемое значение:
//   Строка   - Вывод команды
//
```

#### ДобавитьФайлВИндекс
```bsl
// Добавляет файл в индекс git
// git add
//
// Параметры:
//   ПутьКДобавляемомуФайлу - Строка - Путь к файлу на диске
//
```

#### Закоммитить
```bsl
// Зафиксировать проиндексированные изменения в истории git
// git commit
//
// Параметры:
//   ТекстСообщения - Строка - Текст сообщения коммита (-m ТекстСообщения)
//   ПроиндексироватьОтслеживаемыеФайлы - Булево - Автоматически добавить
//     в индекс файлы, уже отслеживаемые git (-a)
//   ПутьКФайлуКоммита - Строка - путь к файлу с текстом комментария (-F ПутьКФайлуСтекстомКоммита)
//   АвторКоммита - Строка - Автор комментария, передается в случае необходимости (--author=АвторКоммита)
//   ДатаАвтораКоммита - Дата - Дата комментария (--date=ДатаАвтораКоммита)
//   Коммитер - Строка - Коммитер комментария, передается в случае, если требуется
//   ДатаКоммита - Дата - Дата произведения коммита
//
```

#### ВывестиИсторию
```bsl
// Вывести историю репозитория
// git log
//
// Параметры:
//   Графически - Булево - Вывести историю в виде графа (--graph)
//
```

#### Получить
```bsl
// Получить изменения из удаленного репозитория
// git pull
//
// Параметры:
//   ИмяРепозитория - Строка - Имя репозитория, из которого необходимо
// 		получить изменения
//   ИмяВетки - Строка - Имя ветки, из которой необходимо получить изменения
//
```

#### Отправить
```bsl
// git push
//
// Параметры:
//   ИмяРепозитория - Строка - Имя репозитория, в который необходимо
// 		отправить изменения
//   ИмяВетки - Строка - Имя ветки, в который необходимо отправить изменения
//   ПерезаписатьИсторию - Булево - Флаг отправки с перезаписью истории (--force)
//
```

#### УстановитьНастройкиРежимаОтправки
```bsl
// Установить настройки отправки изменений.
// Позволяет произвести тонкую настройку необходимых флагов команды отправки изменений
//
// Параметры:
//   НастройкаКомандыОтправить - НастройкаКомандыОтправить - инстанс класса НастройкаКомандыОтправить с необходимыми
//                                                          настройками
//
```

#### КлонироватьРепозиторий
```bsl
// git clone
//
// Параметры:
//   ПутьУдаленномуРепозиторию - Строка - Путь к удаленному репозиторию
//   КаталогКлонирования - Строка - Каталог, в который необходимо выполнить
//		клонирование
//
```

#### УстановитьНастройкуКомандыКлонировать
```bsl
// Установить настройки клонирования репозитория.
// Позволяет произвести тонкую настройку необходимых флагов команды клонирования репозитория
//
// Параметры:
//   НастройкаКомандыКлонировать - НастройкаКомандыКлонировать - инстанс класса НастройкаКомандыКлонировать с необходимыми
//                                                          настройками
//
```

> Работа с ветками

#### ПолучитьТекущуюВетку
```bsl
// Получить имя текущей ветки
//
//  Возвращаемое значение:
//   Строка   - Имя текущей ветки
//
```

#### ПерейтиВВетку
```bsl
// Выполнить переход в ветку
// git checkout
//
// Параметры:
//   ИмяВетки - Строка - Имя ветки, в которую необходимо перейти
//   СоздатьНовую - Булево - Флаг необходимости создания новой ветки (-b)
//   Принудительно - Булево - Флаг необходимости принудительно перейти в ветку (-f)
//
// @unstable
//
```

#### СоздатьВетку
```bsl
// Создать новую ветку без выполнения перехода в нее
// git branch
//
// Параметры:
//   ИмяВетки - Строка - Имя создаваемой ветки
//
```

#### ПолучитьСписокВеток
```bsl
// Получить список веток
//
// Параметры:
//   ВключаяУдаленные - Булево - Включать информацию об удаленных ветках
//
//  Возвращаемое значение:
//   ТаблицаЗначений   - Таблица с информацией о текущих ветках.
//		Содержит колонки:
//			Текущая - Булево - Признак текущей ветки
//			Имя - Строка - Имя ветки
//
```

> Работа с внешними репозиториями

#### ДобавитьВнешнийРепозиторий
```bsl
// Добавить внешний репозиторий
// git remote add 
//
// Параметры:
//   ИмяРепозитория - Строка - Имя внешнего репозитория
//   АдресВнешнегоРепозитория - Строка - Путь к внешнему репозиторию
//
```

#### УдалитьВнешнийРепозиторий
```bsl
// Удалить внешний репозиторий
// git remote remove
//
// Параметры:
//   ИмяРепозитория - Строка - Имя внешнего репозитория
//
```

#### ПолучитьСписокВнешнихРепозиториев
```bsl
// Получить список внешних репозиториев
//
//  Возвращаемое значение:
//   ТаблицаЗначений   - Таблица с информацией о внешних репозиториях.
//		Содержит колонки:
//			Имя - Строка - Имя внешнего репозитория
//			Адрес - Строка - Путь к внешнему репозиторию
//			Режим - Строка - Режим работы с внешним репозиторием (push/fetch)
//
```

> Работа с подмодулями

#### ДобавитьПодмодуль
```bsl
// Добавить новый подмодуль
// git submodule add
//
// Параметры:
//   АдресВнешнегоРепозитория - Строка - Путь к внешнему репозиторию
//   Местоположение - Строка - Каталог, в который необходимо поместить
//		указанный подмодуль
//   Ветка - Строка - Имя ветки внешнего репозитория для получения
//   ИмяПодмодуля - Строка - Имя, под которым подмодуль будет сохранен
//		в настройках
//
```

#### ОбновитьПодмодули
```bsl
// Обновить данные о зарегистрированных подмодулях
// git submodule update
//
// Параметры:
//   Инициализировать - Булево - Выполнять инициализацию подмодуля
//   Рекурсивно - Рекурсивно - Обновлять подмодули подмодулей
//
```

#### ПолучитьСостояниеПодмодулей
```bsl
// Получить состояние подмодулей
//
//  Возвращаемое значение:
//   ТаблицаЗначений - Таблица с информацией о подмодулях.
//		Содержит колонки:
//			ХэшКоммита - Строка - Хэш коммита, на который указывает подмодуль
//			Имя - Строка - Имя подмодуля
//			Указатель - Строка - указатель на внешний репозиторий
//
```

> Работа с настройками

#### ПолучитьНастройку
```bsl
// Получить значение настройки git
//
// Параметры:
//   ИмяНастройки - Строка - Имя настройки
//   РежимУстановкиНастроекGit - РежимУстановкиНастроекGit - Режим установки настройки.
//		Значения параметра содержатся в перечислении РежимУстановкиНастроекGit
//
//  Возвращаемое значение:
//   Строка - Значение настройки
//
```

#### УстановитьНастройку
```bsl
// Установить настройку git
// git config
//
// Параметры:
//   ИмяНастройки - Строка - Имя настройки
//   ЗначениеНастройки - Строка - Устанавливаемое значение
//   РежимУстановкиНастроекGit - РежимУстановкиНастроекGit - Режим установки настройки.
//		Значения параметра содержатся в перечислении РежимУстановкиНастроекGit
//
```

#### УдалитьСекциюНастроек
```bsl
// Удаление секции настроек git
//
// Параметры:
//   ИмяСекции - Строка - Имя секции
//   РежимУстановкиНастроекGit - РежимУстановкиНастроекGit - Режим установки настройки.
//
```

#### ПолучитьСписокНастроек
```bsl
// Получить список настроек git
//
// Параметры:
//   РежимУстановкиНастроекGit - РежимУстановкиНастроекGit - Уровень, на котором
//		необходимо искать значения настроек
//
//  Возвращаемое значение:
//   Соответствие - Список настроек.
//		Ключ соответствия - ключ настройки
//		Значение соответствия - значение настройки
//
```

> Выполнение произвольных команд

#### ВыполнитьКоманду
```bsl
// Выполнение произвольной команды git
//
// Параметры:
//   Параметры - Массив - Массив строковых аргументов, передаваемых в командную
//		строку. Добавляются после исполняемого файла.
//
```

### Класс НастройкаКомандыОтправить:

#### ПолучитьПараметрыКоманды
```bsl
// Функция возвращает массив параметров выполнения команды git
//
```bsl

#### ПолучитьНастройки
```bsl
// Функция возвращает стурктуру с текущими настройками отправки
//
//  Возвращаемое значение:
//   Структура  
//		Доступные ключи:
//			URLРепозитория - Строка - Признак текущей ветки
//			ЗаголовкиОтправки - Массив - Массив строк заголовков
//          ПараметрыКомандыОтправки - Соответсвие - Соответвие настроек команды (ключ - имя параметра, значение - булево)
```

#### УстановитьНастройки
```bsl
// Процедура устанавливает текущими настройками отправки по переданный структуре
//
//  Параметры
//     НовыеНастройкиОтправки - Структура  
//		  Доступные ключи:
//			  URLРепозитория - Строка - Признак текущей ветки
//			  ЗаголовкиОтправки - Массив - Массив строк заголовков
//            ПараметрыКомандыОтправки - Соответсвие - Соответвие настроек команды (ключ - имя параметра, значение - булево)
```

#### ДобавитьПроизвольныйЗаголовокОтправки
```bsl
// Процедура добавляет произвольный заголовок настройками отправки
//
//  Параметры
//     ЗаголовокОтправки - Строка - значение заголовка отправки  
//	
```

#### УстановитьURLРепозиторияОтправки
```bsl
// Процедура устанавливает URL репозитория git в настройками отправки
//
//  Параметры
//     НовыйURLРепозитория - Строка - значение URL git репозитория или имя внешнего репозитория  
//	
```

#### УстановитьЗаголовкиОтправки
```bsl
// Процедура устанавливает массив заголовков отправки репозитория git в настройки отправки
//
//  Параметры
//     НовыйЗаголовкиОтправки - Строка/Массив - Строка или массив готовый заголовок отправки  
//
```

#### УстановитьПараметрыКомандыОтправки
```bsl
// Процедура устанавливает параметры команды в настройки отправки
//
//  Параметры
//     Параметры - Соответвие - Соответвие настроек команды (ключ - имя параметра, значение - булево)  
//
```

#### ДобавитьЗаголовкиОтправки
```bsl
// Процедура добавляет заголовки отправки в настройки отправки
//
//  Параметры
//     ЗаголовокРабочейКопии - строка - строка с именем ветки или refspec рабочей копии   
//     ЗаголовокУдаленногоСервера - строка - строка с именем ветки или refspec удаленного сервера   
//	
```

#### ОтображатьПрогресс
```bsl
// Процедура устанавливает параметры отображения прогресса выполнения команды в настройки отправки
// git push --progress
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### РежимТишины
```bsl
// Процедура устанавливает параметры режима тишины выполнения команды в настройки отправки
// git push --quiet
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### РежимЗеркала
```bsl
// Процедура устанавливает параметры режима зеркала выполнения команды в настройки отправки
// git push --mirror
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### РежимУдаления
```bsl
// Процедура устанавливает параметры режима удаления выполнения команды в настройки отправки
// git push --delete
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### ПолнаяОтправка
```bsl
// Процедура устанавливает параметры режима полной отправки при выполнении команды в настройки отправки
// git push --all
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### ПерезаписатьИсторию
```bsl
// Процедура устанавливает режим перезаписи истории при выполнении команды в настройки отправки
// git push --force
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### Отслеживать
```bsl
// Процедура устанавливает необходимость отслеживать отправленные заголовки при выполнении команды в настройки отправки
// git push --set-upstream
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### РежимПрограммнойОбработкаРезультата
```bsl
// Процедура устанавливает режим программной обработки результатов при выполнении команды в настройки отправки
// git push --porcelain
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### ОтправкаТэгов
```bsl
// Процедура устанавливает режим отправки тэгов при выполнении команды в настройки отправки
// git push --tags
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### УстановитьПроизвольныйРежим

```bsl
// Процедура устанавливает произвольную настройку при выполнении команды в настройки отправки
//
//  Параметры
//     НаименованиеПараметра - строка - Наименование параметра настройки
//     ЗначениеУстановки - булево - По умолчанию Истина
```

### Класс НастройкаКомандыКлонировать:

#### ПолучитьПараметрыКоманды

```bsl
// Функция возвращает массив параметров выполнения команды git
//
```

#### УстановитьURLРепозиторияКлонирования

```bsl
// Процедура устанавливает URL репозитория git в настройками отправки
//
//  Параметры
//     НовыйURLРепозитория - Строка - значение URL git репозитория или имя внешнего репозитория  
//	
```

#### УстановитьКаталогКлонирования

```bsl
// Процедура устанавливает каталог рабочей копии репозитория git в настройками клонирования
//
//  Параметры
//     КаталогКлонирования - Строка - значение URL git репозитория или имя внешнего репозитория  
//	
```

#### УстановитьПараметрыКомандыКлонирования

```bsl
// Процедура устанавливает параметры команды в настройки отправки
//
//  Параметры
//     Параметры - Соответвие - Соответвие настроек команды (ключ - имя параметра, значение - булево)  
//
```

#### РежимЗеркала

```bsl
// Процедура устанавливает параметры режима зеркала выполнения команды в настройки 
//  --mirror
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### РежимБезРабочейКопии

```bsl
// Процедура устанавливает параметры режима без рабочей выполнения команды в настройки 
//  --bare
//  Параметры
//     ЗначениеУстановки - булево - По умолчанию Истина 
```

#### ГлубинаКопии

```bsl
// Процедура устанавливает параметры глубина получения коммитов команды в настройки 
//  --depth
//  Параметры
//     ЗначениеУстановки - Число - По умолчанию 0 
```

#### УстановитьПроизвольныйРежим

```bsl
// Процедура устанавливает произвольную настройку при выполнении команды в настройки
//
//  Параметры
//     НаименованиеПараметра - строка - Наименование параметра настройки
//     ЗначениеУстановки - булево - По умолчанию Истина
```


### Перечисления

#### РежимУстановкиНастроекGit:

Значения:
* Локально
* Глобально
* Системно
