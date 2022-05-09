VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form panneau 
   Caption         =   "Gestion panneau solaire"
   ClientHeight    =   6315
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   13080
   Icon            =   "panneau.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   14850
   ScaleWidth      =   19080
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   10680
      Top             =   6360
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSCommLib.MSComm MSComm2 
      Left            =   9960
      Top             =   6360
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000018&
      BorderStyle     =   0  'None
      Height          =   255
      Index           =   18
      Left            =   10200
      Locked          =   -1  'True
      TabIndex        =   48
      Text            =   "Période (mn)"
      Top             =   360
      Width           =   975
   End
   Begin VB.Frame Frame9 
      Caption         =   "Général"
      Height          =   3255
      Left            =   10920
      TabIndex        =   47
      Top             =   3000
      Width           =   2055
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   17
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   63
         Text            =   "Période mesure (s)"
         Top             =   2040
         Width           =   1815
      End
      Begin VB.TextBox tmes 
         Height          =   285
         Left            =   480
         TabIndex        =   62
         Text            =   "1"
         Top             =   2400
         Width           =   1095
      End
      Begin VB.CommandButton CcloseCapt 
         Caption         =   "Fermer un fichier de capture"
         Height          =   615
         Left            =   120
         TabIndex        =   60
         Top             =   1320
         Width           =   1815
      End
      Begin VB.CommandButton COpenCapt 
         Caption         =   "Ouvrir un fichier de capture"
         Height          =   615
         Left            =   120
         TabIndex        =   59
         Top             =   720
         Width           =   1815
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Configuration port série"
         Height          =   495
         Left            =   120
         TabIndex        =   58
         Top             =   240
         Width           =   1815
      End
      Begin VB.PictureBox cmes 
         Height          =   375
         Left            =   240
         ScaleHeight     =   315
         ScaleWidth      =   1515
         TabIndex        =   61
         Top             =   2760
         Width           =   1575
      End
   End
   Begin VB.Frame Frame8 
      Caption         =   "Correction"
      Height          =   2775
      Left            =   10080
      TabIndex        =   46
      Top             =   120
      Width           =   2655
      Begin VB.CommandButton C_mancor 
         Caption         =   "Correction manuelle"
         Height          =   495
         Left            =   240
         TabIndex        =   54
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   19
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   53
         Text            =   "Seuil luminosité"
         Top             =   1080
         Width           =   1095
      End
      Begin VB.TextBox t_secor 
         Height          =   285
         Left            =   1320
         TabIndex        =   52
         Text            =   "5"
         Top             =   1080
         Width           =   1095
      End
      Begin VB.PictureBox c_barpercor 
         Height          =   375
         Left            =   240
         ScaleHeight     =   315
         ScaleWidth      =   2115
         TabIndex        =   51
         Top             =   600
         Width           =   2175
      End
      Begin VB.CommandButton C_autcor 
         Caption         =   "Automatique ON"
         Height          =   495
         Left            =   1440
         TabIndex        =   50
         Top             =   2040
         Width           =   1095
      End
      Begin VB.TextBox t_percor 
         Height          =   285
         Left            =   1320
         TabIndex        =   49
         Text            =   "1"
         Top             =   240
         Width           =   1095
      End
      Begin VB.PictureBox c_barsecor 
         Height          =   375
         Left            =   240
         ScaleHeight     =   315
         ScaleWidth      =   2115
         TabIndex        =   57
         Top             =   1560
         Width           =   2175
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Module energie"
      Height          =   3255
      Left            =   120
      TabIndex        =   22
      Top             =   3000
      Width           =   5535
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   16
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   43
         Text            =   "Vide"
         Top             =   1200
         Width           =   615
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   15
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   42
         Text            =   "Pleine"
         Top             =   720
         Width           =   615
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   11
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   31
         Text            =   "Charge"
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox en_is 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   3000
         TabIndex        =   30
         Top             =   600
         Width           =   855
      End
      Begin VB.TextBox en_ie 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   2040
         TabIndex        =   29
         Top             =   600
         Width           =   855
      End
      Begin VB.TextBox en_vs 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   1080
         TabIndex        =   28
         Top             =   600
         Width           =   855
      End
      Begin VB.TextBox en_ve 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   120
         TabIndex        =   27
         Top             =   600
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   10
         Left            =   3000
         Locked          =   -1  'True
         TabIndex        =   26
         Text            =   "I batterie"
         Top             =   240
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   9
         Left            =   2040
         Locked          =   -1  'True
         TabIndex        =   25
         Text            =   "I panneau"
         Top             =   240
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   8
         Left            =   1080
         Locked          =   -1  'True
         TabIndex        =   24
         Text            =   "V batterie"
         Top             =   240
         Width           =   855
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   7
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   23
         Text            =   "V panneau"
         Top             =   240
         Width           =   855
      End
      Begin VB.PictureBox bar_ve 
         ForeColor       =   &H00FF0000&
         Height          =   2175
         Left            =   360
         ScaleHeight     =   2115
         ScaleWidth      =   315
         TabIndex        =   32
         Top             =   960
         Width           =   375
      End
      Begin VB.PictureBox bar_vs 
         ForeColor       =   &H00FF0000&
         Height          =   2175
         Left            =   1320
         ScaleHeight     =   2115
         ScaleWidth      =   315
         TabIndex        =   33
         Top             =   960
         Width           =   375
      End
      Begin VB.PictureBox bar_ie 
         ForeColor       =   &H00FF0000&
         Height          =   2175
         Left            =   2280
         ScaleHeight     =   2115
         ScaleWidth      =   315
         TabIndex        =   34
         Top             =   960
         Width           =   375
      End
      Begin VB.PictureBox bar_is 
         ForeColor       =   &H00FF0000&
         Height          =   2175
         Left            =   3240
         ScaleHeight     =   2115
         ScaleWidth      =   315
         TabIndex        =   35
         Top             =   960
         Width           =   375
      End
      Begin VB.Image chvert 
         Height          =   330
         Left            =   4920
         Picture         =   "panneau.frx":030A
         Top             =   240
         Visible         =   0   'False
         Width           =   360
      End
      Begin VB.Image vivert 
         Height          =   330
         Left            =   4920
         Picture         =   "panneau.frx":0494
         Top             =   1200
         Visible         =   0   'False
         Width           =   360
      End
      Begin VB.Image plvert 
         Height          =   330
         Left            =   4920
         Picture         =   "panneau.frx":061E
         Top             =   720
         Visible         =   0   'False
         Width           =   360
      End
      Begin VB.Image virouge 
         Height          =   330
         Left            =   4800
         Picture         =   "panneau.frx":07A8
         Top             =   1200
         Width           =   360
      End
      Begin VB.Image plrouge 
         Height          =   330
         Left            =   4800
         Picture         =   "panneau.frx":0932
         Top             =   720
         Width           =   360
      End
      Begin VB.Image Image8 
         Height          =   1485
         Left            =   3840
         Picture         =   "panneau.frx":0ABC
         Top             =   1680
         Width           =   1500
      End
      Begin VB.Image chrouge 
         Height          =   330
         Left            =   4800
         Picture         =   "panneau.frx":19F3
         Top             =   240
         Width           =   360
      End
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   240
      Top             =   2280
   End
   Begin VB.Frame eclairage 
      Caption         =   "Module éclairage"
      Height          =   2775
      Left            =   6600
      TabIndex        =   0
      Top             =   120
      Width           =   3375
      Begin VB.CommandButton c_b2 
         Caption         =   "B2 on"
         Height          =   495
         Left            =   720
         TabIndex        =   67
         Top             =   240
         Width           =   615
      End
      Begin VB.CommandButton c_b4 
         Caption         =   "B4 on"
         Height          =   495
         Left            =   1920
         TabIndex        =   66
         Top             =   240
         Width           =   615
      End
      Begin VB.CommandButton c_b3 
         Caption         =   "B3 on"
         Height          =   495
         Left            =   1320
         TabIndex        =   65
         Top             =   240
         Width           =   615
      End
      Begin VB.CommandButton c_b1 
         Caption         =   "B1 on"
         Height          =   495
         Left            =   120
         TabIndex        =   64
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox t2_ecl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Left            =   360
         Locked          =   -1  'True
         TabIndex        =   56
         Text            =   "Niveau d'éclairage"
         Top             =   2040
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.TextBox t_ecl 
         Alignment       =   2  'Center
         Enabled         =   0   'False
         Height          =   285
         Left            =   2520
         TabIndex        =   55
         Text            =   "0%"
         Top             =   2400
         Width           =   735
      End
      Begin VB.PictureBox bar_ecl 
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   120
         ScaleHeight     =   195
         ScaleWidth      =   2235
         TabIndex        =   3
         Top             =   2400
         Visible         =   0   'False
         Width           =   2295
      End
      Begin VB.PictureBox c_bar 
         Height          =   495
         Left            =   120
         ScaleHeight     =   435
         ScaleWidth      =   2235
         TabIndex        =   2
         Top             =   1440
         Visible         =   0   'False
         Width           =   2295
      End
      Begin VB.CommandButton c_ecl 
         Caption         =   "Matrice on"
         Height          =   495
         Left            =   2520
         TabIndex        =   1
         Top             =   240
         Width           =   735
      End
      Begin VB.Image ecl_b4 
         Height          =   330
         Left            =   2040
         Picture         =   "panneau.frx":1B7D
         Top             =   960
         Visible         =   0   'False
         Width           =   360
      End
      Begin VB.Image ecl_b3 
         Height          =   330
         Left            =   1440
         Picture         =   "panneau.frx":1D07
         Top             =   960
         Visible         =   0   'False
         Width           =   360
      End
      Begin VB.Image ecl_b2 
         Height          =   330
         Left            =   840
         Picture         =   "panneau.frx":1E91
         Top             =   960
         Visible         =   0   'False
         Width           =   360
      End
      Begin VB.Image ecl_b1 
         Height          =   330
         Left            =   240
         Picture         =   "panneau.frx":201B
         Top             =   960
         Visible         =   0   'False
         Width           =   360
      End
      Begin VB.Image Image10 
         Height          =   690
         Left            =   2520
         Picture         =   "panneau.frx":21A5
         Top             =   1560
         Width           =   690
      End
      Begin VB.Image ecl_m 
         Height          =   330
         Left            =   2760
         Picture         =   "panneau.frx":3B0F
         Top             =   960
         Visible         =   0   'False
         Width           =   360
      End
   End
   Begin VB.PictureBox MSComm1 
      Height          =   480
      Left            =   240
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   77
      Top             =   480
      Width           =   1200
   End
   Begin VB.PictureBox bar_el 
      ForeColor       =   &H00FF0000&
      Height          =   255
      Left            =   3600
      ScaleHeight     =   195
      ScaleWidth      =   1155
      TabIndex        =   20
      Top             =   2160
      Width           =   1215
   End
   Begin VB.Frame Frame1 
      Caption         =   "Module luminosité"
      Height          =   2775
      Left            =   120
      TabIndex        =   4
      Top             =   120
      Width           =   6375
      Begin VB.PictureBox OpenCapt 
         Height          =   480
         Left            =   2640
         ScaleHeight     =   420
         ScaleWidth      =   1140
         TabIndex        =   78
         Top             =   2040
         Width           =   1200
      End
      Begin VB.TextBox lum_nord 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   1680
         TabIndex        =   12
         Top             =   600
         Width           =   375
      End
      Begin VB.TextBox lum_ouest 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   840
         TabIndex        =   11
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   6
         Left            =   3480
         Locked          =   -1  'True
         TabIndex        =   18
         Text            =   "Ecart élévation"
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   5
         Left            =   4920
         Locked          =   -1  'True
         TabIndex        =   17
         Text            =   "Ecart azimut"
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox lum_ece 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   3600
         TabIndex        =   16
         Top             =   1680
         Width           =   975
      End
      Begin VB.TextBox lum_eca 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   5040
         TabIndex        =   15
         Top             =   1680
         Width           =   975
      End
      Begin VB.TextBox lum_m 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   4320
         TabIndex        =   14
         Top             =   600
         Width           =   975
      End
      Begin VB.TextBox lum_sud 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   1680
         TabIndex        =   13
         Top             =   2040
         Width           =   375
      End
      Begin VB.TextBox lum_est 
         Alignment       =   2  'Center
         Height          =   285
         Left            =   2400
         TabIndex        =   10
         Top             =   1320
         Width           =   375
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   4
         Left            =   4080
         Locked          =   -1  'True
         TabIndex        =   9
         Text            =   "Luminosité Moyenne"
         Top             =   240
         Width           =   1455
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   3
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   8
         Text            =   "Sud"
         Top             =   2400
         Width           =   615
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   2
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   7
         Text            =   "Nord"
         Top             =   240
         Width           =   615
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   1
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   6
         Text            =   "Ouest"
         Top             =   1320
         Width           =   615
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   0
         Left            =   2880
         Locked          =   -1  'True
         TabIndex        =   5
         Text            =   "Est"
         Top             =   1320
         Width           =   495
      End
      Begin VB.PictureBox bar_lum 
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   3480
         ScaleHeight     =   195
         ScaleWidth      =   2715
         TabIndex        =   19
         Top             =   960
         Width           =   2775
      End
      Begin VB.PictureBox bar_az 
         ForeColor       =   &H00FF0000&
         Height          =   255
         Left            =   4920
         ScaleHeight     =   195
         ScaleWidth      =   1155
         TabIndex        =   21
         Top             =   2040
         Width           =   1215
      End
      Begin VB.Image Image3 
         Height          =   1020
         Left            =   1320
         Picture         =   "panneau.frx":3C99
         Top             =   960
         Width           =   1020
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Module moteurs"
      Height          =   3255
      Left            =   5760
      TabIndex        =   36
      Top             =   3000
      Width           =   5055
      Begin VB.CommandButton C_parking 
         Caption         =   "Parking"
         Height          =   495
         Left            =   3240
         TabIndex        =   68
         Top             =   2400
         Width           =   855
      End
      Begin VB.PictureBox t_bar 
         Height          =   555
         Left            =   120
         ScaleHeight     =   495
         ScaleWidth      =   1515
         TabIndex        =   45
         Top             =   600
         Width           =   1575
      End
      Begin VB.TextBox mot_ie 
         Height          =   375
         Left            =   1800
         TabIndex        =   44
         Top             =   2040
         Width           =   735
      End
      Begin VB.TextBox Text_mot 
         Height          =   285
         Left            =   1200
         TabIndex        =   41
         Text            =   "1"
         Top             =   240
         Width           =   495
      End
      Begin VB.Frame Frame6 
         Caption         =   "Déplacement"
         Height          =   1455
         Left            =   1800
         TabIndex        =   40
         Top             =   240
         Width           =   1335
         Begin VB.Label butee 
            Alignment       =   2  'Center
            Caption         =   "butee"
            Height          =   255
            Left            =   120
            TabIndex        =   70
            Top             =   720
            Width           =   1095
         End
         Begin VB.Label onm 
            Alignment       =   2  'Center
            Caption         =   "on"
            Height          =   255
            Left            =   120
            TabIndex        =   69
            Top             =   360
            Width           =   1095
         End
      End
      Begin VB.TextBox Text1 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H80000018&
         BorderStyle     =   0  'None
         Height          =   255
         Index           =   12
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   38
         Text            =   "Temps en s"
         Top             =   240
         Width           =   975
      End
      Begin VB.Frame Frame5 
         Caption         =   "Commande manuelle"
         Height          =   1935
         Left            =   3240
         TabIndex        =   37
         Top             =   240
         Width           =   1695
         Begin VB.Image mot_s 
            Height          =   480
            Left            =   600
            Picture         =   "panneau.frx":4391
            Top             =   1320
            Width           =   480
         End
         Begin VB.Image mot_o 
            Height          =   480
            Left            =   120
            Picture         =   "panneau.frx":479E
            Top             =   840
            Width           =   480
         End
         Begin VB.Image mot_e 
            Height          =   480
            Left            =   1080
            Picture         =   "panneau.frx":4BB7
            Top             =   840
            Width           =   480
         End
         Begin VB.Image mot_n 
            Height          =   480
            Left            =   600
            Picture         =   "panneau.frx":4FCA
            Top             =   360
            Width           =   480
         End
      End
      Begin VB.PictureBox bar_t 
         ForeColor       =   &H00FF0000&
         Height          =   375
         Left            =   240
         ScaleHeight     =   315
         ScaleWidth      =   1275
         TabIndex        =   39
         Top             =   1200
         Width           =   1335
      End
      Begin VB.Frame Frame7 
         Caption         =   "Angles                        Intensité"
         Height          =   1335
         Left            =   120
         TabIndex        =   71
         Top             =   1800
         Width           =   3015
         Begin VB.TextBox Text1 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            BorderStyle     =   0  'None
            Height          =   255
            Index           =   13
            Left            =   840
            Locked          =   -1  'True
            TabIndex        =   76
            Text            =   "Azimut"
            Top             =   960
            Width           =   735
         End
         Begin VB.TextBox Text1 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H80000018&
            BorderStyle     =   0  'None
            Height          =   255
            Index           =   14
            Left            =   840
            Locked          =   -1  'True
            TabIndex        =   75
            Text            =   "Elévation"
            Top             =   360
            Width           =   735
         End
         Begin VB.TextBox mot_ia 
            Height          =   375
            Left            =   1680
            TabIndex        =   74
            Top             =   840
            Width           =   735
         End
         Begin VB.TextBox ang_elev 
            Height          =   375
            Left            =   120
            TabIndex        =   73
            Top             =   840
            Width           =   615
         End
         Begin VB.TextBox ang_azim 
            Height          =   375
            Left            =   120
            TabIndex        =   72
            Top             =   240
            Width           =   615
         End
         Begin VB.Image ovla 
            Height          =   480
            Left            =   2400
            Picture         =   "panneau.frx":53D4
            Top             =   720
            Width           =   480
         End
         Begin VB.Image ovle 
            Height          =   480
            Left            =   2400
            Picture         =   "panneau.frx":5816
            Top             =   120
            Width           =   480
         End
      End
      Begin VB.Image Image13 
         Height          =   600
         Left            =   4200
         Picture         =   "panneau.frx":5C58
         Top             =   2400
         Width           =   765
      End
   End
