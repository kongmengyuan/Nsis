; ���û�����ר�ñ��� ���û�����ר�ñ� ��   ����������һ���ո�,���滻��

; �������Ӧ�ı������Ϊ NSIS 2.46.2015.08������ǿ��װ��.exe ,����ΪANSI����(���ʹ��Nsis��Unicode�汾����ᷢ��nsWindows.nsh�Ҳ���). �������ʱʹ���˶�����,�����ʹ��Nsis��Unicode�汾����(���°�װ"NSIS 2.46.Unicode��.exe")
; ѧϰNSIS����ͨ����װ�˵��ġ�NSIS ͼ�Ľ̳̼���������NSIS �ĵ�������NSISDialogDesigner��
/*
	����ϵͳ__________________�汾��
	Windows 10________________6.2     Ĭ�ϰ�װ.Net4.5
	Windows 8	________________6.2     Ĭ�ϰ�װ.Net4.5 (ͬʱҲЯ����.Net3.5,ֻ�ǲ���Ĭ�ϰ�װ)
	Windows 7 ________________6.1     Ĭ�ϰ�װ.Net3.5
	Windows Server 2008 R2____6.1
	Windows Server 2008_______6.0
	Windows Vista_____________6.0
	Windows Server 2003 R2____5.2
	Windows Server 2003_______5.2
	Windows XP X64____________5.2     �ֶ���װ.Net2.0 SP2 64λ
	Windows XP________________5.1     �ֶ���װ.Net2.0��.Net2.0 SP2��.Net3.5,���ܰ�װ.Net4.0
	Windows 2000______________5.0

  .Net Framework 2.0 SP2 32λ ������Ƚϵİ汾Ϊ 2.0.50727  ���� C:\Windows\Microsoft.NET\Framework\v2.0.50727   ԭ��װ�ļ�25��,��װ���ļ�ռ�ÿռ�185��,���رȽϿ�,���ǰ�װ�Ƚϻ�ʱ��
  .Net Framework 2.0 SP2 64λ ������Ƚϵİ汾Ϊ 2.0.50727  ���� C:\Windows\Microsoft.NET\Framework64\v2.0.50727 ԭ��װ�ļ�48.5��,��װ���ļ�ռ�ÿռ�361��,���رȽϿ�,���ǰ�װ�Ƚϻ�ʱ��

  ��װ��������Ҫ��
  1���Ѱ�װ���ļ���д��set.ini��Ȼ��ÿ���������ʱ�Զ��ϱ�,��װ��ɺ�Ҫ��дset.ini ��д�밲װ���ļ���,���Ƕ�ȡ���û���ǰ���ļ�����ɶ����д��ɶ,������֤������ֻ��Ҫ�����ļ���,����ʵ�ֶԲ�ͬ��Դ������ͳ��
  2������4��ͼƬ��banner1.bmp,banner2.bmp,banner3.bmp,banner4.bmp
  3������License�ļ���license.rtf
  4��ɾ��������ļ���ͼ��
  5����װĿ¼ʹ�ù̶�Ӣ��Ŀ¼
  6����װ�����ļ�����ͼ����ַ
  7��"ͬ�����Э��"�Ƿ��ص�(�鿴����ļ���)
  8����װһ��,��������,���ر��ٰ�װ,��ǰ�򿪵�ִ���ļ����Զ��ر�
  9���޸İ�װ���ļ�������ݷ�ʽ����,exe��dllҪǩ��,��װ��Ҫǩ��
  10�������װ��ɺ󣬵������� http://url.huifudashi.com/1/buy/welcome/  Ŀǰ������
	11�����ж��ʱ���������� http://url.huifudashi.com/1/buy/discount/  Ŀǰ������

	12��win8��Win10Ҫ��װ�ڡ�C:\ProgramData��Ŀ¼����,��Ϊ��ʱ���ְ�װ�ڡ�C:\Program Files (x86)��������ʱ�᲻��д��config.ini����ļ�(ֻ���еĿͻ����������)
	
  ��װ�ļ�����б��,����"ע��˴����ļ����Ƶ��޸�"

  �������ݲ��ҡ�������Ϊ��ͬ���ļ�����,�޸Ķ�Ӧ���ļ���
  ----------
  �������Щ����:
  ����ͼ�겻�ñ䣬��������(�����ڡ����������ϵĿ������)�����򶥲�������(������Image,��ʽ��header_01.png ��Ѱ�header_02.png,��Ҫ������ͼ)����װ�����֣���װ����ݷ�ʽ ��Ӧ�仯
  ���û�����ר�ñ� ��   ����������һ���ո�,���滻��
  01��Ѹ��PDFת����           (��������,��Ĭ���Ƿ����)
  02��pdfת����
  03��pdfת����wordת����
  04��wordת����pdfת����
  05��pdfת����jpgת����
  06��jpgת����pdfת����
  07��pdfת����pptת����
  08��pptת����pdfת����

  09��pdfת����txtת����
  10��txtת����pdfת����
  11��pdfת����htmlת����
  12��pdfת����excelת����
  13��excelת����pdfת����

  14��excelת����wordת����
  15��pptת����wordת����
  16��wordת����excelת����
  17��pdf to word converter

  18������PDFת����           (���������,��������Ժú�,Ȼ����������滻��),��"������Ϊ��ͬ���ļ���"һ��һ���滻
  ----------
*/

Var Msg
Var BgImage
Var BannerImage

Var ImageHandle

Var Btn_Agreen
Var Btn_Checkbox
Var Bool_Checkbox
Var Btn_Install
Var Btn_Custom_Install
Var Btn_Close
Var Btn_Browser
Var Btn_Open_Exe
Var Btn_Next_Exe
Var Btn_Close_Exe

Var Lbl_Agree
Var Lbl_Install_Position
Var Lbl_Inatalling
Var Bool_License
Var Txt_License
Var Bool_Custom
Var Txt_Browser
Var PB_ProgressBar
Var Bool_NetFramework

Var Btn_Uninstall
Var Btn_Wrong
Var Bool_Uninstall

Var Install_Exe
Var INSTEDDIR

Var RadioButton1 ; ������ѡ��:��������
Var RadioButton2 ; ������ѡ��:English
Var RadioButton3 ; ������ѡ��:�ձ��Z
Var RadioButton4 ; ������ѡ��:���ķ��w
Var RadioButton_Font ; ������ѡ��:�����С
Var LanguageBgImage ; ������ѡ��: ����ͼƬ
Var LanguageBgImageHandle ; ������ѡ��: ����ͼƬ���

;---------------------------ȫ�ֱ���ű�Ԥ����ĳ���-----------------------------------------------------
; MUI Ԥ���峣��
!define MUI_ABORTWARNING
; ��װͼ���·������
!define MUI_ICON "images\install.ico"
; ж��ͼ���·������
!define MUI_UNICON "images\uninstall.ico"
; ��ƷЭ�����·������
!define MUI_PAGE_LICENSE_RTY "license\license.rtf"
!define PRODUCT_NAME "pdf2word"
!define PRODUCT_VERSION "6.3"
!define PRODUCT_PUBLISHER "�Ϻ�������Ϣ�Ƽ����޹�˾"
!define PRODUCT_WEB_SITE "http://www.huduntech.com"
!define EM_OUTFILE_NAME "${PRODUCT_NAME}.exe"

!define PBM_SETRANGE32 100

!define wxRexoverMutex_Install     "pdf2wordMutex_Install"
!define wxRexoverMutex_UnInstall   "pdf2wordMutex_UnInstall"
;---------------------------�������ѹ�����ͣ�Ҳ����ͨ���������ű����ƣ�------------------------------------
SetCompressor lzma
SetCompress force
XPStyle on
RequestExecutionLevel admin ;��ȡ����ԱȨ��.  none|user|highest|admin , none��admin��Ȩ�޲��,����F1����鵽��ؽ���
; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI2.nsh"
!include "WinCore.nsh"
; �����ļ�����ͷ�ļ�
!include "FileFunc.nsh"
!include "nsWindows.nsh"
!include "LoadRTF.nsh"
!include "WinMessages.nsh"
!include "WordFunc.nsh"
!include "LogicLib.nsh" ; �������Բ鿴LogicLib.nsi, �����жϼ�ѭ������ʹ��,����Switch, IfCmd, Select, While, For�⼸��ר���÷�
!include "Library.nsh"
!include "nsProcess.nsh"
!include "MUI2.nsh" ;�����˵�ר��,Page custom nsDialogsPage

!define MUI_CUSTOMFUNCTION_GUIINIT onGUIInit
!define MUI_CUSTOMFUNCTION_UNGUIINIT un.unonGUIInit

; �Զ���ҳ��
;����ѡ�����(��ʹ��Nsis�Դ������ַ���,�Դ�������ѡ����Ҫʹ��Unicode�汾��NSIS����,�������������Ļ�,����������붼��ʶ����,����ʹ�����ַ�����һ������������ѡ���)
;Page custom Page_MutiLanguage ; ������ѡ��,��Ҫ !include "MUI2.nsh"
; ��ӭҳ��
Page custom WelcomePage
; ��װ����ҳ��
Page custom LoadingPage
; ��װ���ҳ��
Page custom CompletePage

; ��װж�ع���ҳ��
UninstPage custom un.UninstallPage
!insertmacro MUI_UNPAGE_INSTFILES

; ��װ�����������������(����ͬʱ���ö��)
;!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

;------------------------------------------------------MUI �ִ����涨���Լ���������------------------------
; Ӧ�ó�����ʾ����
;Name "Ѹ��PDFת����" ; ������Ϊ��ͬ���ļ���
Name "���û�����ר�ñ���" ; ������Ϊ��ͬ���ļ���

; Ӧ�ó������·��
OutFile "${EM_OUTFILE_NAME}"

;InstallDir "$PROGRAMFILES\Ѹ��PDFת����" ; ������Ϊ��ͬ���ļ���(��װĿ¼��)
;InstallDir "$PROGRAMFILES\���û�����ר�ñ���" ; ������Ϊ��ͬ���ļ���(��װĿ¼��)
InstallDir "C:\ProgramData\���û�����ר�ñ���" ; ������Ϊ��ͬ���ļ���(��װĿ¼��),Win8��Win10�����⴦��,���ھ�Win7�Ժ�װ��C:\ProgramData��
		
InstallDirRegKey HKCU "Software\pdf2word" INSTDIR
;SetFont ΢���ź� 9
SetFont ���� 9

; ��Ӵ����EXE�ļ���"��ϸ��Ϣ"�������������ʾ����"����"��"��ϸ��Ϣ"
VIProductVersion "6.3.0.0"

;VIAddVersionKey /LANG=2052 "ProductName" "Ѹ��PDFת����" ; ������Ϊ��ͬ���ļ���
VIAddVersionKey /LANG=2052 "ProductName" "���û�����ר�ñ���" ; ������Ϊ��ͬ���ļ���

VIAddVersionKey /LANG=2052 "ProductVersion" "6.3.0.0"
VIAddVersionKey /LANG=2052 "Comments" "�����Ȩ���Ϻ�������Ϣ�Ƽ����޹�˾���У����˲���˽�Ը��ƻ���ο���������"
VIAddVersionKey /LANG=2052 "CompanyName" "www.huduntech.com"
VIAddVersionKey /LANG=2052 "LegalTrademarks" "Ѹ��PDF"
VIAddVersionKey /LANG=2052 "LegalCopyright" "���ܿƼ� ��Ȩ����"

;VIAddVersionKey /LANG=2052 "FileDescription" "Ѹ��PDFת������װ����" ; ������Ϊ��ͬ���ļ���
VIAddVersionKey /LANG=2052 "FileDescription" "���û�����ר�ñ���" ; ������Ϊ��ͬ���ļ���

VIAddVersionKey /LANG=2052 "FileVersion" "6.3.0.0"

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Section Install
SectionEnd

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Function .onInit
    Call Createpdf2wordMutex
    ${WordFind2X} "$EXEFILE" "" "" "0" $Install_Exe
    InitPluginsDir
    File `/ONAME=$PLUGINSDIR\bg.bmp` `images\bg.bmp`
    File `/ONAME=$PLUGINSDIR\banner1.bmp` `images\banner1.bmp`
    File `/ONAME=$PLUGINSDIR\btn_agree.bmp` `images\btn_agree.bmp`
    File `/oname=$PLUGINSDIR\license.rtf` `license\license.rtf`
    File `/ONAME=$PLUGINSDIR\checkbox1.bmp` `images\checkbox1.bmp`
    File `/ONAME=$PLUGINSDIR\checkbox2.bmp` `images\checkbox2.bmp`
    File `/ONAME=$PLUGINSDIR\btn_install.bmp` `images\btn_install.bmp`
    File `/ONAME=$PLUGINSDIR\btn_custom_install1.bmp` `images\btn_custom_install1.bmp`
    File `/ONAME=$PLUGINSDIR\btn_custom_install2.bmp` `images\btn_custom_install2.bmp`
    File `/ONAME=$PLUGINSDIR\close.bmp` `images\close.bmp`
    File `/ONAME=$PLUGINSDIR\browser.bmp` `images\browser.bmp`

    File `/ONAME=$PLUGINSDIR\bg2.bmp` `images\bg2.bmp`
    File `/ONAME=$PLUGINSDIR\banner2.bmp` `images\banner2.bmp`
    File `/ONAME=$PLUGINSDIR\loading1.bmp` `images\loading1.bmp`
    File `/ONAME=$PLUGINSDIR\loading2.bmp` `images\loading2.bmp`

    File `/ONAME=$PLUGINSDIR\banner3.bmp` `images\banner3.bmp`
    File `/ONAME=$PLUGINSDIR\btn_open_exe.bmp` `images\btn_open_exe.bmp`
    File `/ONAME=$PLUGINSDIR\btn_next_exe.bmp` `images\btn_next_exe.bmp`
    File `/ONAME=$PLUGINSDIR\btn_close_exe.bmp` `images\btn_close_exe.bmp`

    SkinBtn::Init "$PLUGINSDIR\btn_agree.bmp"
    SkinBtn::Init "$PLUGINSDIR\checkbox1.bmp"
		SkinBtn::Init "$PLUGINSDIR\checkbox2.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_install.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_custom_install1.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_custom_install2.bmp"
		SkinBtn::Init "$PLUGINSDIR\close.bmp"
		SkinBtn::Init "$PLUGINSDIR\browser.bmp"
		SkinBtn::Init "$PLUGINSDIR\btn_open_exe.bmp"
FunctionEnd

Function Page_MutiLanguage
  GetDlgItem $0 $HWNDPARENT 1
  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $0 $HWNDPARENT 2
  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $0 $HWNDPARENT 3
  ShowWindow $0 ${SW_HIDE}

  nsDialogs::Create 1044 ;1018
  Pop $0
  ${If} $0 == error
    Abort
  ${EndIf}
  SetCtlColors $0 ""  transparent ; �������͸��

  ${NSW_SetWindowSize} $HWNDPARENT 428 284 ; �ı䴰���С554,384/554,534
  ${NSW_SetWindowSize} $0 428 384 ; �ı�Page��С

  ; ��������ͼ
