Attribute VB_Name = "Module1"
DefInt A-Z

' Variables publiques
Public Echo                 ' Indicateur d'Echo Oui/Non.
Public CancelSend           ' Indicateur pour arrêter la transmission d'un fichier text.

Public Const vbMSCommEvReceive = 2
Public Const vbMSCommEvSend = 1
Public Const vbMSCommEvCTS = 3
Public Const vbMSCommEvDSR = 4
Public Const vbMSCommEvCD = 5
Public Const vbMSCommEvRing = 6
Public Const vbMSCommEvEOF = 7

Public Const vbMSCommErBreak = 1001
Public Const vbMSCommErCTSTO = 1002
Public Const vbMSCommErDSRTO = 1003
Public Const vbMSCommErFrame = 1004
Public Const vbMSCommErOverrun = 1005
Public Const vbMSCommErCDTO = 1006
Public Const vbMSCommErRxOver = 1007
Public Const vbMSCommErRxParity = 1008
Public Const vbMSCommErTxFull = 1009

#If Win32 Then
    Declare Sub SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long)
#Else
    Declare Sub SetWindowPos Lib "USER" (ByVal hWnd%, ByVal hWndInsertAfter%, ByVal X%, ByVal Y%, ByVal cx%, ByVal cy%, ByVal wFlags%)
#End If