End
Attribute VB_Name = "panneau"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'-------------------------------------------------------
' Gestion du panneau solaire
'
' Copyright (c) 2005, MAT Software, Inc.
' par Niedercorn Jean-Claude et Maufey Fabrice.
'-------------------------------------------------------
Dim txdata As String
Dim txcode
Dim rxdata As String
Dim rxcode
Dim cor_manu
Dim cor_auto
Dim tick
Dim command
Dim captFile            ' Descripteur du fichier de capture ouvert.
Dim OpenFlag
Dim tickmes
Dim first

'module éclairage bloc 1: emission de commande de mise en marche
Private Sub c_b1_Click()
    On Error Resume Next
    command = 1
    ecl_b1.Visible = False
    ecl_b2.Visible = False
    ecl_b3.Visible = False
    ecl_b4.Visible = False
    ecl_m.Visible = False

    If c_b1.Caption = "B1 on" Then
            c_b1.Caption = "B1 off"
            c_b2.Caption = "B2 on"
            c_b3.Caption = "B3 on"
            c_b4.Caption = "B4 on"
            c_ecl.Caption = "Matrice on"
            ecl_b1.Visible = True
    Else
            c_b1.Caption = "B1 on"
    End If
    txcode = "E"                            'code E pour commandes éclairage
    If c_b1.Caption = "B1 on" Then
        txdata = Format(Str(0), "00")
    Else
        txdata = Format(Str(2), "00")
    End If
    txdata = txdata + Format(Str(c_bar.Value), "00")
    tx