;  ${NSD_CreateBitmap} 0 0 20% 20% ""
;  Pop $BgImage
;  ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

  ; ��������ͼ
  ${NSD_CreateBitmap} 0,0,100%,100% ""
  Pop $LanguageBgImage
  File "/oname=$PLUGINSDIR\language_top.bmp" "images\language_top.bmp"
  ${NSD_SetImage} $LanguageBgImage "$PLUGINSDIR\language_top.bmp" $LanguageBgImageHandle

  CreateFont $RadioButton_Font "SimSun" "12" "400"
  ${NSD_CreateLabel} 10 2 190 10u "Please select install language" ; �˴�һ��Ҫʹ��Ӣ��,����ͬ�Ĳ���ϵͳ���Ի��������(����˴�д������,��������ϵͳ�»��Ϊ����,��Ϊ���ı��������Ĵ���ҳ,����ϵͳĬ�ϲ�����װ��)
  ;${NSD_CreateRadioButton} 10 12u 100% 10u "���ļ���"
  ${NSD_CreateRadioButton} 10 12u 100% 10u ""
  Pop $RadioButton1
  SendMessage $RadioButton1 ${WM_SETFONT} $RadioButton_Font 0 ; ���������С
  SetCtlColors $RadioButton1 0x000000 transparent ; ������Ϊ͸��
  
  ${NSD_CreateRadioButton} 10 32u 100% 10u English
  Pop $RadioButton2
  SendMessage $RadioButton2 ${WM_SETFONT} $RadioButton_Font 0 ; ���������С
  SetCtlColors $RadioButton2 0x000000 transparent ; ������Ϊ͸��

  ${NSD_CreateRadioButton} 10 52u 100% 10u '�ձ��Z'
  Pop $RadioButton3
;  SendMessage $RadioButton3 ${WM_SETFONT} $hCtl_asdf_Font1 0 ; ���������С
;  SetCtlColors $RadioButton3 0x000000 transparent ; ������Ϊ͸��

  ${NSD_CreateRadioButton} 10 72u 100% 10u '���ķ��w'
	Pop $RadioButton4
  SendMessage $RadioButton1 ${WM_SETFONT} $RadioButton_Font 0 ; ���������С
  SetCtlColors $RadioButton1 0x000000 transparent ; ������Ϊ͸��

  ${NSD_CB_SelectString} $RadioButton1 "��������" ;Ĭ��ѡ�����"��������"
  ${NSD_Check} $RadioButton1 ;���ý���

  ;Next ��һҳ��ť(ѡ�����Խ���)
  ${NSD_CreateButton} 2 160 180 50 ""
  Pop $Btn_Next_Exe
  StrCpy $1 $Btn_Next_Exe
  Call SkinBtn_Next_Exe ; ����ͼƬ
  GetFunctionAddress $3 onClickNextExe ; ���õ���¼�
  SkinBtn::onClick $1 $3

  ;Close �رհ�ť(ѡ�����Խ���)
  ${NSD_CreateButton} 200 160 180 50 ""
  Pop $Btn_Close_Exe
  StrCpy $1 $Btn_Close_Exe
  Call SkinBtn_Close_Exe ; ����ͼƬ
  GetFunctionAddress $3 onClickCloseLanguage  ; ���õ���¼�
  SkinBtn::onClick $1 $3
    
  nsDialogs::Show
FunctionEnd

; ���Close��ť(����ѡ�����)
Function onClickCloseLanguage
  FindProcDLL::FindProc "$Install_Exe"
  Sleep 500 ; ����ʱ��(��λΪ:ms) ����
  Pop $R0
  ${If} $R0 != 0
    KillProcDLL::KillProc "$Install_Exe"
  ${EndIf}
FunctionEnd

Function onGUIInit
    ; �����߿�
    System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
    ; ����һЩ���пؼ�
    GetDlgItem $0 $HWNDPARENT 1034
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1035
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1036
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1037
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1038
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1039
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1256
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 1028
    ShowWindow $0 ${SW_HIDE}
FunctionEnd

; �����ޱ߿��ƶ�
Function onGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

Function Createpdf2wordMutex
	#��鰲װ���⣺#
	ReCheck:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_Install}") i .R1 ?e'
	Pop $R0
	System::Call 'kernel32::CloseHandle(i R1) i.s'
	#���ж�ػ��⣺#
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_UnInstall}") i .R3 ?e'
	Pop $R2
	System::Call 'kernel32::CloseHandle(i R3) i.s'
	#�жϰ�װ/ж�ػ���Ĵ���#
	${If} $R0 != 0
		MessageBox MB_RetryCancel|MB_ICONEXCLAMATION "��װ�����Ѿ����У�" IdRetry ReCheck
		Quit
	${ElseIf} $R2 != 0
		MessageBox MB_RetryCancel|MB_ICONEXCLAMATION "ж�س����������У�" IdRetry ReCheck
		Quit
	${Else}
		#������װ���⣺#
		System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_Install}") i .R1 ?e'
		Pop $R0
		StrCmp $R0 0 +2
		Quit
	${EndIf}
FunctionEnd

; ��ͼ
Function SkinBtn_Btn_Agree
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_agree.bmp $1
FunctionEnd

Function SkinBtn_Checked
  SkinBtn::Set /IMGID=$PLUGINSDIR\checkbox1.bmp $1
FunctionEnd

Function SkinBtn_UnChecked
  SkinBtn::Set /IMGID=$PLUGINSDIR\checkbox2.bmp $1
FunctionEnd

Function SkinBtn_Btn_Install
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_install.bmp $1
FunctionEnd

Function SkinBtn_Custom_Install1
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_custom_install1.bmp $1
FunctionEnd

Function SkinBtn_Custom_Install2
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_custom_install2.bmp $1
FunctionEnd

Function SkinBtn_Btn_Close
  SkinBtn::Set /IMGID=$PLUGINSDIR\close.bmp $1
FunctionEnd

Function SkinBtn_Browser
  SkinBtn::Set /IMGID=$PLUGINSDIR\browser.bmp $1
FunctionEnd

Function SkinBtn_Open_Exe
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_open_exe.bmp $1
FunctionEnd

Function SkinBtn_Next_Exe
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_next_exe.bmp $1
FunctionEnd

Function SkinBtn_Close_Exe
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_close_exe.bmp $1
FunctionEnd

; �¼�
; �û����Э��
Function onClickAgreement
	${IF} $Bool_License == 1
    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; �ı䴰���С,����
    ${NSW_SetWindowSize} $0 554 384 ; �ı�Page��С
		IntOp $Bool_License $Bool_License - 1
	${ELSE}
	  ; �Ȱѡ��Զ��尲װ������
	  ${IF} $Bool_Custom == 1
	    IntOp $Bool_Custom $Bool_Custom - 1
	    StrCpy $1 $Btn_Custom_Install
			Call SkinBtn_Custom_Install1
	    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; �ı䴰���С,����
	    ${NSW_SetWindowSize} $0 554 384 ; �ı�Page��С
  	${EndIf}
    ${NSW_SetWindowSize} $HWNDPARENT 554 534 ; �ı䴰���С,չ��
    ${NSW_SetWindowSize} $0 554 534 ; �ı�Page��С
	  ShowWindow $Txt_License ${SW_SHOW}
		IntOp $Bool_License $Bool_License + 1
	${EndIf}
FunctionEnd

; CheckBoxѡ�з�
Function OnClickCheckbox
  ${IF} $Bool_Checkbox == 1
		IntOp $Bool_Checkbox $Bool_Checkbox - 1
		StrCpy $1 $Btn_Checkbox
		EnableWindow $Btn_Install 0
		;EnableWindow $Btn_Custom_Install 0
		Call SkinBtn_UnChecked
	${ELSE}
		IntOp $Bool_Checkbox $Bool_Checkbox + 1
		StrCpy $1 $Btn_Checkbox
		EnableWindow $Btn_Install 1
		;EnableWindow $Btn_Custom_Install 1
		Call SkinBtn_Checked
	${EndIf}
FunctionEnd

; ������װ�¼�
;��1������ҳ����ת������
Function RelGotoPage
  IntCmp $R9 0 0 Move Move
  	StrCmp $R9 "X" 0 Move
  		StrCpy $R9 "120"
  Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

;��2��������װ��ת����һҳ
Function NextPage
  StrCpy $R9 1 ;Goto the next page
  Call RelGotoPage
  Abort
FunctionEnd

; ���Next��ť(����ѡ�����)
Var LanSelect ; ����ѡ��,zh-CN���ļ���,en English,ja�ձ��Z,zh-TW���ķ��w
Function onClickNextExe
	;Pop $19 ;ʹ����$19,��ԭ������ֵ
	${NSD_GetState} $RadioButton1 $LanSelect
	${If} $LanSelect == ${BST_CHECKED}
	  ;MessageBox MB_OK "RadioButton1 ���ļ��� ��ѡ������"
		StrCpy $LanSelect "zh-CN"		; ��ֵ����$LanguageSelection
	${Else}
		${NSD_GetState} $RadioButton2 $LanSelect
		${If} LanSelect == ${BST_CHECKED}
		  ;MessageBox MB_OK "RadioButton2 English ��ѡ������"
			StrCpy $LanSelect "en"		; ��ֵ����$LanguageSelection
		${Else}
			${NSD_GetState} $RadioButton3 $LanSelect
			${If} $LanSelect == ${BST_CHECKED}
			  ;MessageBox MB_OK "RadioButton3 �ձ��Z ��ѡ������"
				StrCpy $LanSelect "ja"		; ��ֵ����$LanguageSelection
			${Else}
				${NSD_GetState} $RadioButton4 $LanSelect
				${If} $LanSelect == ${BST_CHECKED}
					;MessageBox MB_OK "RadioButton4 ���ķ��w ��ѡ������"
					StrCpy $LanSelect "zh-TW"		; ��ֵ����$LanguageSelection
				${EndIf}
			${EndIf}
		${EndIf}
	${EndIf}
	;MessageBox MB_OK '"$LanSelect - ���Ƕ�ջ������"' ; ����ջ����(�ղ�ѹ����10)������$20
	
	/*
	; ���ʹ�ã�
	; ��Ҫ�ڶ������� !include "LogicLib.nsh" ; �������Բ鿴LogicLib.nsi, �����жϼ�ѭ������ʹ��,����Switch, IfCmd, Select, While, For�⼸��ר���÷�
	${Switch} $LanSelect
	${Case} "1" ; ���ļ���
		MessageBox MB_OK "RadioButton1 ���ļ��� ��ѡ������"
	${Case} "2" ; English
		MessageBox MB_OK "RadioButton2 English ��ѡ������"
	${Case} "3" ; �ձ��Z
		MessageBox MB_OK "RadioButton3 �ձ��Z ��ѡ������"
	${Case} "4" ; ���ķ��w
		MessageBox MB_OK "RadioButton4 ���ķ��w ��ѡ������"
	${Default}
		MessageBox MB_OK "RadioButton1 ���ļ��� ��ѡ������"
  ${EndSwitch}
  */
  
  Call NextPage
  ;Sleep 4200 ; ����ʱ��(��λΪ:ms) ����
FunctionEnd

Function onClickInstall
	; ��������ڰ汾�����,���¼����(���ں���ж��)
  ReadRegStr  $1 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����6.2" "InstallLocation" ; ��ȡע���
  ${If} $1 != ""
	  StrCpy $INSTEDDIR $1
	  Call bUninstall_old
  ${EndIf}

	ReadRegStr $2 HKCU "Software\pdf2word" INSTDIR
	${If} $2 != ""
		StrCpy $INSTEDDIR $2
		Call bUninstall
		Call NextPage
	${Else}
	  Call NextPage
  ${EndIf}
FunctionEnd

