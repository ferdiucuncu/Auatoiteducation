#include <GUIConstantsEx.au3>
#include <MsgBoxConstants.au3>

Example()

;farkl� durum de�erleri alan 3 adet radyo buton koyal�m ve bir adet ekrana yazd�r butonu ekleyelim
;Butona t�kland���nda se�ilen radyo butona gelen kar��l��� ekrana yazd�ral�m
;GUI �zerinde yap�lan simge durumuna k���ltme ve kapatma gibi de�i�iklikleri de alg�lay�p ekrana yazd�ral�m.
Func Example()
    Opt("GUICoordMode", 1)
   ;GUICreate() fonksiyonunu kullanarak yeni bir GUI olu�tural�m
    GUICreate("GUIGetMsg De�erleri Denemesi", 400, 280)

    ;ekrana yazd�racak butonu olu�tural�m
    Local $idButton_1 = GUICtrlCreateButton("De�eri Yazd�r", 30, 20, 120, 40)
	;butonlar� bir �er�eve i�erisinde g�sterecek grup olu�tural�m
    GUICtrlCreateGroup("Buton Grubu", 30, 90, 165, 160)
    GUIStartGroup()
	;Radyo butonlar� olu�tural�m
    Local $idRadio_1 = GUICtrlCreateRadio("Buton &0", 50, 120, 70, 20)
    GUICtrlCreateRadio("Buton &1", 50, 150, 60, 20)
    Local $idRadio_3 = GUICtrlCreateRadio("Buton &2", 50, 180, 60, 20)

   ; GUI olaylar�n� takip etmek i�in kullanaca��m�z de�i�kenleri ba�latal�m
    Local $iRadioVal1 = 0 ; se�ilen ilk radyo butonun de�erini 0 son butonun de�erini 2 alaca��z

   ;GUI nin g�r�n�m�n� a��yoruz.
    GUISetState(@SW_SHOW)

    Local $idMsg = 0



    ; Radyo butonlarda yap�lan de�i�iklikleri de�i�kenlere at�yoruz
    ;de�i�kenlere gelen de�eri okumak i�in GUICtrlRead() fonksiyonunu kullan�yoruz
    While 1
        $idMsg = GUIGetMsg()
        Select
            Case $idMsg = $GUI_EVENT_CLOSE
                MsgBox($MB_SYSTEMMODAL, "", "GUI kapat�ld�")
                ExitLoop
            Case $idMsg = $GUI_EVENT_MINIMIZE
                MsgBox($MB_SYSTEMMODAL, "", "GUI simge durumuna k���lt�ld�", 2)
            Case $idMsg = $GUI_EVENT_MAXIMIZE
                MsgBox($MB_SYSTEMMODAL, "", "�leti�im kutusu geri y�klendi", 2)

            Case $idMsg = $idButton_1
                MsgBox($MB_SYSTEMMODAL, "", "T�klanan Buton:" & @CRLF & " Buton " & $iRadioVal1)

            Case $idMsg >= $idRadio_1 And $idMsg <= $idRadio_3
                $iRadioVal1 = $idMsg - $idRadio_1

        EndSelect
    WEnd

    GUIDelete()
EndFunc