End Sub
'module éclairage bloc 2: emission de commande de mise en marche
Private Sub c_b2_Click()
    On Error Resume Next
    command = 1
    ecl_b1.Visible = False
    ecl_b2.Visible = False
    ecl_b3.Visible = False
    ecl_b4.Visible = False
    ecl_m.Visible = False

    If c_b2.Caption = "B2 on" Then
            c_b1.Caption = "B1 on"
            c_b2.Caption = "B2 off"
            c_b3.Caption = "B3 on"
            c_b4.Caption = "B4 on"
            c_ecl.Caption = "Matrice on"
            ecl_b2.Visible = True
    Else
            c_b2.Caption = "B2 on"
    End If
    txcode = "E"                            'code E pour commandes éclairage
    If c_b2.Caption = "B2 on" Then
        txdata = Format(Str(0), "00")
    Else
        txdata = Format(Str(3), "00")
    End If
    txdata = txdata + Format(Str(c_bar.Value), "00")
    tx
End Sub
'module éclairage bloc 3: emission de commande de mise en marche
Private Sub c_b3_Click()
    On Error Resume Next
    command = 1
    ecl_b1.Visible = False
    ecl_b2.Visible = False
    ecl_b3.Visible = False
    ecl_b4.Visible = False
    ecl_m.Visible = False

    If c_b3.Caption = "B3 on" Then
            c_b1.Caption = "B1 on"
            c_b2.Caption = "B2 on"
            c_b3.Caption = "B3 off"
            c_b4.Caption = "B4 on"
            c_ecl.Caption = "Matrice on"
            ecl_b3.Visible = True
    Else
            c_b3.Caption = "B3 on"
    End If
    txcode = "E"                            'code E pour commandes éclairage
    If c_b3.Caption = "B3 on" Then
        txdata = Format(Str(0), "00")
    Else
        txdata = Format(Str(4), "00")
    End If
    txdata = txdata + Format(Str(c_bar.Value), "00")
    tx