; ж����ǰ�û���װ�ľɰ汾�ļ�
Function bUninstall_old
    ${nsProcess::FindProcess} "PDF Convert.exe" $R0
    ${nsProcess::Unload}
    ${If} $R0 == 0
		  ${nsProcess::KillProcess} "PDF Convert.exe" $R1
			${nsProcess::Unload}
			Sleep 500 ; ����ʱ��(��λΪ:ms) ����
	  ${EndIf}
    SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
    Delete "$INSTEDDIR\Aspose.Cells.dll"
    Delete "$INSTEDDIR\Aspose.Pdf.dll"
    Delete "$INSTEDDIR\Aspose.Slides.dll"
    Delete "$INSTEDDIR\Aspose.Total.lic"
    Delete "$INSTEDDIR\Aspose.Words.dll"
    Delete "$INSTEDDIR\config.ini"
    Delete "$INSTEDDIR\Controls.dll"
    Delete "$INSTEDDIR\lua5.1.dll"
    Delete "$INSTEDDIR\PDF Convert.exe"
    ;Delete "$INSTEDDIR\PDF Convert.pdb"
    Delete "$INSTEDDIR\PDF Convert.vshost.exe"
    Delete "$INSTEDDIR\PDF Convert.vshost.exe.manifest"
    Delete "$INSTEDDIR\*.ico"
    Delete "$INSTEDDIR\set.ini"

    Delete "$INSTEDDIR\ar\*.*"
    RMDir "$INSTEDDIR\ar"
    
    Delete "$INSTEDDIR\en\ClearListTips01\*.*"
    RMDir "$INSTEDDIR\en\ClearListTips01"
    Delete "$INSTEDDIR\en\frmAutoUpdate01\*.*"
    RMDir "$INSTEDDIR\en\frmAutoUpdate01"
    Delete "$INSTEDDIR\en\frmMain01Setting01\*.*"
    RMDir "$INSTEDDIR\en\frmMain01Setting01"
    Delete "$INSTEDDIR\en\frmMain01Setting02\*.*"
    RMDir "$INSTEDDIR\en\frmMain01Setting02"
    Delete "$INSTEDDIR\en\frmMain01Setting03\*.*"
    RMDir "$INSTEDDIR\en\frmMain01Setting03"
    Delete "$INSTEDDIR\en\frmSplash\*.*"
    RMDir "$INSTEDDIR\en\frmSplash"
    Delete "$INSTEDDIR\en\MainInfo01\*.*"
    RMDir "$INSTEDDIR\en\MainInfo01"
    Delete "$INSTEDDIR\en\PassWordDlg01\*.*"
    RMDir "$INSTEDDIR\en\PassWordDlg01"
    Delete "$INSTEDDIR\en\RegDlg01\*.*"
    RMDir "$INSTEDDIR\en\RegDlg01"
    Delete "$INSTEDDIR\en\RegTips01\*.*"
    RMDir "$INSTEDDIR\en\RegTips01"
    Delete "$INSTEDDIR\en\*.*"
    RMDir "$INSTEDDIR\en"
    
    Delete "$INSTEDDIR\zh-TW\ClearListTips01\*.*"
    RMDir "$INSTEDDIR\zh-TW\ClearListTips01"
    Delete "$INSTEDDIR\zh-TW\frmAutoUpdate01\*.*"
    RMDir "$INSTEDDIR\zh-TW\frmAutoUpdate01"
    Delete "$INSTEDDIR\zh-TW\frmMain01Setting01\*.*"
    RMDir "$INSTEDDIR\zh-TW\frmMain01Setting01"
    Delete "$INSTEDDIR\zh-TW\frmMain01Setting02\*.*"
    RMDir "$INSTEDDIR\zh-TW\frmMain01Setting02"
    Delete "$INSTEDDIR\zh-TW\frmMain01Setting03\*.*"
    RMDir "$INSTEDDIR\zh-TW\frmMain01Setting03"
    Delete "$INSTEDDIR\zh-TW\frmSplash\*.*"
    RMDir "$INSTEDDIR\zh-TW\frmSplash"
    Delete "$INSTEDDIR\zh-TW\MainInfo01\*.*"
    RMDir "$INSTEDDIR\zh-TW\MainInfo01"
    Delete "$INSTEDDIR\zh-TW\PassWordDlg01\*.*"
    RMDir "$INSTEDDIR\zh-TW\PassWordDlg01"
    Delete "$INSTEDDIR\zh-TW\RegDlg01\*.*"
    RMDir "$INSTEDDIR\zh-TW\RegDlg01"
    Delete "$INSTEDDIR\zh-TW\RegTips01\*.*"
    RMDir "$INSTEDDIR\zh-TW\RegTips01"
    Delete "$INSTEDDIR\zh-TW\*.*"
    RMDir "$INSTEDDIR\zh-TW"
    
    Delete "$INSTEDDIR\ja\ClearListTips01\*.*"
    RMDir "$INSTEDDIR\ja\ClearListTips01"
    Delete "$INSTEDDIR\ja\frmAutoUpdate01\*.*"
    RMDir "$INSTEDDIR\ja\frmAutoUpdate01"
    Delete "$INSTEDDIR\ja\frmMain01Setting01\*.*"
    RMDir "$INSTEDDIR\ja\frmMain01Setting01"
    Delete "$INSTEDDIR\ja\frmMain01Setting02\*.*"
    RMDir "$INSTEDDIR\ja\frmMain01Setting02"
    Delete "$INSTEDDIR\ja\frmMain01Setting03\*.*"
    RMDir "$INSTEDDIR\ja\frmMain01Setting03"
    Delete "$INSTEDDIR\ja\frmSplash\*.*"
    RMDir "$INSTEDDIR\ja\frmSplash"
    Delete "$INSTEDDIR\ja\MainInfo01\*.*"
    RMDir "$INSTEDDIR\ja\MainInfo01"
    Delete "$INSTEDDIR\ja\PassWordDlg01\*.*"
    RMDir "$INSTEDDIR\ja\PassWordDlg01"
    Delete "$INSTEDDIR\ja\RegDlg01\*.*"
    RMDir "$INSTEDDIR\ja\RegDlg01"
    Delete "$INSTEDDIR\ja\RegTips01\*.*"
    RMDir "$INSTEDDIR\ja\RegTips01"
    Delete "$INSTEDDIR\ja\*.*"
    RMDir "$INSTEDDIR\ja"

    Delete "$INSTEDDIR\zh-CN\ClearListTips01\*.*"
    RMDir "$INSTEDDIR\zh-CN\ClearListTips01"
    Delete "$INSTEDDIR\zh-CN\frmAutoUpdate01\*.*"
    RMDir "$INSTEDDIR\zh-CN\frmAutoUpdate01"
    Delete "$INSTEDDIR\zh-CN\frmMain01Setting01\*.*"
    RMDir "$INSTEDDIR\zh-CN\frmMain01Setting01"
    Delete "$INSTEDDIR\zh-CN\frmMain01Setting02\*.*"
    RMDir "$INSTEDDIR\zh-CN\frmMain01Setting02"
    Delete "$INSTEDDIR\zh-CN\frmMain01Setting03\*.*"
    RMDir "$INSTEDDIR\zh-CN\frmMain01Setting03"
    Delete "$INSTEDDIR\zh-CN\frmSplash\*.*"
    RMDir "$INSTEDDIR\zh-CN\frmSplash"
    Delete "$INSTEDDIR\zh-CN\MainInfo01\*.*"
    RMDir "$INSTEDDIR\zh-CN\MainInfo01"
    Delete "$INSTEDDIR\zh-CN\PassWordDlg01\*.*"
    RMDir "$INSTEDDIR\zh-CN\PassWordDlg01"
    Delete "$INSTEDDIR\zh-CN\RegDlg01\*.*"
    RMDir "$INSTEDDIR\zh-CN\RegDlg01"
    Delete "$INSTEDDIR\zh-CN\RegTips01\*.*"
    RMDir "$INSTEDDIR\zh-CN\RegTips01"
    Delete "$INSTEDDIR\zh-CN\*.*"
    RMDir "$INSTEDDIR\zh-CN"

    Delete "$INSTEDDIR\images\Menu\*.*"
    RMDir "$INSTEDDIR\images\Menu"
    Delete "$INSTEDDIR\images\*.*"
    RMDir "$INSTEDDIR\images"

    Delete "$INSTEDDIR\Uninstall\*.*"
    RMDir "$INSTEDDIR\Uninstall"
    
    Delete "$INSTEDDIR\uninstall.exe"
    RMDir "$INSTEDDIR"



    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����6.2"

    ;SetShellVarContext current ;�߲ʷ�ԭʼ����.����һ��Ҫʹ�õ�ǰ�û�,����Win7 32λ�Ĳ���,�������ʹ��������װ,���������
    SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
    Delete "$DESKTOP\Ѹ��PDFת����.lnk"

    Delete "$SMPROGRAMS\Ѹ��PDFת����\Ѹ��PDFת����.lnk"
    Delete "$SMPROGRAMS\Ѹ��PDFת����\ж�� Ѹ��PDFת����.lnk"
    RMDir "$SMPROGRAMS\Ѹ��PDFת����"
FunctionEnd

; ж���û���װ�ĵ�ǰ�汾�ļ�
Function bUninstall
  ${nsProcess::FindProcess} "PDF Convert.exe" $R0
  ${nsProcess::Unload}
  ${If} $R0 == 0
	  ${nsProcess::KillProcess} "PDF Convert.exe" $R1
		${nsProcess::Unload}
		Sleep 500 ; ����ʱ��(��λΪ:ms) ����
	${EndIf}
	SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
  ;Delete "$INSTEDDIR\*.*"     ; ������������������г���ȫ��ɾ��(����ͻ�װ��WinXP������Ļ�)
  Delete "$INSTEDDIR\config.ini"
  Delete "$INSTEDDIR\set.ini"
  Delete "$INSTEDDIR\Aspose.Total.lic"
  Delete "$INSTEDDIR\PDF Convert.vshost.exe.manifest"
  Delete "$INSTEDDIR\PDF Convert.exe"
  Delete "$INSTEDDIR\PDF Convert.vshost.exe"
  Delete "$INSTEDDIR\Aspose.Cells.dll"
  Delete "$INSTEDDIR\Aspose.Pdf.dll"
  Delete "$INSTEDDIR\Aspose.Slides.dll"
  Delete "$INSTEDDIR\Aspose.Words.dll"
  Delete "$INSTEDDIR\Controls.dll"
  Delete "$INSTEDDIR\*.ico"
  Delete "$INSTEDDIR\uninstall.exe"

  Delete "$INSTEDDIR\ar\*.*"
  RMDir "$INSTEDDIR\ar"
  
  Delete "$INSTEDDIR\en\ClearListTips01\*.*"
  RMDir "$INSTEDDIR\en\ClearListTips01"
  Delete "$INSTEDDIR\en\frmAutoUpdate01\*.*"
  RMDir "$INSTEDDIR\en\frmAutoUpdate01"
  Delete "$INSTEDDIR\en\frmMain01Setting01\*.*"
  RMDir "$INSTEDDIR\en\frmMain01Setting01"
  Delete "$INSTEDDIR\en\frmMain01Setting02\*.*"
  RMDir "$INSTEDDIR\en\frmMain01Setting02"
  Delete "$INSTEDDIR\en\frmMain01Setting03\*.*"
  RMDir "$INSTEDDIR\en\frmMain01Setting03"
  Delete "$INSTEDDIR\en\frmSplash\*.*"
  RMDir "$INSTEDDIR\en\frmSplash"
  Delete "$INSTEDDIR\en\MainInfo01\*.*"
  RMDir "$INSTEDDIR\en\MainInfo01"
  Delete "$INSTEDDIR\en\PassWordDlg01\*.*"
  RMDir "$INSTEDDIR\en\PassWordDlg01"
  Delete "$INSTEDDIR\en\RegDlg01\*.*"
  RMDir "$INSTEDDIR\en\RegDlg01"
  Delete "$INSTEDDIR\en\RegTips01\*.*"
  RMDir "$INSTEDDIR\en\RegTips01"
  Delete "$INSTEDDIR\en\*.*"
  RMDir "$INSTEDDIR\en"
  
	Delete "$INSTEDDIR\zh-TW\ClearListTips01\*.*"
  RMDir "$INSTEDDIR\zh-TW\ClearListTips01"
  Delete "$INSTEDDIR\zh-TW\frmAutoUpdate01\*.*"
  RMDir "$INSTEDDIR\zh-TW\frmAutoUpdate01"
  Delete "$INSTEDDIR\zh-TW\frmMain01Setting01\*.*"
  RMDir "$INSTEDDIR\zh-TW\frmMain01Setting01"
  Delete "$INSTEDDIR\zh-TW\frmMain01Setting02\*.*"
  RMDir "$INSTEDDIR\zh-TW\frmMain01Setting02"
  Delete "$INSTEDDIR\zh-TW\frmMain01Setting03\*.*"
  RMDir "$INSTEDDIR\zh-TW\frmMain01Setting03"
  Delete "$INSTEDDIR\zh-TW\frmSplash\*.*"
  RMDir "$INSTEDDIR\zh-TW\frmSplash"
  Delete "$INSTEDDIR\zh-TW\MainInfo01\*.*"
  RMDir "$INSTEDDIR\zh-TW\MainInfo01"
  Delete "$INSTEDDIR\zh-TW\PassWordDlg01\*.*"
  RMDir "$INSTEDDIR\zh-TW\PassWordDlg01"
  Delete "$INSTEDDIR\zh-TW\RegDlg01\*.*"
  RMDir "$INSTEDDIR\zh-TW\RegDlg01"
  Delete "$INSTEDDIR\zh-TW\RegTips01\*.*"
  RMDir "$INSTEDDIR\zh-TW\RegTips01"
  Delete "$INSTEDDIR\zh-TW\*.*"
  RMDir "$INSTEDDIR\zh-TW"

  Delete "$INSTEDDIR\ja\ClearListTips01\*.*"
  RMDir "$INSTEDDIR\ja\ClearListTips01"
  Delete "$INSTEDDIR\ja\frmAutoUpdate01\*.*"
  RMDir "$INSTEDDIR\ja\frmAutoUpdate01"
  Delete "$INSTEDDIR\ja\frmMain01Setting01\*.*"
  RMDir "$INSTEDDIR\ja\frmMain01Setting01"
  Delete "$INSTEDDIR\ja\frmMain01Setting02\*.*"
  RMDir "$INSTEDDIR\ja\frmMain01Setting02"
  Delete "$INSTEDDIR\ja\frmMain01Setting03\*.*"
  RMDir "$INSTEDDIR\ja\frmMain01Setting03"
  Delete "$INSTEDDIR\ja\frmSplash\*.*"
  RMDir "$INSTEDDIR\ja\frmSplash"
  Delete "$INSTEDDIR\ja\MainInfo01\*.*"
  RMDir "$INSTEDDIR\ja\MainInfo01"
  Delete "$INSTEDDIR\ja\PassWordDlg01\*.*"
  RMDir "$INSTEDDIR\ja\PassWordDlg01"
  Delete "$INSTEDDIR\ja\RegDlg01\*.*"
  RMDir "$INSTEDDIR\ja\RegDlg01"
  Delete "$INSTEDDIR\ja\RegTips01\*.*"
  RMDir "$INSTEDDIR\ja\RegTips01"
  Delete "$INSTEDDIR\ja\*.*"
  RMDir "$INSTEDDIR\ja"

  Delete "$INSTEDDIR\zh-CN\ClearListTips01\*.*"
  RMDir "$INSTEDDIR\zh-CN\ClearListTips01"
  Delete "$INSTEDDIR\zh-CN\frmAutoUpdate01\*.*"
  RMDir "$INSTEDDIR\zh-CN\frmAutoUpdate01"
  Delete "$INSTEDDIR\zh-CN\frmMain01Setting01\*.*"
  RMDir "$INSTEDDIR\zh-CN\frmMain01Setting01"
  Delete "$INSTEDDIR\zh-CN\frmMain01Setting02\*.*"
  RMDir "$INSTEDDIR\zh-CN\frmMain01Setting02"
  Delete "$INSTEDDIR\zh-CN\frmMain01Setting03\*.*"
  RMDir "$INSTEDDIR\zh-CN\frmMain01Setting03"
  Delete "$INSTEDDIR\zh-CN\frmSplash\*.*"
  RMDir "$INSTEDDIR\zh-CN\frmSplash"
  Delete "$INSTEDDIR\zh-CN\MainInfo01\*.*"
  RMDir "$INSTEDDIR\zh-CN\MainInfo01"
  Delete "$INSTEDDIR\zh-CN\PassWordDlg01\*.*"
  RMDir "$INSTEDDIR\zh-CN\PassWordDlg01"
  Delete "$INSTEDDIR\zh-CN\RegDlg01\*.*"
  RMDir "$INSTEDDIR\zh-CN\RegDlg01"
  Delete "$INSTEDDIR\zh-CN\RegTips01\*.*"
  RMDir "$INSTEDDIR\zh-CN\RegTips01"
  Delete "$INSTEDDIR\zh-CN\*.*"
  RMDir "$INSTEDDIR\zh-CN"

  RMDir "$INSTEDDIR"

  DeleteRegKey /ifempty HKCU "Software\pdf2word"
  DeleteRegKey /ifempty HKLM "Software\pdf2word"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\pdf2word.exe"

  ;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" ; ������Ϊ��ͬ���ļ���
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" ; ������Ϊ��ͬ���ļ���

  ;SetShellVarContext current ;�߲ʷ�ԭʼ����.����һ��Ҫʹ�õ�ǰ�û�,����Win7 32λ�Ĳ���,�������ʹ��������װ,���������
  SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�

  ;Delete "$DESKTOP\Ѹ��PDFת����.lnk" ; ������Ϊ��ͬ���ļ���
  ;Delete "$SMPROGRAMS\Ѹ��PDFת����\Ѹ��PDFת����.lnk" ; ������Ϊ��ͬ���ļ���
  ;Delete "$SMPROGRAMS\Ѹ��PDFת����\ж�� Ѹ��PDFת����.lnk" ; ������Ϊ��ͬ���ļ���
  ;RMDir "$SMPROGRAMS\Ѹ��PDFת����" ; ������Ϊ��ͬ���ļ���

  Delete "$DESKTOP\���û�����ר�ñ���.lnk" ; ������Ϊ��ͬ���ļ���
  Delete "$SMPROGRAMS\���û�����ר�ñ���\���û�����ר�ñ���.lnk" ; ������Ϊ��ͬ���ļ���
  Delete "$SMPROGRAMS\���û�����ר�ñ���\ж�� ���û�����ר�ñ���.lnk" ; ������Ϊ��ͬ���ļ���
  RMDir "$SMPROGRAMS\���û�����ר�ñ���" ; ������Ϊ��ͬ���ļ���

  SetAutoClose true
