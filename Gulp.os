﻿// После запуска данного скрипта, он следит за изменениями в файле Joomla.os, 
// при изменении данного файла запускается Joomla.bat
// Остановка работы скрипта Ctrl-C

Процедура ВыполнитьКоманднуюСтроку(Команда) экспорт
   Ф = Новый ЗаписьТекста;  Ф.Открыть("Cmdcom.bat");   
   Ф.ЗаписатьСтроку("rem"); Ф.ЗаписатьСтроку(Команда); 
   Ф.Закрыть();      ЗапуститьПриложение("Cmdcom.bat");
КонецПроцедуры

Ф = Новый Файл("Joomla.os");

Время = Ф.ПолучитьВремяИзменения();
Сообщить("Время последнего изменения: "+Время);
Пока Истина Цикл
   Время1 = Ф.ПолучитьВремяИзменения();
   Сообщить("Время последнего изменения: "+Время1);
   Если Время1<>Время Тогда
     Сообщить("Произошли изменения");     Время=Время1;
     ЗапуститьПриложение("Joomla.bat");
   КонецЕсли;
   Приостановить(1000);  
КонецЦикла;

