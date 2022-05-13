VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "Comdlg32.OCX"
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form principal 
   BackColor       =   &H00C0FFFF&
   Caption         =   "CAN sniffer"
   ClientHeight    =   3495
   ClientLeft      =   1500
   ClientTop       =   3765
   ClientWidth     =   10650
   ForeColor       =   &H00000000&
   Icon            =   "main.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   PaletteMode     =   1  'UseZOrder
   ScaleHeight     =   3495
   ScaleWidth      =   10650
   Begin VB.CommandButton send 
      Caption         =   "Envoie"
      Height          =   375
      Left            =   9600
      TabIndex        =   17
      Top             =   960
      Width           =   735
   End
   Begin VB.Frame Frame2 
      Caption         =   "Envoie de trames"
      Height          =   1815
      Left            =   6240
      TabIndex        =   6
      Top             =   0
      Width           =   4215
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   10
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   23
         Text            =   "ID (hexa)"
         Top             =   960
         Width           =   975
      End
      Begin VB.TextBox IDH 
         Height          =   285
         Left            =   120
         TabIndex        =   22
         Top             =   1320
         Width           =   975
      End
      Begin VB.CheckBox Req 
         Caption         =   "Check1"
         Height          =   255
         Left            =   3600
         TabIndex        =   16
         Top             =   600
         Width           =   255
      End
      Begin VB.TextBox Dasc 
         Height          =   285
         Left            =   1200
         TabIndex        =   15
         Top             =   1320
         Width           =   1095
      End
      Begin VB.TextBox Dhex 
         Height          =   285
         Left            =   1200
         TabIndex        =   14
         Top             =   600
         Width           =   2055
      End
      Begin VB.TextBox Taille 
         Height          =   285
         Left            =   2400
         TabIndex        =   13
         Top             =   1320
         Width           =   855
      End
      Begin VB.TextBox ID 
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "0"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1036
            SubFormatType   =   0
         EndProperty
         Height          =   285
         Left            =   120
         TabIndex        =   12
         Top             =   600
         Width           =   975
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   8
         Left            =   3360
         Locked          =   -1  'True
         TabIndex        =   11
         Text            =   " Request"
         Top             =   240
         Width           =   735
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   4
         Left            =   1200
         Locked          =   -1  'True
         TabIndex        =   10
         Text            =   " Data (ASCII)"
         Top             =   960
         Width           =   1095
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   7
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   9
         Text            =   "ID (decimal)"
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   6
         Left            =   2400
         Locked          =   -1  'True
         TabIndex        =   8
         Text            =   " Taille"
         Top             =   960
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   5
         Left            =   1200
         Locked          =   -1  'True
         TabIndex        =   7
         Text            =   " Data (hexa)"
         Top             =   240
         Width           =   2055
      End
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000018&
      BorderStyle     =   0  'None
      Height          =   255
      Index           =   0
      Left            =   360
      Locked          =   -1  'True
      TabIndex        =   2
      Text            =   " Temps"
      Top             =   240
      Width           =   615
   End
   Begin VB.TextBox Term 
      BorderStyle     =   0  'None
      Height          =   2535
      Left            =   240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   600
      Width           =   4335
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   9360
      Top             =   2880
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      DTREnable       =   -1  'True
      RThreshold      =   1
   End
   Begin MSComDlg.CommonDialog OpenCapt 
      Left            =   9960
      Top             =   2880
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      Color           =   12632256
      DefaultExt      =   "LOG"
      DialogTitle     =   "Ouverture fichier de capture"
      FileName        =   "*.cap"
      Filter          =   "*.cap"
   End
   Begin VB.Frame Frame1 
      Caption         =   "Capture de trames"
      Height          =   3255
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   6135
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   9
         Left            =   4680
         Locked          =   -1  'True
         TabIndex        =   21
         Text            =   "Trames reçues"
         Top             =   1560
         Width           =   1215
      End
      Begin VB.TextBox tcount 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   4920
         TabIndex        =   20
         Text            =   "0"
         ToolTipText     =   "Trames reçues"
         Top             =   1920
         Width           =   735
      End
      Begin VB.CommandButton canac 
         Caption         =   "On"
         Height          =   375
         Left            =   4920
         TabIndex        =   19
         ToolTipText     =   "Gère la capture"
         Top             =   240
         Width           =   735
      End
      Begin VB.CommandButton erase 
         Caption         =   "Efface les Trames"
         Height          =   375
         Left            =   4560
         TabIndex        =   18
         Top             =   1080
         Width           =   1455
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   3
         Left            =   2760
         Locked          =   -1  'True
         TabIndex        =   5
         Text            =   " Data ou Indicateur"
         Top             =   240
         Width           =   1575
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   2
         Left            =   2160
         Locked          =   -1  'True
         TabIndex        =   4
         Text            =   " Taille"
         Top             =   240
         Width           =   495
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   1
         Left            =   1080
         Locked          =   -1  'True
         TabIndex        =   3
         Text            =   " Identifiant"
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.Menu MFile 
      Caption         =   "&Fichier"
      Begin VB.Menu MOpenCapt 
         Caption         =   "&Ouvrir un fichier de capture..."
      End
      Begin VB.Menu MCloseCapt 
         Caption         =   "&Fermer le fichier de capture"
         Enabled         =   0   'False
      End
      Begin VB.Menu MSettings 
         Caption         =   "&Paramètres port série"
      End
      Begin VB.Menu MFileExit 
         Caption         =   "&Quitter"
      End
   End
   Begin VB.Menu MCan 
      Caption         =   "&Bus CAN"
      Begin VB.Menu MOpen 
         Caption         =   "Lancement capture CAN"
      End
   End