FunctionEnd

; �Զ��尲װ�¼�
Function onClickCustomInstall
	${IF} $Bool_Custom == 1
    IntOp $Bool_Custom $Bool_Custom - 1
    StrCpy $1 $Btn_Custom_Install
		Call SkinBtn_Custom_Install1
    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; �ı䴰���С,����
    ${NSW_SetWindowSize} $0 554 384 ; �ı�Page��С
	${ELSE}
	  ; �Ȱѡ��û����Э�顱����
  	${IF} $Bool_License == 1
      ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; �ı䴰���С,����
      ${NSW_SetWindowSize} $0 554 384 ; �ı�Page��С
  		IntOp $Bool_License $Bool_License - 1
  	${EndIf}
  	
    ${NSW_SetWindowSize} $HWNDPARENT 554 436 ; �ı䴰���С,չ��
    ${NSW_SetWindowSize} $0 554 436 ; �ı�Page��С
    ShowWindow $Txt_License ${SW_HIDE}
    IntOp $Bool_Custom $Bool_Custom + 1
    StrCpy $1 $Btn_Custom_Install
		Call SkinBtn_Custom_Install2
	${EndIf}
FunctionEnd

; ������Ͻǹرհ�ť
Function onClickClose
  FindProcDLL::FindProc "$Install_Exe"
  Sleep 500 ; ����ʱ��(��λΪ:ms) ����
  Pop $R0
  ${If} $R0 != 0
    KillProcDLL::KillProc "$Install_Exe"
  ${EndIf}
FunctionEnd

;Function onClickClose
;    ${NSW_DestroyWindow} $hwndparent
;FunctionEnd

; ����Ŀ¼
Function OnChangeDirRequest
	Pop $0
	System::Call "user32::GetWindowText(i$Txt_Browser,t.r0,i${NSIS_MAX_STRLEN})"
	StrCpy $INSTDIR $0
FunctionEnd

; �����ť
Function OnClickBrowse
  Pop $0
  Push $INSTDIR                  ; input string "C:\Program Files\ProgramName"
  Call GetParent
  Pop $R0                        ; first part "C:\Program Files"
  Push $INSTDIR                  ; input string "C:\Program Files\ProgramName"
  Push "\"                       ; input chop char
  Call GetLastPart
  Pop $R1                        ; last part "ProgramName"
  ;nsDialogs::SelectFolderDialog "��ѡ�� $R0 ��װ���ļ���:" "$R0" ;�߲ʷ������ʾ�Ǵ��
  nsDialogs::SelectFolderDialog "��ѡ�� $R1 ��װ���ļ���:" "$R0"
  Pop $0
  ${If} $0 == "error"            # returns 'error' if 'cancel' was pressed?
    Return
  ${EndIf}
  ${If} $0 != ""
	  StrCpy $INSTDIR "$0\$R1"
	  ;MessageBox MB_OK "$INSTDIR"
	  ;��������Ǵ����
	  ;system::Call `user32::SetWindowText(i $Txt_Browser, t "$INSTDIR")` ;����ϵͳ��API,ʹ��user32�����SetWindowText����
	  ${NSD_SetText} $Txt_Browser $INSTDIR ;�ѵõ�����·����ֵ���ı���
  ${EndIf}
FunctionEnd

; Usage:
; Push "C:\Program Files\Directory\Whatever"
; Call GetParent
; Pop $R0 ; $R0 equal "C:\Program Files\Directory"
; �õ�ѡ��Ŀ¼����ƴ�Ӱ�װ��������
Function GetParent
  Exch $R0 ; input string
  Push $R1
  Push $R2
  Push $R3
  StrCpy $R1 0
  StrLen $R2 $R0
  loop:
    IntOp $R1 $R1 + 1
    IntCmp $R1 $R2 get 0 get
    StrCpy $R3 $R0 1 -$R1
    StrCmp $R3 "\" get
    Goto loop
  get:
    StrCpy $R0 $R0 -$R1
    Pop $R3
    Pop $R2
    Pop $R1
    Exch $R0 ; output string
FunctionEnd

; Usage:
; Push $INSTDIR ; input string "C:\Program Files\ProgramName"
; Push "\" ; input chop char
; Call GetLastPart
; Pop $R1 ; last part "ProgramName"
; ��ȡѡ��Ŀ¼
Function GetLastPart
  Exch $0 ; chop char
  Exch
  Exch $1 ; input string
  Push $2
  Push $3
  StrCpy $2 0
  loop:
    IntOp $2 $2 - 1
    StrCpy $3 $1 1 $2
    StrCmp $3 "" 0 +3
    StrCpy $0 ""
    Goto exit2 ; 2015-12-21,KongMengyuan����: �˴����µĴ��벻֪���ִ��,�п�ʱ��һ�¸߲ʷ�

    StrCmp $3 $0 exit1
    Goto loop
  exit1:
    IntOp $2 $2 + 1
    StrCpy $0 $1 "" $2
  exit2:
    Pop $3
    Pop $2
    Pop $1
    Exch $0 ; output string
FunctionEnd

; ����������
Function NSD_TimerFun
  GetFunctionAddress $0 NSD_TimerFun
  nsDialogs::KillTimer $0

	ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" CurrentVersion
	ClearErrors
	${VersionCompare} "$R0" "6.1" $R3 ; ���ݲ���ϵͳ����װ��ͬ�ĳ���
	${If} $R3 == 1
		;Nsis�Դ������ĵ����� !if �� !endif �������һ��ʱ,������߱������Ƿ���뺬��������֮��Ĵ��롣���ֵΪ������� ֵ1 �� ֵ2 ���߼�������Ϊ��,��ô�����Ĵ��뽫�ᱻ���롣����,��Щ���뽫�ᱻ����������� ������ == or != (�ַ����Ƚ�), <=, < > �� >= (ʵ���Ƚ�), && or || (��������)�� ��������� [!] �����߼�������ȡ�ǡ�
    !if 1   ; �Ƿ��ں�̨����,1��Ч
      GetFunctionAddress $0 InstallationMainFun4.5
      ;ʹ��BgWorker����ǳ���,ֻ����$0���շ�����ַ,Ȼ�����BgWorker::CallAndWait������˼��,BgWorker���ù�����ͬ����,���һ�Wait��InstallationMainFun����ִ�н���,���BgWorker::CallAndWait�������滹�д���Ļ�,ֻ����ִ����InstallationMainFun���������ִ�С�
      BgWorker::CallAndWait
      Call CreateLink
			Call AutoNextPage
    !else
      Call InstallationMainFun4.5
      Call CreateLink
			Call AutoNextPage
    !endif
	${Else}
    !if 1   ; �Ƿ��ں�̨����,1��Ч
        GetFunctionAddress $0 InstallationMainFun
        BgWorker::CallAndWait
        Call CreateLink
				Call AutoNextPage

    !else
        Call InstallationMainFun
        Call CreateLink
				Call AutoNextPage
    !endif
	${EndIf}
FunctionEnd

