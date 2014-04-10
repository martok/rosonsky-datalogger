Speicherausleseprogramm f�r Messger�t "Rosonsky"
������������������������������������������������
Verwendung
----------

 - Einstellen der Verbindungsdaten (COM-Port, 9600 8N1)
 - [Verbinden] mit Messger�t
 - Ausw�hlen von Dateispeicherort
 - Vergabe eines Dateinamens f�r die aktuelle Messung
 - [Aufnahme Start]
 - bet�tigen des Ausgabetasters am Messger�t
 - warten bis Messwerte �bertragen sind
 - [Aufnahme Ende]

 - Existiert eine Messdatei schon, wird beim Starten der Aufnahme gefragt,
   ob der Dateiname ge�ndert werden soll. In diesem Fall wird eine Zahl in Klammern
   an den Dateinamen angeh�ngt

 - Einstellungen werden in einer Datei $Programmname.ini gespeichert
 - Konfiguration des Ports oben im Fenster:
   [Portnummer] [Baudrate] [Datenbits] [Parit�tsbit] [Stoppbits]
   Normalerweise muss nur die Portnummer eingestellt werden, die anderen Felder
   sind auf die Werte des Messger�ts voreingestellt.


Internals
---------

 - Verbindung: 9600 Baud, 8 Datenbits, keine Parit�t, 1 Stoppbit.
 - Messwerte: 16bit Unsigned Word in BigEndian
 - Ausgabeforma: CSV-Datei
   Kopf: Versuchsname;Aufnahmedatum/Uhrzeit(ISO8601)
   Eine Zeile pro Messwert

Lizenz
------
 - Verwendet und nicht von dieser Lizenz betroffen:
   ComPortLib     http://comport.sf.net/
   TFolderBrowser http://www.entwickler-ecke.de/viewtopic.php?t=27628

Copyright � 2014 Sebastian H�tter (sebastian.huetter@st.ovgu.de)
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

