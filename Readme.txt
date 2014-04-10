Speicherausleseprogramm für Messgerät "Rosonsky"
¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯
Verwendung
----------

 - Einstellen der Verbindungsdaten (COM-Port, 9600 8N1)
 - [Verbinden] mit Messgerät
 - Auswählen von Dateispeicherort
 - Vergabe eines Dateinamens für die aktuelle Messung
 - [Aufnahme Start]
 - betätigen des Ausgabetasters am Messgerät
 - warten bis Messwerte übertragen sind
 - [Aufnahme Ende]

 - Existiert eine Messdatei schon, wird beim Starten der Aufnahme gefragt,
   ob der Dateiname geändert werden soll. In diesem Fall wird eine Zahl in Klammern
   an den Dateinamen angehängt

 - Einstellungen werden in einer Datei $Programmname.ini gespeichert
 - Konfiguration des Ports oben im Fenster:
   [Portnummer] [Baudrate] [Datenbits] [Paritätsbit] [Stoppbits]
   Normalerweise muss nur die Portnummer eingestellt werden, die anderen Felder
   sind auf die Werte des Messgeräts voreingestellt.


Internals
---------

 - Verbindung: 9600 Baud, 8 Datenbits, keine Parität, 1 Stoppbit.
 - Messwerte: 16bit Unsigned Word in BigEndian
 - Ausgabeforma: CSV-Datei
   Kopf: Versuchsname;Aufnahmedatum/Uhrzeit(ISO8601)
   Eine Zeile pro Messwert

Lizenz
------
 - Verwendet und nicht von dieser Lizenz betroffen:
   ComPortLib     http://comport.sf.net/
   TFolderBrowser http://www.entwickler-ecke.de/viewtopic.php?t=27628

Copyright © 2014 Sebastian Hütter (sebastian.huetter@st.ovgu.de)
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