; ��װnetFramework2.0������Ķ�Ӧִ��������
Function InstallationMainFun

	SendMessage $PB_ProgressBar ${PBM_SETRANGE32} 0 100  ;�ܲ���Ϊ��������ֵ
  CreateDirectory "$INSTDIR"
  SetOutPath "$INSTDIR"
  SetOverwrite on ;�򿪸��ǰ�װ

	;SetCtlColors $Lbl_Inatalling "${TEXT_COLOR}" "${BGCOLOR}"
  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����cONTROL��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
	${NSD_SetText} $Lbl_Inatalling "���ڰ�װ Aspose.Cells.dll"	; ��װ������ʾ����

  ; �޸�ʱҪע�ⲻҪ�޸��ļ���˳��,�����10��40��ʱ��,�Ǹ���ʵ��������Թ���,���������������������
	SendMessage $PB_ProgressBar ${PBM_SETPOS} 3 0 ;10 0
  File "Files\Aspose.Cells.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
	${NSD_SetText} $Lbl_Inatalling "���ڰ�װ Aspose.Pdf.dll"	; ��װ������ʾ����

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 10 0 ;40 0
  File "Files\Aspose.Pdf.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
	${NSD_SetText} $Lbl_Inatalling "���ڰ�װ Aspose.Slides.dll"	; ��װ������ʾ����

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 20 0 ;60 0
  File "Files\Aspose.Slides.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
	${NSD_SetText} $Lbl_Inatalling "���ڰ�װ Aspose.Words.dll"	; ��װ������ʾ����

  ; �޸�ʱҪע�ⲻҪ�޸��ļ���˳��,�����10��40��ʱ��,�Ǹ���ʵ��������Թ���,���������������������
  SendMessage $PB_ProgressBar ${PBM_SETPOS} 30 0 ;70 0
  File "Files\Aspose.Words.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
	${NSD_SetText} $Lbl_Inatalling "���ڰ�װ �����ļ� ..."	; ��װ������ʾ����

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 50 0 ;80 0
  File "Files\Controls.dll"
  File "Files\Aspose.Total.lic"
  File "Files\config.ini"
  File "Files\PDF Convert.exe"
  ;File "Files\PDF Convert.pdb"
  File "Files\PDF Convert.vshost.exe"
  File "Files\PDF Convert.vshost.exe.manifest"
  File "Files\set.ini"
  File "Files\*.ico"

  SetOutPath "$INSTDIR\ar"
  SetOverwrite on
  SendMessage $PB_ProgressBar ${PBM_SETPOS} 60 0 ;85 0
  File "Files\ar\*.*"

  SetOutPath "$INSTDIR\en\ClearListTips01"
  SetOverwrite on
  File "Files\en\ClearListTips01\*.*"
  SetOutPath "$INSTDIR\en\frmAutoUpdate01"
  SetOverwrite on
  File "Files\en\frmAutoUpdate01\*.*"
  SetOutPath "$INSTDIR\en\frmMain01Setting01"
  SetOverwrite on
  File "Files\en\frmMain01Setting01\*.*"
  SetOutPath "$INSTDIR\en\frmMain01Setting02"
  SetOverwrite on
  File "Files\en\frmMain01Setting02\*.*"
  SetOutPath "$INSTDIR\en\frmMain01Setting03"
  SetOverwrite on
  File "Files\en\frmMain01Setting03\*.*"
  SetOutPath "$INSTDIR\en\frmSplash"
  SetOverwrite on
  File "Files\en\frmSplash\*.*"
  SetOutPath "$INSTDIR\en\MainInfo01"
  SetOverwrite on
  File "Files\en\MainInfo01\*.*"
  SetOutPath "$INSTDIR\en\PassWordDlg01"
  SetOverwrite on
  File "Files\en\PassWordDlg01\*.*"
  SetOutPath "$INSTDIR\en\RegDlg01"
  SetOverwrite on
  File "Files\en\RegDlg01\*.*"
  SetOutPath "$INSTDIR\en\RegTips01"
  SetOverwrite on
  File "Files\en\RegTips01\*.*"
  
  SendMessage $PB_ProgressBar ${PBM_SETPOS} 65 0 ;90 0
  SetOutPath "$INSTDIR\en"
  SetOverwrite on
  File "Files\en\*.*"
  
	SetOutPath "$INSTDIR\zh-TW\ClearListTips01"
  SetOverwrite on
  File "Files\zh-TW\ClearListTips01\*.*"
  SetOutPath "$INSTDIR\zh-TW\frmAutoUpdate01"
  SetOverwrite on
  File "Files\zh-TW\frmAutoUpdate01\*.*"
  SetOutPath "$INSTDIR\zh-TW\frmMain01Setting01"
  SetOverwrite on
  File "Files\zh-TW\frmMain01Setting01\*.*"
  SetOutPath "$INSTDIR\zh-TW\frmMain01Setting02"
  SetOverwrite on
  File "Files\zh-TW\frmMain01Setting02\*.*"
  SetOutPath "$INSTDIR\zh-TW\frmMain01Setting03"
  SetOverwrite on
  File "Files\zh-TW\frmMain01Setting03\*.*"
  SetOutPath "$INSTDIR\zh-TW\frmSplash"
  SetOverwrite on
  File "Files\zh-TW\frmSplash\*.*"
  SetOutPath "$INSTDIR\zh-TW\MainInfo01"
  SetOverwrite on
  File "Files\zh-TW\MainInfo01\*.*"
  SetOutPath "$INSTDIR\zh-TW\PassWordDlg01"
  SetOverwrite on
  File "Files\zh-TW\PassWordDlg01\*.*"
  SetOutPath "$INSTDIR\zh-TW\RegDlg01"
  SetOverwrite on
  File "Files\zh-TW\RegDlg01\*.*"
  SetOutPath "$INSTDIR\zh-TW\RegTips01"
  SetOverwrite on
  File "Files\zh-TW\RegTips01\*.*"

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 70 0 ;90 0
  SetOutPath "$INSTDIR\zh-TW"
  SetOverwrite on
  File "Files\zh-TW\*.*"
  
	SetOutPath "$INSTDIR\ja\ClearListTips01"
  SetOverwrite on
  File "Files\ja\ClearListTips01\*.*"
  SetOutPath "$INSTDIR\ja\frmAutoUpdate01"
  SetOverwrite on
  File "Files\ja\frmAutoUpdate01\*.*"
  SetOutPath "$INSTDIR\ja\frmMain01Setting01"
  SetOverwrite on
  File "Files\ja\frmMain01Setting01\*.*"
  SetOutPath "$INSTDIR\ja\frmMain01Setting02"
  SetOverwrite on
  File "Files\ja\frmMain01Setting02\*.*"
  SetOutPath "$INSTDIR\ja\frmMain01Setting03"
  SetOverwrite on
  File "Files\ja\frmMain01Setting03\*.*"
  SetOutPath "$INSTDIR\ja\frmSplash"
  SetOverwrite on
  File "Files\ja\frmSplash\*.*"
  SetOutPath "$INSTDIR\ja\MainInfo01"
  SetOverwrite on
  File "Files\ja\MainInfo01\*.*"
  SetOutPath "$INSTDIR\ja\PassWordDlg01"
  SetOverwrite on
  File "Files\ja\PassWordDlg01\*.*"
  SetOutPath "$INSTDIR\ja\RegDlg01"
  SetOverwrite on
  File "Files\ja\RegDlg01\*.*"
  SetOutPath "$INSTDIR\ja\RegTips01"
  SetOverwrite on
  File "Files\ja\RegTips01\*.*"

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 75 0 ;90 0
  SetOutPath "$INSTDIR\ja"
  SetOverwrite on
  File "Files\ja\*.*"
  
	SetOutPath "$INSTDIR\zh-CN\ClearListTips01"
  SetOverwrite on
  File "Files\zh-CN\ClearListTips01\*.*"
  SetOutPath "$INSTDIR\zh-CN\frmAutoUpdate01"
  SetOverwrite on
  File "Files\zh-CN\frmAutoUpdate01\*.*"
  SetOutPath "$INSTDIR\zh-CN\frmMain01Setting01"
  SetOverwrite on
  File "Files\zh-CN\frmMain01Setting01\*.*"
  SetOutPath "$INSTDIR\zh-CN\frmMain01Setting02"
  SetOverwrite on
  File "Files\zh-CN\frmMain01Setting02\*.*"
  SetOutPath "$INSTDIR\zh-CN\frmMain01Setting03"
  SetOverwrite on
  File "Files\zh-CN\frmMain01Setting03\*.*"
  SetOutPath "$INSTDIR\zh-CN\frmSplash"
  SetOverwrite on
  File "Files\zh-CN\frmSplash\*.*"
  SetOutPath "$INSTDIR\zh-CN\MainInfo01"
  SetOverwrite on
  File "Files\zh-CN\MainInfo01\*.*"
  SetOutPath "$INSTDIR\zh-CN\PassWordDlg01"
  SetOverwrite on
  File "Files\zh-CN\PassWordDlg01\*.*"
  SetOutPath "$INSTDIR\zh-CN\RegDlg01"
  SetOverwrite on
  File "Files\zh-CN\RegDlg01\*.*"
  SetOutPath "$INSTDIR\zh-CN\RegTips01"
  SetOverwrite on
  File "Files\zh-CN\RegTips01\*.*"

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 80 0 ;90 0
  SetOutPath "$INSTDIR\zh-CN"
  SetOverwrite on
  File "Files\zh-CN\*.*"
  
  SendMessage $PB_ProgressBar ${PBM_SETPOS} 83 0 ;90 0
  SetOutPath "$INSTDIR\images\Menu"
  SetOverwrite on
  File "Files\images\Menu\*.*"

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 85 0 ;90 0
  SetOutPath "$INSTDIR\images"
  SetOverwrite on
  File "Files\images\*.*"

  Call WriteReg ; ��װ����д��ע�����Ϣ
  Sleep 500 ; ����ʱ��(��λΪ:ms) ����

  Call GetNetFrameworkVersion ;��ȡ.Net Framework��װ�İ汾��

	${VersionCompare} "$R0" "5.2" $R3 ; ���ݲ���ϵͳ����װ��ͬ�ĳ���
	;MessageBox MB_OK $R3
	${If} $R3 == 0 ;�ж��Ƿ�ΪWinXP_64λ,����Ҫ��װNet2.0 SP2 64λ
    Pop $R1
	  ${VersionCompare} "$R1" "2.0.50727" $R6
  	;MessageBox MB_OK $R6
    ${If} $R6 == 2
			;����Framework2.0��64λ,��Ҫ��NSISdl���
			/*
			NSISdl::download /TRANSLATE2 '�������� %s' '��������...' '(ʣ�� 1 ��)' '(ʣ�� 1 ����)' '(ʣ�� 1 Сʱ)' '(ʣ�� %u ��)' '(ʣ�� %u ����)' '(ʣ�� %u Сʱ)' '����ɣ�%skB(%d%%) ��С��%skB �ٶȣ�%u.%01ukB/s' /TIMEOUT=7500 /NOIEPROXY 'http://download.huifutz.com/DataRecovery/DingjiSoft.exe' '$INSTDIR\DingjiSoft.exe'
		  Pop $R0
		  StrCmp $R0 "success" 0 +3
		  MessageBox MB_YESNO|MB_ICONQUESTION "DingjiSoft.exe �ѳɹ���������$\r$\n$\t$INSTDIR\DingjiSoft.exe$\r$\n�Ƿ�����ִ�а�װ����" IDNO +2 ;$INSTDIR ��װĿ¼, $EXEDIR��ǰĿ¼
		  ExecWait '$INSTDIR\DingjiSoft.exe'
		  Delete "$INSTDIR\DingjiSoft.exe"
		  */

			; ��װ������ʾ����
		  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
			${NSD_SetText} $Lbl_Inatalling "�����ĵȺ�(���ܻ���1-2����), �������� .NET Framework 2.0 SP2..."

		  NSISdl::download /TRANSLATE2 '�������� %s' '��������...' '(ʣ�� 1 ��)' '(ʣ�� 1 ����)' '(ʣ�� 1 Сʱ)' '(ʣ�� %u ��)' '(ʣ�� %u ����)' '(ʣ�� %u Сʱ)' '����ɣ�%skB(%d%%) ��С��%skB �ٶȣ�%u.%01ukB/s' /TIMEOUT=7500 /NOIEPROXY 'http://download.xjpdf.com/donet/NetFx20SP2_x64.exe' '$INSTDIR\NetFx20SP2_x64.exe'
		  Pop $R0
		  StrCmp $R0 "success" 0 +3
		  DetailPrint "���ڰ�װ .NET Framework 2.0 SP2..."
      SendMessage $PB_ProgressBar ${PBM_SETPOS} 90 0 ;��������ʾ
		  SetDetailsPrint listonly

			; ��װ������ʾ����
		  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
			${NSD_SetText} $Lbl_Inatalling "�����ĵȺ�(���ܻ���3-5����), ���ڰ�װ .NET Framework 2.0 SP2..."

		  ExecWait '$INSTDIR\NetFx20SP2_x64.exe /quiet /norestart' $R1 ;��Ĭ��װ,û���κ���ʾ
		  Delete "$INSTDIR\NetFx20SP2_x64.exe"
    ${EndIf}
	${ElseIf} $R3 == 2 ;���ߴ�,��Ҫ��װNet2.0 SP2 32λ
    Pop $R1
	  ${VersionCompare} "$R1" "2.0.50727" $R6
  	;MessageBox MB_OK $R6
    ${If} $R6 == 2
		  /*
			;�������ز���װ����,��Ҫ��NSISdl���
		  NSISdl::download /TRANSLATE2 '�������� %s' '��������...' '(ʣ�� 1 ��)' '(ʣ�� 1 ����)' '(ʣ�� 1 Сʱ)' '(ʣ�� %u ��)' '(ʣ�� %u ����)' '(ʣ�� %u Сʱ)' '����ɣ�%skB(%d%%) ��С��%skB �ٶȣ�%u.%01ukB/s' /TIMEOUT=7500 /NOIEPROXY 'http://download.microsoft.com/download/c/6/e/c6e88215-0178-4c6c-b5f3-158ff77b1f38/NetFx20SP2_x86.exe' '$TEMP\NetFx20SP2_x86.exe'
		  Pop $R0
		  StrCmp $R0 "success" 0 +3
		  MessageBox MB_YESNO|MB_ICONQUESTION "NetFx20SP2_x86.exe �ѳɹ����ء�$\r$\n�Ƿ�������װ��" IDNO +2
		  SetDetailsPrint textonly
		  DetailPrint "���ڰ�װ .NET Framework 2.0 SP2..."
		  SetDetailsPrint listonly
		  ExecWait '$TEMP\NetFx20SP2_x86.exe /quiet /norestart' $R1 ;��Ĭ��װ,û���κ���ʾ
		  Delete "$TEMP\NetFx20SP2_x86.exe"
		  */

			; ���԰�װ������ʾ����
		  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
			${NSD_SetText} $Lbl_Inatalling "�����ĵȺ�(���ܻ���1-2����), �������� .NET Framework 2.0 SP2..."

		  NSISdl::download /TRANSLATE2 '�������� %s' '��������...' '(ʣ�� 1 ��)' '(ʣ�� 1 ����)' '(ʣ�� 1 Сʱ)' '(ʣ�� %u ��)' '(ʣ�� %u ����)' '(ʣ�� %u Сʱ)' '����ɣ�%skB(%d%%) ��С��%skB �ٶȣ�%u.%01ukB/s' /TIMEOUT=7500 /NOIEPROXY 'http://download.xjpdf.com/donet/NetFx20SP2_x86.exe' '$INSTDIR\NetFx20SP2_x86.exe'
		  Pop $R0
		  StrCmp $R0 "success" 0 +3
		  DetailPrint "���ڰ�װ .NET Framework 2.0 SP2..."
      SendMessage $PB_ProgressBar ${PBM_SETPOS} 90 0 ;��������ʾ
		  SetDetailsPrint listonly

			; ���԰�װ������ʾ����
		  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
			${NSD_SetText} $Lbl_Inatalling "�����ĵȺ�(���ܻ���3-5����), ���ڰ�װ .NET Framework 2.0 SP2..."

		  ExecWait '$INSTDIR\NetFx20SP2_x86.exe /quiet /norestart' $R1 ;��Ĭ��װ,û���κ���ʾ
		  Delete "$INSTDIR\NetFx20SP2_x86.exe"
		${EndIf}
	${EndIf}

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 100 0

FunctionEnd

; ��װnetFramework4.5������Ķ�Ӧִ��������
Function InstallationMainFun4.5
    SendMessage $PB_ProgressBar ${PBM_SETRANGE32} 0 100  ;�ܲ���Ϊ��������ֵ

    CreateDirectory "$INSTDIR"

    ;MessageBox MB_OK "$INSTDIR"

    SetOutPath "$INSTDIR"
    SetOverwrite on

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
		${NSD_SetText} $Lbl_Inatalling "���ڰ�װ Aspose.Cells.dll"	; ��װ������ʾ����

		SendMessage $PB_ProgressBar ${PBM_SETPOS} 10 0
    File "Files\Aspose.Cells.dll"

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
		${NSD_SetText} $Lbl_Inatalling "���ڰ�װ Aspose.Pdf.dll"	; ��װ������ʾ����

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 40 0
    File "Files\Aspose.Pdf.dll"

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
		${NSD_SetText} $Lbl_Inatalling "���ڰ�װ Aspose.Slides.dll"	; ��װ������ʾ����

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 60 0
    File "Files\Aspose.Slides.dll"

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
		${NSD_SetText} $Lbl_Inatalling "���ڰ�װ Aspose.Words.dll"	; ��װ������ʾ����

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 70 0
    File "Files\Aspose.Words.dll"

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
		${NSD_SetText} $Lbl_Inatalling "���ڰ�װ �����ļ� ... "	; ��װ������ʾ����

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 80 0
    File "Files\Aspose.Total.lic"
    File "Files\config.ini"
    File "Files4.5\PDF Convert.exe"
    ;File "Files4.5\PDF Convert.pdb"
    File "Files4.5\PDF Convert.vshost.exe"
    File "Files4.5\PDF Convert.vshost.exe.manifest"
    File "Files\set.ini"
    File "Files\*.ico"

    SetOutPath "$INSTDIR\ar"
    SetOverwrite on ; ���ǰ�װ,�Ƚϰ�ȫ,ֻ��Ŀ¼��Ч
    ; �޸�ʱҪע�ⲻҪ�޸��ļ���˳��,�����85��ʱ��,�Ǹ���ʵ��������Թ���,���������������������
    SendMessage $PB_ProgressBar ${PBM_SETPOS} 85 0
    File "Files4.5\ar\*.*"
    SetOutPath "$INSTDIR\en"
    SetOverwrite on

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 90 0
    File "Files4.5\en\*.*"

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 95 0
    SetOutPath "$INSTDIR\zh-CN"
    SetOverwrite on

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 100 0
    File "Files4.5\zh-CN\*.*"

    Call WriteReg ; ��װ����д��ע�����Ϣ
    Sleep 500 ; ����ʱ��(��λΪ:ms) ����
FunctionEnd

Function CreateLink
    ;SetShellVarContext current ;�߲ʷ�ԭʼ����.����һ��Ҫʹ�õ�ǰ�û�,����Win7 32λ�Ĳ���,�������ʹ��������װ,���������
    SetShellVarContext all  ; ����adminȨ��,���û���װ,����ݷ�ʽ������alluser�Ŀ�ʼ�˵���. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�

    ; ������ɾ��Ŀ¼����ݷ�ʽ
    ;CreateShortCut "$DESKTOP\Ѹ��PDFת����.lnk" "$INSTDIR\PDF Convert.exe" "" "$INSTDIR\shortcut.ico" ; ������Ϊ��ͬ���ļ���
    ;CreateDirectory "$SMPROGRAMS\Ѹ��PDFת����" ; ������Ϊ��ͬ���ļ���
    ;CreateShortCut "$SMPROGRAMS\Ѹ��PDFת����\ж�� Ѹ��PDFת����.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.ico" ; ������Ϊ��ͬ���ļ���
    ;CreateShortCut "$SMPROGRAMS\Ѹ��PDFת����\Ѹ��PDFת����.lnk" "$INSTDIR\PDF Convert.exe" "" "$INSTDIR\shortcut.ico" ; ������Ϊ��ͬ���ļ���

    CreateShortCut "$DESKTOP\���û�����ר�ñ���.lnk" "$INSTDIR\PDF Convert.exe" "" "$INSTDIR\shortcut.ico" ; ������Ϊ��ͬ���ļ���
    CreateDirectory "$SMPROGRAMS\���û�����ר�ñ���" ; ������Ϊ��ͬ���ļ���
    CreateShortCut "$SMPROGRAMS\���û�����ר�ñ���\ж�� ���û�����ר�ñ���.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.ico" ; ������Ϊ��ͬ���ļ���
    CreateShortCut "$SMPROGRAMS\���û�����ר�ñ���\���û�����ר�ñ���.lnk" "$INSTDIR\PDF Convert.exe" "" "$INSTDIR\shortcut.ico" ; ������Ϊ��ͬ���ļ���

		Sleep 100 ; ����ʱ��(��λΪ:ms) ����
FunctionEnd

; Loading��ɺ���ת����һҳ
Function AutoNextPage
  Call NextPage
FunctionEnd

