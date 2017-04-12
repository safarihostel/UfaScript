//----Данный файл должен склеиваться с билиотекой UfaScript.bl и должен следовать за ней ------------------
//---- подробности смотри в начале файла UfaScript.bl
//   (c) Ошнуров Андрей Михайлович г.Уфа  UfaScript@mail.ru

Процедура НачальныеУстановки()
  НачальныеУстановкиСистемыUfaScript(23,38);
  ГлобПерем.Вставить("Координаты", Новый Массив);    Разм = 3;
  Если Консоль.Высота < 36 ИЛИ Консоль.Ширина < 92  Тогда Разм = 2; КонецЕсли;
  Если Консоль.Высота < 29 ИЛИ Консоль.Ширина < 65  Тогда Разм = 1; КонецЕсли;
  ГлобПерем.Вставить("Размер", Разм);
КонецПроцедуры

#Область КубикИНадписи
Процедура Грань(Знач М, Знач В, Знач Ш, Знач Ц)
    Р = ГлобПерем.Размер; 
     Для сч1=1 по 3 Цикл	
       Для сч=1 По 3 Цикл
         Текст = ВЭкранМассивСтрокВЦвете(М, В+сч1*Р, Ш+сч*Р*2, Ц, ЦветКонсоли.Желтый);
		 ГлобПерем.Координаты.Добавить(Текст);
       КонецЦикла;
     КонецЦикла;	
КонецПроцедуры

Процедура ВсеГрани(Знач М, Знач В, Знач Ш)
    Р = ГлобПерем.Размер;
    Грань(М, В,       Ш, ЦветКонсоли.Зеленый);  Ш = Ш+Р*7; 
    Грань(М, В,       Ш, ЦветКонсоли.Красный);  Ш = Ш+Р*7;
    Грань(М, В,       Ш, ЦветКонсоли.Белый);
    Грань(М, В-Р*3-1, Ш, ЦветКонсоли.Серый);
    Грань(М, В+Р*3+1, Ш, ЦветКонсоли.Черный);   Ш = Ш+Р*7;
    Грань(М, В,       Ш, ЦветКонсоли.Синий);
КонецПроцедуры

Функция ДобавитьСтрокиВМассивСПромежутком(Знач М)
    Если ГлобПерем.Размер=1 Тогда   Возврат М;
	ИначеЕсли  ГлобПерем.Размер=2 Тогда   M1 = Новый Массив;
	   Для сч=0 По М.Количество()-1 Цикл     M1.Добавить(М[сч]);   M1.Добавить(""); КонецЦикла;
    ИначеЕсли  ГлобПерем.Размер=3 Тогда   M1 = Новый Массив;
	   Для сч=0 По М.Количество()-1 Цикл     M1.Добавить(М[сч]);  M1.Добавить(""); M1.Добавить("");   КонецЦикла;
    КонецЕсли;   Возврат M1;
КонецФункции

Функция СформироватьСтрокуНадписиКубику(Знач М)
   Если ГлобПерем.Размер=1 Тогда Возврат М[0]+" "+М[1]+" "+М[2];
   ИначеЕсли ГлобПерем.Размер=2 Тогда Возврат М[0]+"    "+М[1]+"    "+М[2];  
   ИначеЕсли ГлобПерем.Размер=3 Тогда Возврат М[0]+"     "+М[1]+"     "+М[2];  КонецЕсли;
КонецФункции

