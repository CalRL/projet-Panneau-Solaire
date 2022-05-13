VERSION 5.00
Begin VB.Form configuration 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Paramètres de communication"
   ClientHeight    =   3795
   ClientLeft      =   2220
   ClientTop       =   3150
   ClientWidth     =   3285
   Icon            =   "parametre.frx":0000
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3795
   ScaleWidth      =   3285
   Begin VB.OptionButton ComPort 
      Caption         =   "Com1"
      Height          =   252
      Index           =   1
      Left            =   1920
      TabIndex        =   19
      Top             =   2340
      Width           =   852
   End
   Begin VB.OptionButton ComPort 
      Caption         =   "Com4"
      Height          =   252
      Index           =   4
      Left            =   1920
      TabIndex        =   18
      Top             =   3240
      Width           =   852
   End
   Begin VB.OptionButton ComPort 
      Caption         =   "Com3"
      Height          =   252
      Index           =   3
      Left            =   1920
      TabIndex        =   17
      Top             =   2940
      Width           =   852
   End
   Begin VB.OptionButton ComPort 
      Caption         =   "Com2"
      Height          =   252
      Index           =   2
      Left            =   1920
      TabIndex        =   16
      Top             =   2640
      Width           =   852
   End
   Begin VB.Frame Frame1 
      Caption         =   "Débit en &Baud"
      Height          =   975
      Left            =   240
      TabIndex        =   2
      Top             =   120
      Width           =   2835
      Begin VB.OptionButton Baud3 
         Caption         =   "300"
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   735
      End
      Begin VB.OptionButton Baud6 
         Caption         =   "600"
         Height          =   255
         Left            =   960
         TabIndex        =   4
         Top             =   240
         Width           =   615
      End
      Begin VB.OptionButton Baud12 
         Caption         =   "1200"
         Height          =   255
         Left            =   1800
         TabIndex        =   5
         Top             =   240
         Width           =   735
      End
      Begin VB.OptionButton Baud24 
         Caption         =   "2400"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   600
         Width           =   735
      End
      Begin VB.OptionButton Baud48 
         Caption         =   "4800"
         Height          =   255
         Left            =   960
         TabIndex        =   7
         Top             =   600
         Width           =   735
      End
      Begin VB.OptionButton Baud96 
         Caption         =   "9600"
         Height          =   255
         Left            =   1800
         TabIndex        =   8
         Top             =   600
         Width           =   735
      End
   End
   Begin VB.CommandButton OKButton 
      Caption         =   "OK"
      Default         =   -1  'True
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   2160
      Width           =   975
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "Annuler"
      Height          =   375
      Left            =   360
      TabIndex        =   1
      Top             =   2640
      Width           =   975
   End
   Begin VB.Frame Frame2 
      Caption         =   "Bits de &données"
      Height          =   615
      Left            =   240
      TabIndex        =   9
      Top             =   1260
      Width           =   1275
      Begin VB.OptionButton Data7 
         Caption         =   "7"
         Height          =   255
         Left            =   180
         TabIndex        =   10
         Top             =   240
         Width           =   375
      End
      Begin VB.OptionButton Data8 
         Caption         =   "8"
         Height          =   255
         Left            =   720
         TabIndex        =   11
         Top             =   240
         Width           =   435
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Bits d'&arrêt"
      Height          =   615
      Left            =   1740
      TabIndex        =   12
      Top             =   1260
      Width           =   1335
      Begin VB.OptionButton Stop1 
         Caption         =   "1"
         Height          =   255
         Left            =   240
         TabIndex        =   13
         Top             =   240
         Width           =   435
      End
      Begin VB.OptionButton Stop2 
         Caption         =   "2"
         Height          =   255
         Left            =   780
         TabIndex        =   14
         Top             =   240
         Width           =   495
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "Port de &comm."
      Height          =   1575
      Left            =   1740
      TabIndex        =   15
      Top             =   2040
      Width           =   1335
   End
End
Attribute VB_Name = "configuration"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' Feuille de paramétrage de la configuration des communications

' Copyright (c) 1994, Crescent Software

DefInt A-Z

Dim NewPort                        ' Paramètres de configuration temporaire.
Dim NewBaud$, NewParity$
Dim NewData$, NewStop$
Dim NewShake

' Bouton d'option 1200 Baud.
Private Sub Baud12_Click()
    NewBaud$ = "1200"
End Sub