End Sub
'module éclairage bloc 4: emission de commande de mise en marche
Private Sub c_b4_Click()
    On Error Resume Next
    command = 1
    ecl_b1.Visible = False
    ecl_b2.Visible = False
    ecl_b3.Visible = False
    ecl_b4.Visible = False
    ecl_m.Visible = False

    If c_b4.Caption = "B4 on" Then
            c_b1.Caption = "B1 on"
            c_b2.Caption = "B2 on"
            c_b3.Caption = "B3 on"
            c_b4.Caption = "B4 off"
            c_ecl.Caption = "Matrice on"
            ecl_b4.Visible = True
    Else
            c_b4.Caption = "B4 on"
    End If
    txcode = "E"                            'code E pour commandes éclairage
    If c_b4.Caption = "B4 on" Then
        txdata = Format(Str(0), "00")
    Else
        txdata = Format(Str(5), "00")
    End If
    txdata = txdata + Format(Str(c_bar.Value), "00")
    tx
End Sub

Private Sub C_parking_Click()
On Error Resume Next
    command = 1
    txcode = "J"                        'code J pour commandes moteur élévation
    txdata = "00001"
    tx
End Sub

'local : commande de niveau entre 0 et 15 pour eclairage
Private Sub cmes_Click()
    On Error Resume Next
    tmes = cmes.Value