; ��װ����д��ע�����Ϣ
Function WriteReg
  SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�

  WriteUninstaller "$INSTDIR\uninstall.exe"

  ; HKCUдע���
  WriteRegStr HKCU "Software\pdf2word" INSTDIR $INSTDIR

  ; HKLMдע���(32λ��װ����64λ����ϵͳ�ϻ�д����HKLM\SOFTWARE\Wow6432Node��Ŀ¼��)
  WriteRegStr HKLM "SOFTWARE\pdf2word" INSTDIR "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\pdf2word.exe" "" "$INSTDIR\PDF Convert.exe"

  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "DisplayName" "Ѹ��PDFת����"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "UninstallString" '"$INSTDIR\uninstall.exe"'  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "DisplayIcon" '"$INSTDIR\shortcut.ico"'  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "DisplayVersion" "6.3.0.0"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "Publisher" "�Ϻ�������Ϣ�Ƽ����޹�˾"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "Contact" "Ѹ�� Support Department"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "HelpLink" "http://www.xjpdf.com"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "InstallLocation" "$INSTDIR" ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����" "URLInfoAbout" "http://www.xjpdf.com"  ; ������Ϊ��ͬ���ļ���

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "DisplayName" "���û�����ר�ñ���"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "UninstallString" '"$INSTDIR\uninstall.exe"'  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "DisplayIcon" '"$INSTDIR\shortcut.ico"'  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "DisplayVersion" "6.3.0.0"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "Publisher" "�Ϻ�������Ϣ�Ƽ����޹�˾"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "Contact" "Ѹ�� Support Department"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "HelpLink" "http://www.xjpdf.com"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "InstallLocation" "$INSTDIR" ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���" "URLInfoAbout" "http://www.xjpdf.com"  ; ������Ϊ��ͬ���ļ���

FunctionEnd

Function onClickCloseEnd
    Call GetNetFrameworkVersion ;��ȡ.Net Framework��װ�İ汾��

    Pop $R1
	  ${VersionCompare} "$R1" "2.0.50727" $R6
    ${If} $R6 == 2
      ; �߲ʷ�ԭ����,�Ǻ��õ�,ֻ����"��/��",�����޸�Ϊ"��"(��ÿͻ����˷�)
	    ; MessageBox MB_YESNO|MB_ICONQUESTION "Ѹ��PDFת������Ҫ.NET Framework 2.0���л�������������û�а�װ�˻�����$\r$\n$\r$\n�����Ե�����ǡ����ڰ�װ.NET Framework 2.0���Ժ�����ȥ���������ذ�װ��$\r$\n$\r$\n�Ƿ����ڰ�װ.NET Framework 2.0��" IDYES okrun IDNO norun
	    ; 2015-12-21,֣٩�ָʾ,�Ǹ�.NET��װ�������� YES OR NO����ʾ���㻻�� OK ����ʾ�ͺã�ֱ�ӽ��а�װ����ʡ���û���NO��Ȼ���ò���
	    ;MessageBox MB_OK "Ѹ��PDFת������Ҫ.NET Framework 2.0���л�������������û�а�װ�˻�����$\r$\n$\r$\n�����Ե�����ǡ����ڰ�װ.NET Framework 2.0���Ժ�����ȥ���������ذ�װ��$\r$\n$\r$\n�Ƿ����ڰ�װ.NET Framework 2.0��"  ; ������Ϊ��ͬ���ļ���
	    MessageBox MB_OK "���û�����ר�ñ�����Ҫ.NET Framework 2.0���л�������������û�а�װ�˻�����$\r$\n$\r$\n�����Ե�����ǡ����ڰ�װ.NET Framework 2.0���Ժ�����ȥ���������ذ�װ��$\r$\n$\r$\n�Ƿ����ڰ�װ.NET Framework 2.0��"  ; ������Ϊ��ͬ���ļ���

	    okrun:
		  Call InstallNetFramework2
		  Call GetNetFrameworkVersion ;��ȡ.Net Framework��װ�İ汾��
	    Pop $R1
		  ${VersionCompare} "$R1" "2.0.50727" $R6 ;�ȽϽ��Ϊ0-���,1-ǰ����,2-������

	    ${If} $R6 == 2
		    ;MessageBox MB_ICONINFORMATION "�ܱ�Ǹδ�ܰ����ɹ���װ.NET Framework 2.0�������Ժ�����ȥ���������ذ�װ������Ѹ��PDFת�������޷�����������" IDOK +1  ; ������Ϊ��ͬ���ļ���
		    MessageBox MB_ICONINFORMATION "�ܱ�Ǹδ�ܰ����ɹ���װ.NET Framework 2.0�������Ժ�����ȥ���������ذ�װ��������û�����ר�ñ��⽫�޷�����������" IDOK +1  ; ������Ϊ��ͬ���ļ���

		    Call onClickClose
		    Quit
	    ${Else}
		    ;MessageBox MB_ICONINFORMATION ".NetFramework2.0�Ѿ��ɹ���װ�����Ļ������ˣ�$\r$\n$\r$\n�����ڿ������顰Ѹ��PDFת�������ˡ�" ; ������Ϊ��ͬ���ļ���
		    MessageBox MB_ICONINFORMATION ".NetFramework2.0�Ѿ��ɹ���װ�����Ļ������ˣ�$\r$\n$\r$\n�����ڿ������顰���û�����ר�ñ��⡱�ˡ�" ; ������Ϊ��ͬ���ļ���

		    Call onClickClose
		    Quit
		  ${EndIf}
		  norun:
	    ;MessageBox MB_OK "��������û�а�װ.NET Framework 2.0�����������Ժ�����ȥ���������ذ�װ������Ѹ��PDFת�������޷�����������" IDOK +1  ; ������Ϊ��ͬ���ļ���
	    MessageBox MB_OK "��������û�а�װ.NET Framework 2.0�����������Ժ�����ȥ���������ذ�װ��������û�����ר�ñ��⽫�޷�����������" IDOK +1  ; ������Ϊ��ͬ���ļ���

		  Call onClickClose
		  Quit
    ${EndIF}

	  Call onClickClose
FunctionEnd

Function onClickOpenExe
/*
    Call GetNetFrameworkVersion ;��ȡ.Net Framework��װ�İ汾��

    Pop $R1
	  ${VersionCompare} "$R1" "2.0.50727" $R6
    ${If} $R6 == 2
      ;�߲ʷ�ԭ����,�Ǻ��õ�,ֻ����"��/��",�����޸�Ϊ"��"(��ÿͻ����˷�)
	    ;MessageBox MB_YESNO|MB_ICONQUESTION "Ѹ��PDFת������Ҫ.NET Framework 2.0���л�������������û�а�װ�˻�����$\r$\n$\r$\n�����Ե�����ǡ����ڰ�װ.NET Framework 2.0���Ժ�����ȥ���������ذ�װ��$\r$\n$\r$\n�Ƿ����ڰ�װ.NET Framework 2.0��" IDYES okrun IDNO norun
      ;2015-12-21,֣٩�ָʾ,�Ǹ�.NET��װ�������� YES OR NO����ʾ���㻻�� OK ����ʾ�ͺã�ֱ�ӽ��а�װ����ʡ���û���NO��Ȼ���ò���
	    ;MessageBox MB_OK "Ѹ��PDFת������Ҫ.NET Framework 2.0���л�������������û�а�װ�˻�����$\r$\n$\r$\n�����Ե�����ǡ����ڰ�װ.NET Framework 2.0���Ժ�����ȥ���������ذ�װ��$\r$\n$\r$\n�Ƿ����ڰ�װ.NET Framework 2.0��"  ; ������Ϊ��ͬ���ļ���
	    MessageBox MB_OK "���û�����ר�ñ�����Ҫ.NET Framework 2.0���л�������������û�а�װ�˻�����$\r$\n$\r$\n�����Ե�����ǡ����ڰ�װ.NET Framework 2.0���Ժ�����ȥ���������ذ�װ��$\r$\n$\r$\n�Ƿ����ڰ�װ.NET Framework 2.0��"  ; ������Ϊ��ͬ���ļ���

	    okrun:
		  Call InstallNetFramework2
		  Call GetNetFrameworkVersion ;��ȡ.Net Framework��װ�İ汾��
	    Pop $R1
		  ${VersionCompare} "$R1" "2.0.50727" $R6
	    ${If} $R6 == 2
		    ;MessageBox MB_ICONINFORMATION "�ܱ�Ǹδ�ܰ����ɹ���װ.NET Framework 2.0�������Ժ�����ȥ���������ذ�װ������Ѹ��PDFת�������޷�����������" IDOK +1  ; ������Ϊ��ͬ���ļ���
		    MessageBox MB_ICONINFORMATION "�ܱ�Ǹδ�ܰ����ɹ���װ.NET Framework 2.0�������Ժ�����ȥ���������ذ�װ��������û�����ר�ñ��⽫�޷�����������" IDOK +1  ; ������Ϊ��ͬ���ļ���

		    Call onClickClose
		    Quit
	    ${Else}
		    ;MessageBox MB_ICONINFORMATION ".NetFramework2.0�Ѿ��ɹ���װ�����Ļ������ˣ�$\r$\n$\r$\n�����ڿ������顰Ѹ��PDFת�������ˡ�"  ; ������Ϊ��ͬ���ļ���
		    MessageBox MB_ICONINFORMATION ".NetFramework2.0�Ѿ��ɹ���װ�����Ļ������ˣ�$\r$\n$\r$\n�����ڿ������顰���û�����ר�ñ��⡱�ˡ�"  ; ������Ϊ��ͬ���ļ���

		    ExecShell "" "$INSTDIR\PDF Convert.exe"
		    Call onClickClose
		    Quit
		  ${EndIf}

	   	norun:
	    ;MessageBox MB_OK "��������û�а�װ.NET Framework 2.0�����������Ժ�����ȥ���������ذ�װ������Ѹ��PDFת�������޷�����������" IDOK +1  ; ������Ϊ��ͬ���ļ���
	    MessageBox MB_OK "��������û�а�װ.NET Framework 2.0�����������Ժ�����ȥ���������ذ�װ��������û�����ר�ñ��⽫�޷�����������" IDOK +1  ; ������Ϊ��ͬ���ļ���

		  Call onClickClose
		  Quit
    ${EndIF}
*/
    ExecShell "" "$INSTDIR\PDF Convert.exe"
    Call onClickClose
    ;Sleep 4200 ; ����ʱ��(��λΪ:ms) ����
FunctionEnd

; +��ȡ.Net Framework�汾֧��,��ע����ж�ȡ��ǰ�Ƿ��Ѿ���װ��Net Framework,��װ�����ĸ��汾
Function GetNetFrameworkVersion
    Push $1
    Push $0
    ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" "Install"
    ReadRegDWORD $1 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" "Version"
    StrCmp $0 1 KnowNetFrameworkVersion +1
    ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5" "Install"
    ReadRegDWORD $1 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.5" "Version"
    StrCmp $0 1 KnowNetFrameworkVersion +1
    ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.0\Setup" "InstallSuccess"
    ReadRegDWORD $1 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v3.0\Setup" "Version"
    StrCmp $0 1 KnowNetFrameworkVersion +1
    ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727" "Install"
    ReadRegDWORD $1 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v2.0.50727" "Version"
    StrCmp $1 "" +1 +2
    StrCpy $1 "2.0.50727.832"
    StrCmp $0 1 KnowNetFrameworkVersion +1
    ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v1.1.4322" "Install"
    ReadRegDWORD $1 HKLM "SOFTWARE\Microsoft\NET Framework Setup\NDP\v1.1.4322" "Version"
    StrCmp $1 "" +1 +2
    StrCpy $1 "1.1.4322.573"
    StrCmp $0 1 KnowNetFrameworkVersion +1
    ReadRegDWORD $0 HKLM "SOFTWARE\Microsoft\.NETFramework\policy\v1.0" "Install"
    ReadRegDWORD $1 HKLM "SOFTWARE\Microsoft\.NETFramework\policy\v1.0" "Version"
    StrCmp $1 "" +1 +2
    StrCpy $1 "1.0.3705.0"
    StrCmp $0 1 KnowNetFrameworkVersion +1
    StrCpy $1 "not .NetFramework"
    KnowNetFrameworkVersion:
    Pop $0
    Exch $1
FunctionEnd

; WinXP��32λ��Ҫ��װ.Net Framework 2.0 SP2
Function InstallNetFramework2
/*
	;SilentInstall normal|silent|silentlog ;2015-12-21,KongMengyuan����,��Ĭ��װ,�����������Ǵ����,���ܷ���Function��,�������Section����
  SetOutPath "$TEMP"
  File "Files\NetFx20SP2_x86.exe"
  ; �߲ʷ���ԭʼ����,������װ(����ʾ)
  ;ExecWait '$TEMP\NetFx20SP2_x86.exe /norestart' $R1

	; Ĭ�ϰ�װ
	; ��������д������Framework�İ�װ���Ǵ����,������ͨ��Setup.exe����д������ȷ��
  ;ExecWait '$TEMP\NetFx20SP2_x86.exe /quiet /norestart' $R1
  ;ExecWait '$TEMP\NetFx20SP2_x86.exe /S' $R1
  ;2015-12-21,KongMengyuan�޸�,��ɾ�Ĭ��װ(û����ʾ),΢��Ĺٷ�framework�ľ�Ĭ��װ����Ϊ  dotnetfx.exe /q:a /c:"install /q" ��������������ŵ�InstallScript�оͱ���������ŵ�ת�����
  ;Nsis��Ĭ��װFrameWork
  ;.NETFramework 2.0
	;dotnetfx.exe /Q:U /C:"install /L /QB"
	;.NETFramework 2.0 sp2
	;dotnetfx.exe /QB /norestart
  ;ExecWait '$TEMP\NetFx20SP2_x86.exe /q:a /c:"install /q"' $R1 ; ��װ.Net2.0����������FrameWork,������������Լ���˫����
  ExecWait '$TEMP\NetFx20SP2_x86.exe /QB /norestart' $R1 ; ��װ.Net2.0 SP2

  ClearErrors
  Delete "$TEMP\NetFx20SP2_x86.exe"
*/
FunctionEnd

/*
; WinXP��64λ��Ҫ��װ.Net Framework 2.0 SP2 64λ,����ļ��е��,��48.524296MB(��ʾ46.2MB),�����Ǵ����һ����,2015-12-21
Function InstallNetFramework2_64
  SetOutPath "$TEMP"
  File "Files\NetFx20SP2_x64.exe"
  ExecWait '$TEMP\NetFx20SP2_x64.exe /QB /norestart' $R1 ; ��װ.Net2.0 SP2 64λ

  ClearErrors
  Delete "$TEMP\NetFx20SP2_x64.exe"
FunctionEnd
*/

Function SetInstallLabel
  IntCmp $R9 0 0 Move Move
  	StrCmp $R9 "X" 0 Move
  		StrCpy $R9 "120"
  Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