End
Attribute VB_Name = "principal"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'-------------------------------------------------------
' Can sniffer - Ceci un programme de gestion du bus can
' Copyright (c) 2004, MAT Software, Inc.
' par Niedercorn Jean-Claude et Maufey Fabrice.
'-------------------------------------------------------
DefInt A-Z
Option Explicit
Dim Ret                 ' Variable de travail sous forme d'entier.
Dim Temp$               ' Variable de travail sous forme de chaîne de caractère.
Dim tcnt
Dim captFile            ' Descripteur du fichier de capture ouvert.
Dim OpenFlag
' bouton d'envoie de trames.
Private Sub send_Click()
    On Error Resume Next
    Dim s1Tmp As String
    Dim s2tmp As String
    Dim i, a
    
    s1Tmp = ""
    s2tmp = ""
    s1Tmp = s1Tmp + "T"
    a = Asc(Len(ID.Text))
    s1Tmp = s1Tmp + Chr(a)
    s1Tmp = s1Tmp + ID.Text
    If Taille.Text = "" Then
        Taille.Text = "0"
    End If
    s1Tmp = s1Tmp + Taille.Text
    s1Tmp = s1Tmp + Hex(Req.Value)
    s1Tmp = s1Tmp + Dhex.Text
    
    For i = 1 To Len(s1Tmp)
        a = Asc(Mid(s1Tmp, i, 1))
        s2tmp = s2tmp + Chr$(Hex(a))
    Next
    
    If MSComm1.PortOpen = False Then
        MSComm1.PortOpen = True
        canac.Caption = "Off"
        OpenFlag = True
    End If
    
    MSComm1.Output = s2tmp
    MSComm1.Output = Chr$(13)
End Sub
Private Sub Form_Load()
    tcnt = 0
    tcount.Text = 0
End Sub
Private Sub Form_Unload(Cancel As Integer)
    If MSComm1.PortOpen Then
        MSComm1.PortOpen = 0
    End If
    ' Si le fichier de capture est ouvert, le vider et le fermer.
    If captFile Then
        McloseCapt_Click
    End If
End Sub
Private Sub McloseCapt_Click()
   ' Ferme le fichier de capture.
   Close captFile
   captFile = 0
   MOpenCapt.Enabled = True
   MCloseCapt.Enabled = False
   principal.Caption = "CAN sniffer"
End Sub
Private Sub MFileExit_Click()
    ' Utilise Form_Unload car il contient du code pour vérifier si il y a des données
    ' non transmises et un fichier de capture ouvert.
    Form_Unload Ret
End Sub
' Bascule l'état du port de communication (ouvert ou fermé).
Private Sub MOpen_Click()
    On Error Resume Next
    
    If MSComm1.PortOpen = False Then
        MSComm1.PortOpen = True
        canac.Caption = "Off"
        OpenFlag = True
    ElseIf MSComm1.PortOpen = True Then
        MSComm1.PortOpen = False
        canac.Caption = "On"
        OpenFlag = False
    End If
    
    If Err Then MsgBox Error$, 48
    
    MOpen.Checked = OpenFlag
End Sub
' Bascule l'état du port de communication (ouvert ou fermé).
Private Sub canac_Click()
    On Error Resume Next
    
    If MSComm1.PortOpen = False Then
        MSComm1.PortOpen = True
        canac.Caption = "Off"
        OpenFlag = True
    ElseIf MSComm1.PortOpen = True Then
        MSComm1.PortOpen = False
        canac.Caption = "On"
        OpenFlag = False
    End If
    
    If Err Then MsgBox Error$, 48
    
    MOpen.Checked = OpenFlag
End Sub
' efface les trames reçues.
Private Sub erase_Click()
    On Error Resume Next
    Term.Text = ""