End Sub

'local : commande temps de commande moteur pour commande manuelle
Private Sub t_bar_Click()
    bar_t.Value = t_bar.Value
    Text_mot = Format(t_bar.Value)
End Sub
'appel de la page de configuration serie
Private Sub Command1_Click()
 configuration.Show
End Sub
'timer d'interogation automatique pour obtenir des mesures
Private Sub Timer1_Timer()
    tickmes = tickmes + 1
    If command = 0 Then
        tick = tick + 1
    End If
    If tick = 15 Then
        If MSComm1.PortOpen = False Then
            MSComm1.PortOpen = True
        End If
        MSComm1.Output = "R"                'code R pour infos
        MSComm1.Output = Chr$(13)
    End If
    If tick >= 15 Then
        tick = 0
    End If
End Sub
' fonction d'envoie de messages vers la liaison serie
Private Static Sub tx()
    On Error Resume Next
    If MSComm1.PortOpen = False Then
        MSComm1.PortOpen = True
    End If
    MSComm1.Output = txcode     'code du message
    MSComm1.Output = txdata     'data du message
    MSComm1.Output = Chr$(13)   'code de fin de trame
    command = 0
End Sub
'module éclairage : emission de commande de niveau entre 0 et 15
Private Sub c_bar_Click()
    On Error Resume Next
    command = 1
    bar_ecl.Value = c_bar.Value
    t_ecl = Format((c_bar.Value / 15), "###%")
    If t_ecl.Text = "%" Then
        t_ecl.Text = "0%"
    End If
    txcode = "E"                            'code E pour commandes éclairage
    If c_ecl.Caption = "Matrice on" Then
        txdata = Format(Str(0), "00")
    Else
        txdata = Format(Str(1), "00")
    End If
    txdata = txdata + Format(Str(c_bar.Value), "00")
    tx