; �ѵ�ǰ��װ��������д��set.ini,�����ϴ���php��վͳ��
Function WriteIniSetupName
	; �õ���ǰʱ��,ϵͳʱ��,ϵͳ��ǰʱ��
	System::Call '*(&i2,&i2,&i2,&i2,&i2,&i2,&i2,&i2)i.s'
	System::Call /NOUNLOAD 'kernel32::GetLocalTime(isr0)'
	System::Call '*$0(&i2.r1,&i2.r2,&i2,&i2.r3,&i2.r4,&i2.r5,&i2,&i2)'
	System::Free $0
	IntFmt $1 "%0.4d" $1
	IntFmt $2 "%0.2d" $2
	IntFmt $3 "%0.2d" $3
	IntFmt $4 "%0.2d" $4
	IntFmt $5 "%0.2d" $5
	;DetailPrint "datetime=$1$2$3$4$5"

  ;File /oname=$EXEDIR\set.ini "ini_test.ini" ; ��ǰĿ¼
  ;File /oname=$INSTDIR\set.ini "set.ini" ; ��װĿ¼
  ;WriteINIStr "$EXEDIR\ini_test.ini" "Field 1" "Test111" "����ini�޸� datetime=$1��$2��$3��$4ʱ$5��"
  ;ReadINIStr ${TEMP1} "$EXEDIR\ini_test.ini" "Field 1" "Test111"

  WriteINIStr "$INSTDIR\set.ini" "Install" "SetupName" $EXEFILE ; д�밲װ���ļ���,д��ini�ļ�
FunctionEnd

; ����ѡ�������д��config.ini
Function WriteIniLanguage
; "$INSTDIR\config.ini"
	; �õ���ǰʱ��,ϵͳʱ��,ϵͳ��ǰʱ��
	System::Call '*(&i2,&i2,&i2,&i2,&i2,&i2,&i2,&i2)i.s'
	System::Call /NOUNLOAD 'kernel32::GetLocalTime(isr0)'
	System::Call '*$0(&i2.r1,&i2.r2,&i2,&i2.r3,&i2.r4,&i2.r5,&i2,&i2)'
	System::Free $0
	IntFmt $1 "%0.4d" $1
	IntFmt $2 "%0.2d" $2
	IntFmt $3 "%0.2d" $3
	IntFmt $4 "%0.2d" $4
	IntFmt $5 "%0.2d" $5
	;DetailPrint "datetime=$1$2$3$4$5"

  ;File /oname=$EXEDIR\set.ini "ini_test.ini" ; ��ǰĿ¼
  ;File /oname=$INSTDIR\set.ini "set.ini" ; ��װĿ¼
  ;WriteINIStr "$EXEDIR\ini_test.ini" "Field 1" "Test111" "����ini�޸� datetime=$1��$2��$3��$4ʱ$5��"
  ;ReadINIStr ${TEMP1} "$EXEDIR\ini_test.ini" "Field 1" "Test111"

  WriteINIStr "$INSTDIR\config.ini" "App" "language" $LanSelect ; д�밲װ����,����ѡ��,zh-CN���ļ���,en English,ja�ձ��Z,zh-TW���ķ��w
FunctionEnd

; �����Ǻ����Ķ��廹�Ǻ����ĵ��ö�û�в������ݡ�ͨ��nsi�Ĳ���������ͨ����ջ����Pop,Push��20���Ĵ�������~, $R0~$R9���еġ�Ҳ����ͨ��ȫ�ֱ�����ɲ������ݡ�
; ��ӭ����
Function WelcomePage
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}

    nsDialogs::Create 1044
    Pop $0
    ${If} $0 == error
      Abort
    ${EndIf}
    SetCtlColors $0 ""  transparent ; �������͸��

    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; �ı䴰���С554,384/554,534
    ${NSW_SetWindowSize} $0 554 534 ; �ı�Page��С

    nsDialogs::CreateControl "RichEdit20A" \
    ${ES_READONLY}|${WS_VISIBLE}|${WS_CHILD}|${WS_TABSTOP}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_WANTRETURN} \
		${WS_EX_STATICEDGE}  3 387 548 144 ''
    Pop $Txt_License
		${LoadRTF} '$PLUGINSDIR\license.rtf' $Txt_License

		; ������װ
    ${NSD_CreateButton} 187 293 180 50 ""
    Pop $Btn_Install
	  StrCpy $1 $Btn_Install
	  Call SkinBtn_Btn_Install
	  StrCpy $Bool_NetFramework 0
	  GetFunctionAddress $3 onClickInstall
    SkinBtn::onClick $1 $3

    ; Checkbox
		${NSD_CreateButton} 15 356 15 15 ""
    Pop $Btn_Checkbox
	  StrCpy $1 $Btn_Checkbox
	  Call SkinBtn_Checked
	  GetFunctionAddress $3 OnClickCheckbox
    SkinBtn::onClick $1 $3
    StrCpy $Bool_Checkbox 1

    ; ע��˴�����ַ�������,��ͺ����"�û����Э��"�ص�,Ҫ�޸ĵ�3������
		; �߲ʷ�����
		;${NSD_CreateLabel} 37 358 180 14 "ͬ��Ѹ��PDFת����"
		;${NSD_CreateLabel} 40 358 30 14 "ͬ��" ; ������Ϊ��ͬ���ļ���,x y width height text,ע���3������,����Ӱ�����ġ��û����Э�顱���,���ó�Ϊ������ַ����
		${NSD_CreateLabel} 40 358 30 14 "ͬ��"  ; ������Ϊ��ͬ���ļ���,x y width height text,ע���3������,����Ӱ�����ġ��û����Э�顱���,���ó�Ϊ������ַ����

    Pop $Lbl_Agree
    SetCtlColors $Lbl_Agree ""  transparent ; �������͸��

		; ���Э��?
		; ע��ǰ����ַ���"ͬ�⡣����"�������,��ͺ����"�û����Э��"�ص�,Ҫ�޸ĵ�1������
		; �߲ʷ�����
		;${NSD_CreateButton} 190 349 76 30 ""
		${NSD_CreateButton} 63 349 76 30 "" ; x y width height text
    Pop $Btn_Agreen
	  StrCpy $1 $Btn_Agreen
	  Call SkinBtn_Btn_Agree
	  GetFunctionAddress $3 onClickAgreement
    SkinBtn::onClick $1 $3
    StrCpy $Bool_License 0

    ; �Զ��尲װ
		${NSD_CreateButton} 458 349 86 30 ""
    Pop $Btn_Custom_Install
	  StrCpy $1 $Btn_Custom_Install
	  Call SkinBtn_Custom_Install1
	  GetFunctionAddress $3 onClickCustomInstall
    SkinBtn::onClick $1 $3
    StrCpy $Bool_Custom 0

    ; ��װλ�ñ�ǩ
    ${NSD_CreateLabel} 16 403 65 14 "��װλ�ã�"
    Pop $Lbl_Install_Position
    SetCtlColors $Lbl_Install_Position ""  transparent ; �������͸��

		; ����Ŀ¼�ؼ�����
		; �߲ʷ�����
	  ;${NSD_CreateDirRequest} 78 395 388 30 "$INSTDIR"
	  ${NSD_CreateDirRequest} 78 400 388 20 "$INSTDIR"
 	  Pop	$Txt_Browser
 	  ;EnableWindow $Txt_Browser 0
 	  ${NSD_OnChange} $Txt_Browser OnChangeDirRequest

 	  ; �����ť?
		${NSD_CreateButton} 468 395 74 30 ""
 	  Pop	$Btn_Browser
 	  ;MessageBox MB_OK "Btn_Browser:$Btn_Browser"
 	  StrCpy $1 $Btn_Browser
	  Call SkinBtn_Browser
	  GetFunctionAddress $3 OnClickBrowse
    SkinBtn::onClick $1 $3

    ; �رհ�ť
    ${NSD_CreateButton} 534 0 20 20 ""
    Pop $Btn_Close
	  StrCpy $1 $Btn_Close
	  Call SkinBtn_Btn_Close
	  GetFunctionAddress $3 onClickClose
    SkinBtn::onClick $1 $3

    ; Bannerͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BannerImage
    ${NSD_SetImage} $BannerImage $PLUGINSDIR\banner1.bmp $ImageHandle

    ; ��������ͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BgImage
    ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BannerImage $0 ; �����ޱ߿����ƶ�
    WndProc::onCallback $BgImage $0 ; �����ޱ߿����ƶ�
    nsDialogs::Show

    ${NSD_FreeImage} $ImageHandle
FunctionEnd

Function LoadingPage
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}

    nsDialogs::Create 1044
    Pop $0
    ${If} $0 == error
      Abort
    ${EndIf}
    SetCtlColors $0 ""  transparent ; �������͸��?

    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; �ı䴰���С?
    ${NSW_SetWindowSize} $0 554 534 ; �ı�Page��С

    ;���ڰ�װ
    ;${NSD_CreateLabel} 27 308 65 14 "���ڰ�װ" ; 27 308 65 14 ����Ϊ ���,����,����,�߶�,�������Ȳ����Զ�����
    ${NSD_CreateLabel} 27 308 100% 14 "���ڰ�װ, �����ĵȺ�..." ; 27 308 65 14 ����Ϊ ���,����,����,�߶�,�������Ȼ��Զ�����
    Pop $Lbl_Inatalling
    SetCtlColors $Lbl_Inatalling ""  transparent ; �������͸��?

		;�������ؼ�
		${NSD_CreateProgressBar} 27 332 500 7 ""
    Pop $PB_ProgressBar
    SkinProgress::Set $PB_ProgressBar "$PLUGINSDIR\loading2.bmp" "$PLUGINSDIR\loading1.bmp"
    GetFunctionAddress $0 NSD_TimerFun
    nsDialogs::CreateTimer $0 1

    ;�رհ�ť
    ${NSD_CreateButton} 534 0 20 20 ""
    Pop $Btn_Close
	  StrCpy $1 $Btn_Close
	  Call SkinBtn_Btn_Close
	  GetFunctionAddress $3 onClickClose
    SkinBtn::onClick $1 $3

    ;Bannerͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BannerImage
    ${NSD_SetImage} $BannerImage $PLUGINSDIR\banner2.bmp $ImageHandle

    ;��������ͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BgImage
    ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BannerImage $0 ;�����ޱ߿����ƶ�
    WndProc::onCallback $BgImage $0 ;�����ޱ߿����ƶ�
    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
FunctionEnd

Function CompletePage
    GetDlgItem $0 $HWNDPARENT 1
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 2
    ShowWindow $0 ${SW_HIDE}
    GetDlgItem $0 $HWNDPARENT 3
    ShowWindow $0 ${SW_HIDE}

    nsDialogs::Create 1044
    Pop $0
    ${If} $0 == error
      Abort
    ${EndIf}
    SetCtlColors $0 ""  transparent ; �������͸��?

    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; �ı䴰���С?
    ${NSW_SetWindowSize} $0 554 534 ; �ı�Page��С

	  Call WriteIniSetupName ; �ѵ�ǰ��װ��������д��set.ini,�����ϴ���php��վͳ��
    ;ExecShell "open" "http://url.pdfconvert.com/1/buy/welcome/" ; �����װ��ɺ󣬵�������
    
	  Call WriteIniLanguage ; ����ѡ�������д��config.ini

    ;��������
    ${NSD_CreateButton} 187 293 180 50 ""
    Pop $Btn_Open_Exe
	  StrCpy $1 $Btn_Open_Exe
	  Call SkinBtn_Open_Exe
	  GetFunctionAddress $3 onClickOpenExe
    SkinBtn::onClick $1 $3

    ;�رհ�ť
    ${NSD_CreateButton} 534 0 20 20 ""
    Pop $Btn_Close
	  StrCpy $1 $Btn_Close
	  Call SkinBtn_Btn_Close
	  ;GetFunctionAddress $3 onClickCloseEnd ;�ر�֮����ȥ���NetFramework�Ƿ�װ.2015-12-22,KongMengyuan�޸�,�ָ�Ϊ�ڰ�װ�������Զ����ذ�װ
    SkinBtn::onClick $1 $3

    ;Bannerͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BannerImage
    ${NSD_SetImage} $BannerImage $PLUGINSDIR\banner3.bmp $ImageHandle

    ;��������ͼ
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BgImage
    ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BannerImage $0 ;�����ޱ߿����ƶ�
    WndProc::onCallback $BgImage $0 ;�����ޱ߿����ƶ�
    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
    ;ExecShell "open" "http://url.huifudashi.com/1/buy/welcome/" ;�Զ�������ַ,�����װ��ɺ�,��������
FunctionEnd

;-----------------------------���²�����ж��ʹ�õ�-------------------------------------------------------

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#
;���԰�����õ���� Section Install ֮��,����ֻҪ���õ�Function����֮��Ϳ�����
Section Uninstall
SectionEnd

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Function un.onInit
  Call un.Createpdf2wordMutex
  InitPluginsDir
  File `/ONAME=$PLUGINSDIR\banner4.bmp` `images\banner4.bmp`
  File `/ONAME=$PLUGINSDIR\bg2.bmp` `images\bg2.bmp`

  File `/ONAME=$PLUGINSDIR\btn_uninstall.bmp` `images\btn_uninstall.bmp`
  File `/ONAME=$PLUGINSDIR\btn_wrong.bmp` `images\btn_wrong.bmp`
  File `/ONAME=$PLUGINSDIR\unclose.bmp` `images\unclose.bmp`

  SkinBtn::Init "$PLUGINSDIR\btn_uninstall.bmp"
  SkinBtn::Init "$PLUGINSDIR\btn_wrong.bmp"
  SkinBtn::Init "$PLUGINSDIR\unclose.bmp"
FunctionEnd

Function un.Createpdf2wordMutex
	#��鰲װ���⣺#
	ReCheck:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_Install}") i .R1 ?e'
	Pop $R0
	System::Call 'kernel32::CloseHandle(i R1) i.s'
	#���ж�ػ��⣺#
	CheckUnInstall:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_UnInstall}") i .R3 ?e'
	Pop $R2
	System::Call 'kernel32::CloseHandle(i R3) i.s'
	#�жϰ�װ/ж�ػ���Ĵ���#
	${If} $R0 != 0
		MessageBox MB_RetryCancel|MB_ICONEXCLAMATION "��װ�����������У�" IdRetry ReCheck
		Quit
	${ElseIf} $R2 != 0
		MessageBox MB_RetryCancel|MB_ICONEXCLAMATION "ж�س����Ѿ����У�" IdRetry ReCheck
		Quit
	${Else}
		#����ж�ػ��⣺#
		System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_UnInstall}") i .R1 ?e'
		Pop $R0
		StrCmp $R0 0 +2
		Quit
	${EndIf}
FunctionEnd

Function un.unonGUIInit
	;�����߿�
	System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
	;����һЩ���пؼ�
	GetDlgItem $0 $HWNDPARENT 1034
	ShowWindow $0 ${SW_HIDE}
	GetDlgItem $0 $HWNDPARENT 1035
	ShowWindow $0 ${SW_HIDE}
	GetDlgItem $0 $HWNDPARENT 1036
	ShowWindow $0 ${SW_HIDE}
	GetDlgItem $0 $HWNDPARENT 1037
	ShowWindow $0 ${SW_HIDE}
	GetDlgItem $0 $HWNDPARENT 1038
	ShowWindow $0 ${SW_HIDE}
	GetDlgItem $0 $HWNDPARENT 1039
	ShowWindow $0 ${SW_HIDE}
	GetDlgItem $0 $HWNDPARENT 1256
	ShowWindow $0 ${SW_HIDE}
	GetDlgItem $0 $HWNDPARENT 1028
	ShowWindow $0 ${SW_HIDE}