' Bouton d'option 2400 Baud.
Private Sub Baud24_Click()
    NewBaud$ = "2400"
End Sub

' Bouton d'option 300 Baud.
Private Sub Baud3_Click()
    NewBaud$ = "300"
End Sub

' Bouton d'option 4800 Baud.
Private Sub Baud48_Click()
    NewBaud$ = "4800"
End Sub

' Bouton d'option 600 Baud.
Private Sub Baud6_Click()
    NewBaud$ = "600"
End Sub

' Bouton d'option 9600 Baud.
Private Sub Baud96_Click()
    NewBaud$ = "9600"
End Sub

' Actions du bouton Annuler.
Private Sub CancelButton_Click()
    Unload configuration
End Sub

' Bouton d'option pour le numéro du port de communication.
Private Sub ComPort_Click(Index As Integer)
    NewPort = Index
End Sub

' Bouton d'option pour 7 bits de données.
Private Sub Data7_Click()
    NewData$ = "7"
End Sub

' Bouton d'option pour 8 bits de données.
Private Sub Data8_Click()
    NewData$ = "8"
End Sub

' Initialise et affiche la feuille de configuration.
Private Sub Form_Load()
    ' Obtient le port de communication en cours.
    Port = principal.MSComm1.CommPort
    configuration.ComPort(Port).Value = True   ' Définit le bouton d'option du port.

    ' Obtient le débit en Baud courant.
    FirstComma = InStr(principal.MSComm1.Settings, ",")
    Baud$ = Left(principal.MSComm1.Settings, FirstComma - 1)
    
    Select Case Val(Baud$)                  ' Sélectionne le débit.
    Case 300                                ' Définit le bouton d'option actif du débit.
        configuration.Baud3.Value = True
    Case 600
        configuration.Baud6.Value = True
    Case 1200
        configuration.Baud12.Value = True
    Case 2400
        configuration.Baud24.Value = True
    Case 4800
        configuration.Baud48.Value = True
    Case 9600
        configuration.Baud96.Value = True
    End Select
   
    ' Obtient le nombre de bits de données.
    SecondComma = FirstComma + 2
    DBits$ = Mid$(principal.MSComm1.Settings, SecondComma + 1, 1)
    Select Case Val(DBits$)                 ' Sélectionne le nombre de bits de données.
    Case 7                                  ' Définit le boutton d'option actif du nombre
                                            ' de bits de données.
        configuration.Data7.Value = True
    Case 8
        configuration.Data8.Value = True
    End Select

    ' Obtient le nombre de bits de stop.
    ThirdComma = SecondComma + 2
    SBits$ = Mid$(principal.MSComm1.Settings, ThirdComma + 1, 1)
    Select Case Val(SBits$)                 ' Sélectionne le nombre de bits d'arrêt.
    Case 1                                  ' Définit le bouton d'option actif du nombre
                                            ' de bits d'arrêt.
        configuration.Stop1.Value = True
    Case 2
        configuration.Stop2.Value = True
    End Select
    
End Sub

' Actions du bouton OK.
Private Sub OkButton_Click()
    On Error Resume Next
    
    OldPort = principal.MSComm1.CommPort
    If NewPort <> OldPort Then                  ' Si le numéro du port change, ferme
                                                ' l 'ancien port.
        If principal.MSComm1.PortOpen Then
           principal.MSComm1.PortOpen = False
           ReOpen = True
        End If

        principal.MSComm1.CommPort = NewPort          ' Définit le nouveau numéro du port.

        If Err = 0 Then
           If ReOpen Then
              principal.MSComm1.PortOpen = True
              principal.MOpen.Checked = principal.MSComm1.PortOpen
           End If
        End If
        If Err Then
           MsgBox Error$, 48
           principal.MSComm1.CommPort = OldPort
           Exit Sub
        End If
    End If
    
    principal.MSComm1.Settings = NewBaud$ + "," + NewParity$ + "," + NewData$ + "," + NewStop$
    If Err Then
       MsgBox Error$, 48
       Exit Sub
    End If
    principal.MSComm1.Handshaking = NewShake
    If Err Then
       MsgBox Error$, 48
       Exit Sub
    End If

    Unload configuration                               ' Décharge la feuille de configuration.

End Sub

' Bouton d'option 1 bit de stop.
Private Sub Stop1_Click()
    NewStop$ = "1"
End Sub

' Bouton d'option 2 bits de stop.
Private Sub Stop2_Click()
    NewStop$ = "2"
End Sub