End Sub
'module éclairage : emission de commande de mise en marche
Private Sub c_ecl_Click()
    On Error Resume Next
    command = 1
    ecl_b1.Visible = False
    ecl_b2.Visible = False
    ecl_b3.Visible = False
    ecl_b4.Visible = False
    ecl_m.Visible = False

    If c_ecl.Caption = "Matrice on" Then
            c_ecl.Caption = "Matrice off"
            ecl_m.Visible = True
            c_bar.Visible = True
            bar_ecl.Visible = True
            t_ecl.Visible = True
    Else
            c_ecl.Caption = "Matrice on"
            c_bar.Visible = False
            bar_ecl.Visible = False
            t_ecl.Visible = False
    End If
    txcode = "E"                            'code E pour commandes éclairage
    If c_ecl.Caption = "Matrice on" Then
        txdata = Format(Str(0), "00")
    Else
        txdata = Format(Str(1), "00")
    End If
    txdata = txdata + Format(Str(c_bar.Value), "00")
    tx
End Sub
'module controle : emission de commande de passage en correction automatique
Private Sub C_autcor_Click()
    command = 1
    cor_manu = 0
    If cor_auto = 1 Then
        cor_auto = 0
        C_autcor.Caption = "Automatique ON"
    Else
        cor_auto = 1
        C_autcor.Caption = "Automatique OFF"
    End If
    send_correction
End Sub
'module controle : emission de commande de modification periode correction
Private Sub c_barpercor_Click()
    command = 1
    t_percor.Text = Format(c_barpercor.Value)
    send_correction
End Sub
'module controle : emission de commande de modification seuil correction
Private Sub c_barsecor_Click()
    command = 1
    t_secor.Text = Format(c_barsecor.Value)
    send_correction
End Sub
'module controle : emission de commande de passage en correction manuelle
Private Sub C_mancor_Click()
    command = 1
    cor_manu = 1
    send_correction
    cor_manu = 0
End Sub
' emission des messages pour la correction
Private Static Sub send_correction()
    On Error Resume Next
    txcode = "L"                        'code L pour commandes correction
    If cor_auto = 1 Then
        txdata = Format(Str(2), "00")
    End If
    If cor_auto = 0 Then
        txdata = Format(Str(0), "00")
    End If
    If cor_manu = 1 Then
        txdata = Format(Str(1), "00")
    End If
    txdata = txdata + Format(Str(c_barsecor.Value), "00")
    txdata = txdata + Format(Str(c_barpercor.Value), "00")
    tx
End Sub
'module moteur : emission de commande moteur elevation sud
Private Sub mot_s_Click()
    On Error Resume Next
    command = 1
    txcode = "J"                        'code J pour commandes moteur élévation
    txdata = Format(Str(2), "00")
    txdata = txdata + Format(Str(t_bar.Value), "00")
    txdata = txdata + "0"
    tx
End Sub
'module moteur : emission de commande moteur elevation nord
Private Sub mot_n_Click()
    On Error Resume Next
    command = 1
    txcode = "J"                        'code J pour commandes moteur élévation
    txdata = Format(Str(1), "00")
    txdata = txdata + Format(Str(t_bar.Value), "00")
    txdata = txdata + "0"
    tx
End Sub
'module moteur : emission de commande moteur azimut est
Private Sub mot_e_Click()
    command = 1
    txcode = "K"                        'code K pour commandes moteur azimut
    txdata = Format(Str(1), "00")
    txdata = txdata + Format(Str(t_bar.Value), "00")
    txdata = txdata + "0"
    tx
End Sub
'module moteur : emission de commande moteur azimut ouest
Private Sub mot_o_Click()
    command = 1
    txcode = "K"                        'code K pour commandes moteur azimut
    txdata = Format(Str(2), "00")
    txdata = txdata + Format(Str(t_bar.Value), "00")
    txdata = txdata + "0"
    tx
End Sub
' L'événement OnComm est utilisé pour capturer des événements de communications.
Private Static Sub MSComm1_OnComm()
    Dim a, i
    ' Sélectionne en fonction de la propriété CommEvent si un message est reçu
    If ((MSComm1.CommEvent = 2) And (command = 0)) Then
            rxdata = rxdata + (MSComm1.Input)
            'on attend le code de fin de trame pour appeler gestrx
            If (InStr(rxdata, "0D")) Then
                gestrx
            End If
    End If