Функция ЗадатьКоординатыСегмента(Знач Сег, Знач Ном)
   Если       ГлобПерем.Размер = 1 И Ном = 1 Тогда Сег.Верх = Сег.Верх-4;  Сег.Лево = Сег.Лево+16;
   ИначеЕсли  ГлобПерем.Размер = 1 И Ном = 2 Тогда Сег.Верх = Сег.Верх+8;  Сег.Лево = Сег.Лево+16;
   ИначеЕсли  ГлобПерем.Размер = 1 И Ном = 3 Тогда Сег.Верх = Сег.Верх;    Сег.Лево = Сег.Лево+10;
   ИначеЕсли  ГлобПерем.Размер = 1 И Ном = 4 Тогда Сег.Верх = Сег.Верх+4;  Сег.Лево = Сег.Лево+10;
   ИначеЕсли  ГлобПерем.Размер = 2 И Ном = 1 Тогда Сег.Верх = Сег.Верх-6;  Сег.Лево = Сег.Лево+32;
   ИначеЕсли  ГлобПерем.Размер = 2 И Ном = 2 Тогда Сег.Верх = Сег.Верх+15; Сег.Лево = Сег.Лево+32;
   ИначеЕсли  ГлобПерем.Размер = 2 И Ном = 3 Тогда Сег.Верх = Сег.Верх+1;  Сег.Лево = Сег.Лево+18;
   ИначеЕсли  ГлобПерем.Размер = 2 И Ном = 4 Тогда Сег.Верх = Сег.Верх+8;  Сег.Лево = Сег.Лево+18;
   ИначеЕсли  ГлобПерем.Размер = 3 И Ном = 1 Тогда Сег.Верх = Сег.Верх-8;  Сег.Лево = Сег.Лево+50;
   ИначеЕсли  ГлобПерем.Размер = 3 И Ном = 2 Тогда Сег.Верх = Сег.Верх+22; Сег.Лево = Сег.Лево+50;
   ИначеЕсли  ГлобПерем.Размер = 3 И Ном = 3 Тогда Сег.Верх = Сег.Верх+2;  Сег.Лево = Сег.Лево+29;
   ИначеЕсли  ГлобПерем.Размер = 3 И Ном = 4 Тогда Сег.Верх = Сег.Верх+12; Сег.Лево = Сег.Лево+29;
   КонецЕсли;  
   Возврат Сег;
КонецФункции

Процедура НадписиУКубика(Знач В, Знач Ш);
   М = Новый Массив;   Р = ГлобПерем.Размер;
   М.Добавить("Q");  М.Добавить("A");  М.Добавить("Z");  
   М1 = ДобавитьСтрокиВМассивСПромежутком(М);  
   ВЭкранМассивСтрокВЦвете(М1, В+Р, Ш+Р, ЦветКонсоли.Белый, ЦветКонсоли.Черный);
   М[0] = "W";  М[1] = "S";  М[2] = "X";   Н=0;
   М1 = ДобавитьСтрокиВМассивСПромежутком(М);  Если Р>1 Тогда Н=1; КонецЕсли; 
   ВЭкранМассивСтрокВЦвете(М1, В+Р, Ш+Р*29+Н, ЦветКонсоли.Белый, ЦветКонсоли.Черный);
   М[0] = "E";  М[1] = "R";  М[2] = "T";   Л = СформироватьСтрокуНадписиКубику(М);
   C = СегментОбъект(0, В,  Ш, Л);  C.ЦветФона = ЦветКонсоли.Белый;  C.ЦветТекста = ЦветКонсоли.Черный;
   ДобавитьСегментВМассив(ЗадатьКоординатыСегмента(C,1));
   М[0] = "D";  М[1] = "F";  М[2] = "G";   Л = СформироватьСтрокуНадписиКубику(М);
   C = СегментОбъект(0, В, Ш, Л);  C.ЦветФона = ЦветКонсоли.Белый;  C.ЦветТекста = ЦветКонсоли.Черный;
   ДобавитьСегментВМассив(ЗадатьКоординатыСегмента(C,2));
   М[0] = "Y";  М[1] = "U";  М[2] = "I";   Л = СформироватьСтрокуНадписиКубику(М);
   C = СегментОбъект(0, В,  Ш, Л);  C.ЦветФона = ЦветКонсоли.Белый;  C.ЦветТекста = ЦветКонсоли.Черный;
   ДобавитьСегментВМассив(ЗадатьКоординатыСегмента(C,3));
   М[0] = "H";  М[1] = "J";  М[2] = "K";   Л = СформироватьСтрокуНадписиКубику(М);
   C = СегментОбъект(0, В, Ш, Л);  C.ЦветФона = ЦветКонсоли.Белый;  C.ЦветТекста = ЦветКонсоли.Черный;
   ДобавитьСегментВМассив(ЗадатьКоординатыСегмента(C,4));
КонецПроцедуры
#КонецОбласти