FunctionEnd

;�����ޱ߿��ƶ�
Function un.onGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

;��ͼ
Function un.SkinBtn_Btn_Uninstall
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_uninstall.bmp $1
FunctionEnd

Function un.SkinBtn_Wrong
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_wrong.bmp $1
FunctionEnd

Function un.SkinBtn_Btn_Close
  SkinBtn::Set /IMGID=$PLUGINSDIR\unclose.bmp $1
FunctionEnd

;������Ͻǹرհ�ť?
Function un.onClickClose
  FindProcDLL::FindProc "Au_.exe"
  Sleep 500 ; ����ʱ��(��λΪ:ms) ����
  Pop $R0
  ${If} $R0 != 0
	  KillProcDLL::KillProc "Au_.exe"
  ${EndIf}
FunctionEnd

;�����?
Function un.onClickWrong
  FindProcDLL::FindProc "Au_.exe"
  Sleep 500 ; ����ʱ��(��λΪ:ms) ����
  Pop $R0
  ${If} $R0 != 0
	  KillProcDLL::KillProc "Au_.exe"
  ${EndIf}
FunctionEnd

/******************************
 *  �����ǰ�װ�����ж�ز���  *
 ******************************/
Function un.uninstall
  SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
  ;Delete "$INSTDIR\*.*"   ; ������������������г���ȫ��ɾ��(����ͻ�װ��WinXP������Ļ�)
  Delete "$INSTDIR\config.ini"
  Delete "$INSTDIR\set.ini"
  Delete "$INSTDIR\Aspose.Total.lic"
  Delete "$INSTDIR\PDF Convert.vshost.exe.manifest"
  Delete "$INSTDIR\PDF Convert.exe"
  Delete "$INSTDIR\PDF Convert.vshost.exe"
  Delete "$INSTDIR\Aspose.Cells.dll"
  Delete "$INSTDIR\Aspose.Pdf.dll"
  Delete "$INSTDIR\Aspose.Slides.dll"
  Delete "$INSTDIR\Aspose.Words.dll"
  Delete "$INSTDIR\Controls.dll"
  Delete "$INSTDIR\*.ico"
  Delete "$INSTDIR\uninstall.exe"

  Delete "$INSTDIR\ar\*.*"
  RMDir "$INSTDIR\ar"

  Delete "$INSTDIR\en\ClearListTips01\*.*"
  RMDir "$INSTDIR\en\ClearListTips01"
  Delete "$INSTDIR\en\frmAutoUpdate01\*.*"
  RMDir "$INSTDIR\en\frmAutoUpdate01"
  Delete "$INSTDIR\en\frmMain01Setting01\*.*"
  RMDir "$INSTDIR\en\frmMain01Setting01"
  Delete "$INSTDIR\en\frmMain01Setting02\*.*"
  RMDir "$INSTDIR\en\frmMain01Setting02"
  Delete "$INSTDIR\en\frmMain01Setting03\*.*"
  RMDir "$INSTDIR\en\frmMain01Setting03"
  Delete "$INSTDIR\en\frmSplash\*.*"
  RMDir "$INSTDIR\en\frmSplash"
  Delete "$INSTDIR\en\MainInfo01\*.*"
  RMDir "$INSTDIR\en\MainInfo01"
  Delete "$INSTDIR\en\PassWordDlg01\*.*"
  RMDir "$INSTDIR\en\PassWordDlg01"
  Delete "$INSTDIR\en\RegDlg01\*.*"
  RMDir "$INSTDIR\en\RegDlg01"
  Delete "$INSTDIR\en\RegTips01\*.*"
  RMDir "$INSTDIR\en\RegTips01"
  Delete "$INSTDIR\en\*.*"
  RMDir "$INSTDIR\en"

  Delete "$INSTDIR\zh-TW\ClearListTips01\*.*"
  RMDir "$INSTDIR\zh-TW\ClearListTips01"
  Delete "$INSTDIR\zh-TW\frmAutoUpdate01\*.*"
  RMDir "$INSTDIR\zh-TW\frmAutoUpdate01"
  Delete "$INSTDIR\zh-TW\frmMain01Setting01\*.*"
  RMDir "$INSTDIR\zh-TW\frmMain01Setting01"
  Delete "$INSTDIR\zh-TW\frmMain01Setting02\*.*"
  RMDir "$INSTDIR\zh-TW\frmMain01Setting02"
  Delete "$INSTDIR\zh-TW\frmMain01Setting03\*.*"
  RMDir "$INSTDIR\zh-TW\frmMain01Setting03"
  Delete "$INSTDIR\zh-TW\frmSplash\*.*"
  RMDir "$INSTDIR\zh-TW\frmSplash"
  Delete "$INSTDIR\zh-TW\MainInfo01\*.*"
  RMDir "$INSTDIR\zh-TW\MainInfo01"
  Delete "$INSTDIR\zh-TW\PassWordDlg01\*.*"
  RMDir "$INSTDIR\zh-TW\PassWordDlg01"
  Delete "$INSTDIR\zh-TW\RegDlg01\*.*"
  RMDir "$INSTDIR\zh-TW\RegDlg01"
  Delete "$INSTDIR\zh-TW\RegTips01\*.*"
  RMDir "$INSTDIR\zh-TW\RegTips01"
  Delete "$INSTDIR\zh-TW\*.*"
  RMDir "$INSTDIR\zh-TW"

  Delete "$INSTDIR\ja\ClearListTips01\*.*"
  RMDir "$INSTDIR\ja\ClearListTips01"
  Delete "$INSTDIR\ja\frmAutoUpdate01\*.*"
  RMDir "$INSTDIR\ja\frmAutoUpdate01"
  Delete "$INSTDIR\ja\frmMain01Setting01\*.*"
  RMDir "$INSTDIR\ja\frmMain01Setting01"
  Delete "$INSTDIR\ja\frmMain01Setting02\*.*"
  RMDir "$INSTDIR\ja\frmMain01Setting02"
  Delete "$INSTDIR\ja\frmMain01Setting03\*.*"
  RMDir "$INSTDIR\ja\frmMain01Setting03"
  Delete "$INSTDIR\ja\frmSplash\*.*"
  RMDir "$INSTDIR\ja\frmSplash"
  Delete "$INSTDIR\ja\MainInfo01\*.*"
  RMDir "$INSTDIR\ja\MainInfo01"
  Delete "$INSTDIR\ja\PassWordDlg01\*.*"
  RMDir "$INSTDIR\ja\PassWordDlg01"
  Delete "$INSTDIR\ja\RegDlg01\*.*"
  RMDir "$INSTDIR\ja\RegDlg01"
  Delete "$INSTDIR\ja\RegTips01\*.*"
  RMDir "$INSTDIR\ja\RegTips01"
  Delete "$INSTDIR\ja\*.*"
  RMDir "$INSTDIR\ja"

  Delete "$INSTDIR\zh-CN\ClearListTips01\*.*"
  RMDir "$INSTDIR\zh-CN\ClearListTips01"
  Delete "$INSTDIR\zh-CN\frmAutoUpdate01\*.*"
  RMDir "$INSTDIR\zh-CN\frmAutoUpdate01"
  Delete "$INSTDIR\zh-CN\frmMain01Setting01\*.*"
  RMDir "$INSTDIR\zh-CN\frmMain01Setting01"
  Delete "$INSTDIR\zh-CN\frmMain01Setting02\*.*"
  RMDir "$INSTDIR\zh-CN\frmMain01Setting02"
  Delete "$INSTDIR\zh-CN\frmMain01Setting03\*.*"
  RMDir "$INSTDIR\zh-CN\frmMain01Setting03"
  Delete "$INSTDIR\zh-CN\frmSplash\*.*"
  RMDir "$INSTDIR\zh-CN\frmSplash"
  Delete "$INSTDIR\zh-CN\MainInfo01\*.*"
  RMDir "$INSTDIR\zh-CN\MainInfo01"
  Delete "$INSTDIR\zh-CN\PassWordDlg01\*.*"
  RMDir "$INSTDIR\zh-CN\PassWordDlg01"
  Delete "$INSTDIR\zh-CN\RegDlg01\*.*"
  RMDir "$INSTDIR\zh-CN\RegDlg01"
  Delete "$INSTDIR\zh-CN\RegTips01\*.*"
  RMDir "$INSTDIR\zh-CN\RegTips01"
  Delete "$INSTDIR\zh-CN\*.*"
  RMDir "$INSTDIR\zh-CN"

  Delete "$INSTDIR\images\Menu\*.*"
  RMDir "$INSTDIR\images\Menu"
  Delete "$INSTDIR\images\*.*"
  RMDir "$INSTDIR\images"

  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\pdf2word"
  DeleteRegKey /ifempty HKLM "Software\pdf2word"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\pdf2word.exe"

  ;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Ѹ��PDFת����"; ������Ϊ��ͬ���ļ���
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\���û�����ר�ñ���"; ������Ϊ��ͬ���ļ���

  ;SetShellVarContext current ;�߲ʷ�ԭʼ����.����һ��Ҫʹ�õ�ǰ�û�,����Win7 32λ�Ĳ���,�������ʹ��������װ,���������
  SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�

	;Delete "$DESKTOP\Ѹ��PDFת����.lnk"; ������Ϊ��ͬ���ļ���
  ;Delete "$SMPROGRAMS\Ѹ��PDFת����\Ѹ��PDFת����.lnk"; ������Ϊ��ͬ���ļ���
  ;Delete "$SMPROGRAMS\Ѹ��PDFת����\ж�� Ѹ��PDFת����.lnk"; ������Ϊ��ͬ���ļ���
  ;RMDir "$SMPROGRAMS\Ѹ��PDFת����"; ������Ϊ��ͬ���ļ���

  Delete "$DESKTOP\���û�����ר�ñ���.lnk"; ������Ϊ��ͬ���ļ���
  Delete "$SMPROGRAMS\���û�����ר�ñ���\���û�����ר�ñ���.lnk"; ������Ϊ��ͬ���ļ���
  Delete "$SMPROGRAMS\���û�����ר�ñ���\ж�� ���û�����ר�ñ���.lnk"; ������Ϊ��ͬ���ļ���
  RMDir "$SMPROGRAMS\���û�����ר�ñ���"; ������Ϊ��ͬ���ļ���

  ;MessageBox MB_OK "Ѹ��PDFת�����Ѿ������ĵ������Ƴ���"  ; ������Ϊ��ͬ���ļ���
  MessageBox MB_OK "���û�����ר�ñ����Ѿ������ĵ������Ƴ���"  ; ������Ϊ��ͬ���ļ���

  KillProcDLL::KillProc "Au_.exe"
  ;ExecShell "open" "http://url.huifudashi.com/1/buy/discount/" ;�Զ�������ַ,���ж��ʱ,��������
FunctionEnd

Function un.onClickUninstall
  ExecShell "open" "http://www.xjpdf.com/software/pdfConvert/uninstall/" ; ���ж��ʱ����������
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��鿴�Żݻ���Ƿ���Ȼж�ر������"  IDYES +3 IDNO +1
  KillProcDLL::KillProc "Au_.exe"
  Quit

  ${nsProcess::FindProcess} "PDF Convert.exe" $R0
  ${nsProcess::Unload}
  ${If} $R0 == 0
		;MessageBox MB_OKCANCEL "Ѹ��PDFת�����������У����'ȷ��'ǿ�ƹر�Ѹ��PDFת����������ж�أ����'ȡ��'�˳�ж�ء�" IDOK yes_uninstall IDCANCEL no_uninstall ; ������Ϊ��ͬ���ļ���
		MessageBox MB_OKCANCEL "���û�����ר�ñ����������У����'ȷ��'ǿ�ƹرն��û�����ר�ñ��Ⲣ����ж�أ����'ȡ��'�˳�ж�ء�" IDOK yes_uninstall IDCANCEL no_uninstall ; ������Ϊ��ͬ���ļ���

		yes_uninstall:
		  ${nsProcess::KillProcess} "PDF Convert.exe" $R1
			${nsProcess::Unload}
			Sleep 500 ; ����ʱ��(��λΪ:ms) ����
			Call un.uninstall
			Quit
		no_uninstall:
	    KillProcDLL::KillProc "Au_.exe"
	    Quit
	${Else}
		Call un.uninstall
	${EndIf}
FunctionEnd

Function un.UninstallPage
  GetDlgItem $0 $HWNDPARENT 1
  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $0 $HWNDPARENT 2
  ShowWindow $0 ${SW_HIDE}
  GetDlgItem $0 $HWNDPARENT 3
  ShowWindow $0 ${SW_HIDE}

  nsDialogs::Create 1044
  Pop $0
  ${If} $0 == error
	  Abort
  ${EndIf}
  SetCtlColors $0 ""  transparent ; �������͸��?

  ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; �ı䴰���С
  ${NSW_SetWindowSize} $0 554 534 ; �ı�Page��С

  ; ����ж��
  ${NSD_CreateButton} 326 340 94 30 ""
  Pop $Btn_Uninstall
  StrCpy $1 $Btn_Uninstall
  Call un.SkinBtn_Btn_Uninstall
  GetFunctionAddress $3 un.onClickUninstall
  SkinBtn::onClick $1 $3
  StrCpy $Bool_Uninstall 0

  ; �����?
  ${NSD_CreateButton} 439 340 94 30 ""
  Pop $Btn_Wrong
  StrCpy $1 $Btn_Wrong
  Call un.SkinBtn_Wrong
  GetFunctionAddress $3 un.onClickWrong
  SkinBtn::onClick $1 $3

  ; �رհ�ť
  ${NSD_CreateButton} 534 0 20 20 ""
  Pop $Btn_Close
  StrCpy $1 $Btn_Close
  Call un.SkinBtn_Btn_Close
  GetFunctionAddress $3 un.onClickClose
  SkinBtn::onClick $1 $3

  ; Bannerͼ
  ${NSD_CreateBitmap} 0 0 100% 100% ""
  Pop $BannerImage
  ${NSD_SetImage} $BannerImage $PLUGINSDIR\banner4.bmp $ImageHandle

  ; ��������ͼ
  ${NSD_CreateBitmap} 0 0 100% 100% ""
  Pop $BgImage
  ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

  GetFunctionAddress $0 un.onGUICallback
  WndProc::onCallback $BannerImage $0 ; �����ޱ߿����ƶ�
  WndProc::onCallback $BgImage $0 ; �����ޱ߿����ƶ�
  nsDialogs::Show
  ${NSD_FreeImage} $ImageHandle
FunctionEnd