End Sub
' identification des messages reçus depuis la liaison serie
Private Static Sub gestrx()
    On Error Resume Next
    Dim code
    'test du code reçu
    code = Mid(rxdata, 1, 2)
    If code = "FA" Then  'réception de données
        gesdata
    End If
    rxdata = ""
End Sub
' reception de messages du module de controle
Private Static Sub gesdata()
    On Error Resume Next
    Dim a
        If ((tickmes >= ((cmes.Value) * 10) Or first)) Then
            putfich (Chr(13) + Chr(10))
            putfich (Time)
        End If
        gestlum (3)
        gesten (26)
        gestec (44)
        gescor (70)
        gesmot (50)
        If tickmes >= ((cmes.Value) * 10) Then
            tickmes = 0
        End If
        first = 0
End Sub
Private Static Sub putfich(dta$)
    ' Mémorise les données dans le fichier  de capture si c'est requit.
    If ((tickmes >= ((cmes.Value) * 10) Or first)) Then
        If captFile Then
            i = 2
            Do
                Err = 0
                Put captFile, , dta$
                If Err Then
                    i = MsgBox(Error$, 21)
                    If i = 2 Then
                        CcloseCapt_Click
                    End If
                End If
            Loop While i <> 2
        End If
     End If
End Sub
' reception de messages du module correction
Private Static Sub gescor(Index)
    On Error Resume Next
    Dim a
        a = Mid(rxdata, Index, 2)
        If (a = "01") Then
            cor_auto = 1
            C_autcor.Caption = "Automatique OFF"
            putfich (" oui ")
        End If
        If (a = "00") Then
            cor_auto = 0
            C_autcor.Caption = "Automatique ON"
            putfich (" non ")
        End If
        t_percor.Text = LTrim(Mid(rxdata, Index + 2, 3))
        t_secor.Text = LTrim(Mid(rxdata, Index + 5, 3))
        putfich (Mid((" " + t_percor.Text + "    "), 1, 5))
        putfich (Mid((" " + t_secor.Text + "    "), 1, 5))
        c_barpercor.Value = Val(t_percor.Text)
        c_barsecor.Value = Val(t_secor.Text)
End Sub
' réception de messages du module luminosité
Private Static Sub gestlum(Index)
    On Error Resume Next
    Dim a
        lum_est.Text = LTrim(Mid(rxdata, Index, 3))
        lum_ouest.Text = LTrim(Mid(rxdata, Index + 3, 3))
        lum_nord.Text = LTrim(Mid(rxdata, Index + 6, 3))
        lum_sud.Text = LTrim(Mid(rxdata, Index + 9, 3))
        lum_m.Text = LTrim(Mid(rxdata, Index + 12, 3))
        lum_eca.Text = LTrim(Mid(rxdata, Index + 15, 3))
        lum_ece.Text = LTrim(Mid(rxdata, Index + 18, 3))
        putfich (Mid((" " + lum_est.Text + "    "), 1, 5))
        putfich (Mid((" " + lum_ouest.Text + "    "), 1, 5))
        putfich (Mid((" " + lum_nord.Text + "    "), 1, 5))
        putfich (Mid((" " + lum_sud.Text + "    "), 1, 5))
        putfich (Mid((" " + lum_m.Text + "    "), 1, 5))
        putfich (Mid((" " + lum_eca.Text + "    "), 1, 5))
        putfich (Mid((" " + lum_ece.Text + "    "), 1, 5))
        bar_lum.Value = Val(lum_m.Text)
        bar_el.Value = Val(lum_ece.Text)
        bar_az.Value = Val(lum_eca.Text)
End Sub
' réception de messages du module énergie
Private Static Sub gesten(Index)
    On Error Resume Next
    Dim a
        bar_ie.Value = (Val(LTrim(Mid(rxdata, Index + 6, 3))))
        bar_is.Value = (Val(LTrim(Mid(rxdata, Index + 9, 3))))
        en_ve.Text = LTrim(Mid(rxdata, Index, 2)) + "." + LTrim(Mid(rxdata, Index + 2, 1))
        en_vs.Text = LTrim(Mid(rxdata, Index + 3, 2)) + "." + LTrim(Mid(rxdata, Index + 5, 1))
        en_ie.Text = bar_ie.Value * 10
        en_is.Text = bar_is.Value * 10
        putfich (Mid((" " + en_ve.Text + "    "), 1, 5))
        putfich (Mid((" " + en_vs.Text + "    "), 1, 5))
        putfich (Mid((" " + en_ie.Text + "    "), 1, 5))
        putfich (Mid((" " + en_is.Text + "    "), 1, 5))
        bar_ve.Value = Val(LTrim(Mid(rxdata, Index, 3)))
        bar_vs.Value = Val(LTrim(Mid(rxdata, Index + 3, 3)))
        a = Mid(rxdata, Index + 12, 2)
        If (a = "00") Then
            chvert.Visible = 0
            chrouge.Visible = 1
        Else
            chvert.Visible = 1
            chrouge.Visible = 0
        End If
        a = Mid(rxdata, Index + 14, 2)
        If (a = "00") Then
            plvert.Visible = 0
            plrouge.Visible = 1
        Else
            plvert.Visible = 1
            plrouge.Visible = 0
        End If
        a = Mid(rxdata, Index + 16, 2)
        If (a = "00") Then
            vivert.Visible = 0
            virouge.Visible = 1
        Else
            vivert.Visible = 1
            virouge.Visible = 0
        End If