Процедура ИграКубикРубик()
    НарисоватьРамкуНаВесьЭкран();  
    В = 10;  Ш = 1;    М = Новый Массив;   
	Для сч=0 По ГлобПерем.Размер-1  Цикл М.Добавить(СоздатьСтрокуСимволов(" ",ГлобПерем.Размер*2));  КонецЦикла;    
    ВсеГрани(М, В, Ш);	НадписиУКубика(В, Ш);
	Л = "И Г Р А   К У Б И К - Р У Б И К";
   C = СегментОбъект(0, В-8, Ш+3, Л);  C.ЦветФона = ЦветКонсоли.Зеленый;  C.ЦветТекста = ЦветКонсоли.Красный;
   ДобавитьСегментВМассив(C);
  Л = "Автор идеи и разработчик :";
   C = СегментОбъект(0, В-7, Ш+1, Л);  C.ЦветФона = ЦветКонсоли.Серый;  C.ЦветТекста = ЦветКонсоли.Синий;
   ДобавитьСегментВМассив(C);
  Л = "(с) Ошнуров А.М. г.Уфа";
   C = СегментОбъект(0, В-6, Ш+1, Л);  C.ЦветФона = ЦветКонсоли.Серый;  C.ЦветТекста = ЦветКонсоли.Синий;
   ДобавитьСегментВМассив(C);
  Л = "Esc-Выход. 1Script";
   C = СегментОбъект(0, В-5, Ш+1, Л);  C.ЦветФона = ЦветКонсоли.Зеленый;  C.ЦветТекста = ЦветКонсоли.Красный;
   ДобавитьСегментВМассив(C);
КонецПроцедуры

#Область АлгоритмИгры

Процедура КрутимГоризонтальноВправо(Знач П)
   Ц1 = ПолучитьЦветФонаОбъекта(П*3);  Ц2 = ПолучитьЦветФонаОбъекта(П*3+1);  Ц3 = ПолучитьЦветФонаОбъекта(П*3+2);	
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[сч+П*3],    ПолучитьЦветФонаОбъекта(45+сч+П*3)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[45+сч+П*3], ПолучитьЦветФонаОбъекта(18+сч+П*3)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[18+сч+П*3], ПолучитьЦветФонаОбъекта(9+сч+П*3)); КонецЦикла;
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[9+П*3],Ц1);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[10+П*3],Ц2);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[11+П*3],Ц3);
КонецПроцедуры

Процедура КрутимГоризонтальноВлево(Знач П)
   Ц1 = ПолучитьЦветФонаОбъекта(П*3);  Ц2 = ПолучитьЦветФонаОбъекта(П*3+1);  Ц3 = ПолучитьЦветФонаОбъекта(П*3+2);
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[П*3+сч],    ПолучитьЦветФонаОбъекта(9+сч+П*3));  КонецЦикла;  
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[9+сч+П*3],  ПолучитьЦветФонаОбъекта(18+сч+П*3));  КонецЦикла; 
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[18+сч+П*3], ПолучитьЦветФонаОбъекта(45+сч+П*3));  КонецЦикла;
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[П*3+45],Ц1);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[П*3+46],Ц2);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[П*3+47],Ц3);
КонецПроцедуры

Процедура КрутимВертикальноСверхуВниз(П);
   Ц1 = ПолучитьЦветФонаОбъекта(П);  Ц2 = ПолучитьЦветФонаОбъекта(П+3);  Ц3 = ПолучитьЦветФонаОбъекта(П+6);
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[П+(сч*3)],    ПолучитьЦветФонаОбъекта(44-(сч*3)-П)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[44-(сч*3)-П], ПолучитьЦветФонаОбъекта(26-(сч*3)-П)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[26-(сч*3)-П], ПолучитьЦветФонаОбъекта(35-(сч*3)-П)); КонецЦикла;
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[29-П], Ц3);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[32-П], Ц2);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[35-П], Ц1);
КонецПроцедуры

Процедура КрутимВертикальноСнизуВверх(П)
   Ц1 = ПолучитьЦветФонаОбъекта(П);  Ц2 = ПолучитьЦветФонаОбъекта(П+3);  Ц3 = ПолучитьЦветФонаОбъекта(П+6);
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[П+(сч*3)],    ПолучитьЦветФонаОбъекта(35-(сч*3)-П)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[35-(сч*3)-П], ПолучитьЦветФонаОбъекта(26-(сч*3)-П)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[26-(сч*3)-П], ПолучитьЦветФонаОбъекта(44-(сч*3)-П)); КонецЦикла;
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[38-П], Ц3);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[41-П], Ц2);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[44-П], Ц1);
КонецПроцедуры