End Sub
Private Sub MOpenCapt_Click()
   Dim replace
   On Error Resume Next
   
   ' Obtient le nom du fichier de capture de l'utilisateur.
   OpenCapt.DialogTitle = "Ouvrir le fichier de capture des trames"
   OpenCapt.Filter = "Fichiers de capture(*.cap)|*.cap|Tous les fichiers (*.*)|*.*"
   
   Do
      OpenCapt.FileName = ""
      OpenCapt.ShowOpen
      If Err = cdlCancel Then Exit Sub
      Temp$ = OpenCapt.FileName

      ' Si le fichier existe déja, demande si l'utilisateur veut écraser le fichier ou ajouter.
      Ret = Len(Dir$(Temp$))
      If Err Then
         MsgBox Error$, 48
         Exit Sub
      End If
      If Ret Then
         replace = MsgBox("Remplacer le fichier existant - " + Temp$ + "?", 35)
      Else
         replace = 0
      End If
   Loop While replace = 2

   ' L'utilisateur a cliqué sur le bouton Oui, donc supprime le fichier.
   If replace = 6 Then
      Kill Temp$
      If Err Then
         MsgBox Error$, 48
         Exit Sub
      End If
   End If

   ' Ouvre le fichier de capture.
   captFile = FreeFile
   Open Temp$ For Binary Access Write As captFile
   If Err Then
      MsgBox Error$, 48
      Close captFile
      captFile = 0
      Exit Sub
   Else
      ' Va à la fin du fichier ainsi les nouvelles données seront ajoutées.
      Seek captFile, LOF(captFile) + 1
   End If

   principal.Caption = "CAN sniffer - " + OpenCapt.FileTitle
   MOpenCapt.Enabled = False
   MCloseCapt.Enabled = True
End Sub
' L'événement OnComm est utilisé pour capturer des événements de communications.
Private Static Sub MSComm1_OnComm()
    Dim ins$
    Dim ID, FID, t
        
    ' Sélectionne en fonction de la propriété CommEvent.
    Select Case MSComm1.CommEvent
        ' Messages reçus.
        Case vbMSCommEvReceive
            ins$ = (MSComm1.Input)
            ID = InStr(ins$, Chr$(13))
            If (ID <> 0) Then
                tcnt = tcnt + 1
                t = Format(tcnt)
                tcount.Text = t
                Beep
            End If
            ShowData Term, ins$
    End Select
End Sub
Private Sub MSettings_Click()
    ' Affiche la feuille de paramétrage des communications.
    configuration.Show
End Sub
' Cette procédure ajoute des données dans la propriété Text du contrôle Term.
' Ensuite les données sont écrites dans le fichier de capture ouvert.
' La taille de la propriété Text du contrôle Term est également surveillée
' da façon à ne pas éxcéder 16384 caractères.
Private Static Sub ShowData(Term As Control, dta$)
    On Error Resume Next
    Dim nd, i

    ' Vérifie que le texte existant ne devient pas trop grand.
    nd = LenB(Term.Text)
    If nd >= 16384 Then
       Term.Text = Mid$(Term.Text, 4097)
       nd = LenB(Term.Text)
    End If

    ' Pointe à la fin de données de Term.
    Term.SelStart = nd

    ' Ajoute les données filtrées à la propriété Text.
    Term.SelText = dta$

    ' Mémorise les données dans le fichier  de capture si c'est requit.
    If captFile Then
       i = 2
       Do
          Err = 0
          Put captFile, , dta$
          If Err Then
             i = MsgBox(Error$, 21)
             If i = 2 Then
                McloseCapt_Click
             End If
          End If
       Loop While i <> 2
    End If

End Sub
' Si case a cocher request à 1 alors pas de data
Private Sub Req_Click()
    
    If Req.Value Then
       Dasc.Text = ""
       Dhex.Text = ""
       Taille.Text = ""
       Dasc.Visible = False
       Dhex.Visible = False
       Taille.Visible = False
    Else
       Dasc.Visible = True
       Dhex.Visible = True
       Taille.Visible = True
    End If
End Sub
' Gestion du texte de l'identifiant en decimal
Private Sub ID_KeyPress(KeyAscii As Integer)
    Dim i, k, a, d, c
    Dim sTmp As String
    Dim LenId, lendata
    Dim b As String
    
    k = KeyAscii
    If k = 13 Then
        LenId = 8
        ' Filtre/manipule les caractères.
        sTmp = ""
        For i = 1 To LenId
           If i < (Len(ID.Text) + 1) Then
               c = Asc(Mid(ID.Text, i, 1))
               If c > 47 And c < 58 Then
                    sTmp = sTmp + Mid(ID.Text, i, 1)
               End If
            End If
         Next
        ID.Text = b + sTmp
        IDH.Text = Hex(sTmp)
    End If