End Sub
' réception de messages du module éclairage
Private Static Sub gestec(Index)
    On Error Resume Next
    Dim a
        bar_ecl.Value = Val(LTrim(Mid(rxdata, Index + 3, 3)))
        c_bar.Value = bar_ecl.Value
        t_ecl.Text = Format((c_bar.Value / 15), "###%")
        If t_ecl.Text = "%" Then
            t_ecl.Text = "0%"
        End If

        If Val(LTrim(Mid(rxdata, Index, 3))) = "  1" Then
            c_ecl.Caption = "Matrice off"
            c_bar.Visible = True
            bar_ecl.Visible = True
            t_ecl.Visible = True
            ecl_m.Visible = True
            t2_ecl.Visible = True
            putfich (Mid((" " + t_ecl.Text + "    "), 1, 5))
        Else
            c_ecl.Caption = "Matrice on"
            c_bar.Visible = False
            bar_ecl.Visible = False
            ecl_m.Visible = False
            t_ecl.Visible = False
            t2_ecl.Visible = False
            putfich (Mid(("     "), 1, 5))
        End If
End Sub
' reception de messages du module moteur
Private Static Sub gesmot(Index)
    On Error Resume Next
    Dim a
    mot_ie.Text = LTrim(Mid(rxdata, Index, 3)) + "0"
    mot_ia.Text = LTrim(Mid(rxdata, Index + 3, 3)) + "0"
    a = Mid(rxdata, Index + 6, 2)
        If (a = "01") Then
            ovle.Visible = True
        Else
            ovle.Visible = False
        End If
    a = Mid(rxdata, Index + 8, 2)
        If (a = "01") Then
            ovla.Visible = True
        Else
            ovla.Visible = False
        End If
    a = Mid(rxdata, Index + 10, 2)
        If (a = "00") Then onm.Caption = ""
        If (a = "01") Then onm.Caption = "montée"
        If (a = "02") Then onm.Caption = "descente"
        If (a = "03") Then onm.Caption = "rot. droite"
        If (a = "04") Then onm.Caption = "rot. gauche"
        If (a = "05") Then onm.Caption = "parking azim."
        If (a = "06") Then onm.Caption = "parking elev."
    ang_elev.Text = LTrim(Mid(rxdata, Index + 12, 3))
    ang_azim.Text = LTrim(Mid(rxdata, Index + 15, 3))
    a = Mid(rxdata, Index + 18, 2)
        If (a = "00") Then butee.Caption = ""
        If (a = "06") Then butee.Caption = "parking"

       putfich (Mid((" " + mot_ie.Text + "    "), 1, 5))
       putfich (Mid((" " + mot_ia.Text + "    "), 1, 5))
End Sub
'fermeture de la page
Private Sub Form_Unload(Cancel As Integer)
    If MSComm1.PortOpen Then
        MSComm1.PortOpen = 0
    End If
        ' Si le fichier de capture est ouvert, le vider et le fermer.
    If captFile Then CcloseCapt_Click
    End
End Sub
'chargement de la page
Private Sub Form_Load()

    On Error Resume Next

    command = 0
    rxdata = ""
    MSComm1.PortOpen = 1
    If (MSComm1.PortOpen = False) Then
        MSComm1.PortOpen = 2
    ElseIf (MSComm1.PortOpen = False) Then
        MSComm1.PortOpen = 3
    ElseIf (MSComm1.PortOpen = False) Then
        MSComm1.PortOpen = 4
    ElseIf (MSComm1.PortOpen = False) Then
        MSComm1.PortOpen = 5
    End If
    

    COpenCapt.Enabled = True
    CcloseCapt.Enabled = False

    
End Sub
Private Sub CcloseCapt_Click()
   ' Ferme le fichier de capture.
   Close captFile
   captFile = 0
   COpenCapt.Enabled = True
   CcloseCapt.Enabled = False
End Sub
Private Sub COpenCapt_Click()
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

   principal.Caption = "Panneau solaire - " + OpenCapt.FileTitle
   COpenCapt.Enabled = False
   CcloseCapt.Enabled = True
   first = 1
   putfich ("Heure    L_e  L_o  L_n  L_s  L_m  Lea  Lee  E_ve E_vs Eie  Eis  Niv  Cor  Per  Seu  Iel  Iaz  Ovle  Ovla Deplacement" + Chr(13) + Chr(10))
End Sub