Процедура КрутимВбокСнизуВверх(П)
   Ц1 = ПолучитьЦветФонаОбъекта(П+9);  Ц2 = ПолучитьЦветФонаОбъекта(П+12);  Ц3 = ПолучитьЦветФонаОбъекта(П+15);
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[9+сч*3+П],  ПолучитьЦветФонаОбъекта(42+сч-П*3)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[42+сч-П*3], ПолучитьЦветФонаОбъекта(53-сч*3-П)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[53-сч*3-П], ПолучитьЦветФонаОбъекта(29-сч+П*3)); КонецЦикла;
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[29+П*3], Ц1);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[28+П*3], Ц2);
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[27+П*3], Ц3);
КонецПроцедуры

Процедура КрутимВбокСверхуВниз(П)
   Ц1 = ПолучитьЦветФонаОбъекта(П+9);  Ц2 = ПолучитьЦветФонаОбъекта(П+12);  Ц3 = ПолучитьЦветФонаОбъекта(П+15);
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[9+сч*3+П],  ПолучитьЦветФонаОбъекта(29-сч+П*3)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[29-сч+П*3], ПолучитьЦветФонаОбъекта(53-сч*3-П)); КонецЦикла;
   Для сч=0 По 2 Цикл ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[53-сч*3-П], ПолучитьЦветФонаОбъекта(42+сч-П*3)); КонецЦикла;
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[42-П*3], Ц1);                                 
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[43-П*3], Ц2);                                  
   ПоменятьЦветФонаОбъекта(ГлобПерем.Координаты[44-П*3], Ц3);                               
КонецПроцедуры

#КонецОбласти

Функция ЕстьНовыйКадр(Клавиша);
    Если      Клавиша = Кл.Q   Тогда  КрутимГоризонтальноВправо(0);
    ИначеЕсли Клавиша = Кл.A   Тогда  КрутимГоризонтальноВправо(1);  
    ИначеЕсли Клавиша = Кл.Z   Тогда  КрутимГоризонтальноВправо(2);
    ИначеЕсли Клавиша = Кл.W   Тогда  КрутимГоризонтальноВлево(0);
    ИначеЕсли Клавиша = Кл.S   Тогда  КрутимГоризонтальноВлево(1);  
    ИначеЕсли Клавиша = Кл.X   Тогда  КрутимГоризонтальноВлево(2);  
    ИначеЕсли Клавиша = Кл.T   Тогда  КрутимВертикальноСверхуВниз(0);  
    ИначеЕсли Клавиша = Кл.R   Тогда  КрутимВертикальноСверхуВниз(1);  
    ИначеЕсли Клавиша = Кл.E   Тогда  КрутимВертикальноСверхуВниз(2);  
    ИначеЕсли Клавиша = Кл.G   Тогда  КрутимВертикальноСнизуВверх(0);  
    ИначеЕсли Клавиша = Кл.F   Тогда  КрутимВертикальноСнизуВверх(1);  
    ИначеЕсли Клавиша = Кл.D   Тогда  КрутимВертикальноСнизуВверх(2);  
    ИначеЕсли Клавиша = Кл.H   Тогда  КрутимВбокСнизуВверх(0);  
    ИначеЕсли Клавиша = Кл.J   Тогда  КрутимВбокСнизуВверх(1);  
    ИначеЕсли Клавиша = Кл.K   Тогда  КрутимВбокСнизуВверх(2);  
    ИначеЕсли Клавиша = Кл.Y   Тогда  КрутимВбокСверхуВниз(0);  
    ИначеЕсли Клавиша = Кл.U   Тогда  КрутимВбокСверхуВниз(1);  
    ИначеЕсли Клавиша = Кл.I   Тогда  КрутимВбокСверхуВниз(2);  
	ИначеЕсли Клавиша = Кл.ESC Тогда  Возврат ВопросДаНетВыходИзПрограммы(); КонецЕсли;   // Esc - выход из программы
	Возврат Истина;
КонецФункции

#Область Пуск

Процедура ПускПоНажатию()
	Клавиша = Консоль.Прочитать();
	Пока ЕстьНовыйКадр(Клавиша) Цикл
	   Клавиша = Консоль.Прочитать();
	КонецЦикла;
	Консоль.Очистить();	Консоль.ВидимостьКурсора(Истина);
КонецПроцедуры

#КонецОбласти


НачальныеУстановки();
ИграКубикРубик();
ПускПоНажатию();