End Sub
' Gestion du texte de l'identifiant en hexa
Private Sub IDH_KeyPress(KeyAscii As Integer)
    Dim i, j, k
    Dim a
    Dim b
    Dim c As Long
    Dim data(1 To 7) As Long
    
    Dim sTmp As String
    Dim lendata
    
    k = KeyAscii
    If k = 13 Then
        lendata = 15
        ' Filtre/manipule les caractères.
        If (Len(IDH.Text)) < 2 Then
         MsgBox ("Veuillez saisir au moins 2 données !")
         Exit Sub
        End If
        
        If (Len(IDH.Text)) > 6 Then
         MsgBox ("Veuillez saisir 6 caractères maximum (de 000000 à ffffff !")
         Exit Sub
        End If
         
        sTmp = ""
        For i = 1 To 7
            data(i) = 0
        Next
        j = 0
        For i = 1 To (Len(IDH.Text)) Step 2
                a = Asc(Mid(IDH.Text, i, 1))
                If Mid(IDH.Text, i + 1, 1) = "" Then
                    MsgBox ("Veuillez saisir un nombre pair de données !")
                    Exit Sub
                End If
                b = Asc(Mid(IDH.Text, i + 1, 1))
                If a > 47 And a < 58 Then
                    a = a - 48
                ElseIf a > 96 And a < 103 Then
                    a = a - 87
                Else
                    MsgBox ("Veuillez saisir des données entre 0 et f !")
                    Exit Sub
                End If
                If b > 47 And b < 58 Then
                    b = b - 48
                ElseIf b > 96 And b < 103 Then
                    b = b - 87
                Else
                    MsgBox ("Veuillez saisir des données entre 0 et f !")
                    Exit Sub
                End If
                c = a * 16 + b
                data(j + 1) = c
                j = j + 1
        Next
        If j = 1 Then
            c = data(1)
        End If
        If j = 2 Then
            c = data(1) * 256 + data(2)
        End If
        If j = 3 Then
            c = data(1) * 256 * 256 + data(2) * 256 + data(3)
        End If
        If c <> 0 Then
             sTmp = LTrim(Str(c))
        Else
             sTmp = "0"
        End If
        ID.Text = sTmp
        
    End If
End Sub

' Gestion du texte de data hexadecimale
Private Sub Dhex_KeyPress(KeyAscii As Integer)
    Dim i, k
    Dim a
    Dim b
    Dim c
    
    Dim sTmp As String
    Dim lendata
    
    k = KeyAscii
    If k = 13 Then
        lendata = 15
        ' Filtre/manipule les caractères.
        If (Len(Dhex.Text)) < 2 Then
         MsgBox ("Veuillez saisir au moins 2 données !")
         Exit Sub
        End If
        
        If (Len(Dhex.Text)) > 16 Then
         MsgBox ("Veuillez saisir 16 caractères maximum !")
         Exit Sub
        End If
         
        sTmp = ""
        For i = 1 To lendata Step 2
            If i < (Len(Dhex.Text)) Then
                a = Asc(Mid(Dhex.Text, i, 1))
                b = Asc(Mid(Dhex.Text, i + 1, 1))
                If a > 47 And a < 58 Then
                    a = a - 48
                ElseIf a > 96 And a < 103 Then
                    a = a - 87
                Else
                    MsgBox ("Veuillez saisir des données entre 0 et f !")
                    Exit Sub
                End If
                If b > 47 And b < 58 Then
                    b = b - 48
                ElseIf b > 96 And b < 103 Then
                    b = b - 87
                Else
                    MsgBox ("Veuillez saisir des données entre 0 et f !")
                    Exit Sub
                End If
                c = a * 16 + b
                If c <> 0 Then
                    sTmp = sTmp + Chr(c)
                End If
                
            End If
        Next
        Dasc.Text = sTmp
        Taille.Text = Len(Dhex.Text) / 2
    End If
End Sub
' Gestion du texte de data ascii
Private Sub Dasc_KeyPress(KeyAscii As Integer)
    Dim i, k
    Dim a
    Dim b
    Dim c
    
    Dim sTmp As String
    Dim lendata
    
    k = KeyAscii
    If k = 13 Then
        lendata = 8
        ' Filtre/manipule les caractères.
        
        If (Len(Dasc.Text)) > 8 Then
         MsgBox ("Veuillez saisir 8 caractères maximum !")
         Exit Sub
        End If
         
        sTmp = ""
        For i = 1 To lendata
            If i < (Len(Dasc.Text) + 1) Then
                a = Asc(Mid(Dasc.Text, i, 1))
                sTmp = sTmp + Hex(a)
            End If
        Next
        Dhex.Text = sTmp
        Taille.Text = Len(Dhex.Text) / 2
    End If
End Sub
