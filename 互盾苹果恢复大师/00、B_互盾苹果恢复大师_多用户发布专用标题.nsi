; ����ƻ���ָ���ʦ ���û�����ר�ñ� ��   ����������һ���ո�,���滻��
/*
  ��װ��������Ҫ��
  1���Ѱ�װ���ļ���д��set.ini��Ȼ��ÿ���������ʱ�Զ��ϱ�,��װ��ɺ�Ҫ��дset.ini ��д�밲װ���ļ���,���Ƕ�ȡ���û���ǰ���ļ�����ɶ����д��ɶ,������֤������ֻ��Ҫ�����ļ���,����ʵ�ֶԲ�ͬ��Դ������ͳ��
  2������4��ͼƬ��banner1.bmp,banner2.bmp,banner3.bmp,banner4.bmp
  3������License�ļ���license.rtf
  4��ɾ��������ļ���ͼ��
  5����װĿ¼ʹ�ù̶�Ӣ��Ŀ¼
  6����װ�����ļ�����ͼ����ַ(ɾ����װ��ʱ���Կ����汾�ź���ַ)
  7��"ͬ�����Э��"�Ƿ��ص�(�鿴����ļ���)
  8����װһ��,��������,���ر��ٰ�װ,��ǰ�򿪵�ִ���ļ����Զ��ر�
  9���޸İ�װ���ļ�������ݷ�ʽ����,exe��dllҪǩ��,��װ��Ҫǩ��
	10�������װ��ɺ󣬵������� http://url.huifudashi.com/1/buy/welcome/
	11�����ж��ʱ���������� http://url.huifudashi.com/1/buy/discount/
	
	����˵�������ڡ�����ƻ���ָ���ʦ��ԭ����û�а�UAC���ι�ȥ(û����PDFת����,KongMengyuan���������),����ֻ���ڰ�װ��ʱʹ��SetShellVarContext all������SetShellVarContext current,�����Ļ����ǳ���ִ��ʱ����һ����ʾ(������PDFת����������һֱ��UAC���ε÷ǳ���)��ͬʱӰ�������У�
						ʹ��RequestExecutionLevel admin������RequestExecutionLevel user
						ʹ��SetShellVarContext all������SetShellVarContext current
						�ô���һֱ��������״ΰ�װ��PDFת������֮���������顱�ļ�������������⣬����Ϊ��SetShellVarContext current���ͽ�����ˣ�����һ������ľ�ϲ

  ��װ�ļ�����б��,����"ע��˴����ļ����Ƶ��޸�"

  �������ݲ��ҡ�������Ϊ��ͬ���ļ�����,�޸Ķ�Ӧ���ļ���
  ----------
  �������Щ����:
  ����ͼ�겻�ñ䣬��������(�����ڡ����������ϵĿ������)�����򶥲�������(������Image,��ʽ��header_01.png ��Ѱ�header_02.png,��Ҫ������ͼ)����װ�����֣���װ����ݷ�ʽ ��Ӧ�仯
  01������ƻ���ָ���ʦ           (��������,��Ĭ���Ƿ����)
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

;---------------------------ȫ�ֱ���ű�Ԥ����ĳ���-----------------------------------------------------
; MUI Ԥ���峣��
!define MUI_ABORTWARNING
; ��װͼ���·������
!define MUI_ICON "images\install.ico"
; ж��ͼ���·������
!define MUI_UNICON "images\uninstall.ico"
; ��ƷЭ�����·������
;!define MUI_PAGE_LICENSE_RTY "license\license.rtf"
!define MUI_PAGE_LICENSE_RTY "0_license_����ƻ���ָ���ʦ\license.rtf" ; ������Ϊ��ͬ���ļ���

;!define PRODUCT_NAME "HudunIPhoneRecovery" ; ������Ϊ��ͬ���ļ���(��װĿ¼��,һ����ͳһ��Ӣ��Ŀ¼)
!define PRODUCT_NAME "����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���(��װĿ¼��,һ����ͳһ��Ӣ��Ŀ¼)

!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "�Ϻ�������Ϣ�Ƽ����޹�˾"
!define PRODUCT_WEB_SITE "http://Wx.tianduntech.com"
!define EM_OUTFILE_NAME "${PRODUCT_NAME}.exe"

!define PBM_SETRANGE32 100

!define wxRexoverMutex_Install     "huduniphonerecoveryMutex_Install"
!define wxRexoverMutex_UnInstall   "huduniphonerecoveryMutex_UnInstall"
;---------------------------�������ѹ�����ͣ�Ҳ����ͨ���������ű����ƣ�------------------------------------
SetCompressor lzma
SetCompress force
XPStyle on
RequestExecutionLevel admin ;��ȡ����ԱȨ��.  none|user|highest|admin , none��admin��Ȩ�޲��,����F1����鵽��ؽ���
;RequestExecutionLevel user ;ֻҪ����ͨ�û�Ȩ�޼���(����Ҫ����Ա��Ȩ��),����Ŀǰ�ǰ�װ��AppData��ǰ�û�,���Բ��ù���ԱȨ��Ҳ���ԡ� none|user|highest|admin , none��admin��Ȩ�޲��,����F1����鵽��ؽ���
; ------ MUI �ִ����涨�� (1.67 �汾���ϼ���) ------
!include "MUI2.nsh"
!include "WinCore.nsh"
; �����ļ�����ͷ�ļ�
!include "FileFunc.nsh"
!include "nsWindows.nsh"
!include "LoadRTF.nsh"
!include "WinMessages.nsh"
!include "WordFunc.nsh"
!include "LogicLib.nsh"
!include "Library.nsh"
!include "nsProcess.nsh"

!define MUI_CUSTOMFUNCTION_GUIINIT onGUIInit
!define MUI_CUSTOMFUNCTION_UNGUIINIT un.unonGUIInit

; �Զ���ҳ��
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
;Name "����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���
Name "����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���

; Ӧ�ó������·��
OutFile "${EM_OUTFILE_NAME}"

;InstallDir "$PROGRAMFILES\����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���(��װĿ¼��)
;InstallDir "$PROGRAMFILES\huduniphonerecovery" ; ������Ϊ��ͬ���ļ���(��װĿ¼��)
;��Щ����ɴ�ֱ�Ӱ�װ��appdata��(����"��ɽ�ʰ�")��Ȼ���ͷ��β����ʾҪ����ԱȨ��,ֻ�ǵ��ĵ�ǰ�û�ע��ú������û�ʹ�ò���,���Ծ�û������Ŀ¼.֣٩�˵"������ⲻ��".�Ǿ�װ��appdata����,Ȩ�޾Ͳ��õ�����,��Ϊ�ǵ�ǰ�û�,ӵ������Ȩ��
InstallDir "$APPDATA\huduniphonerecovery" ; ������Ϊ��ͬ���ļ���(��װĿ¼��),Win8��Win10�����⴦��,���ھ�Win7�Ժ�װ��C:\ProgramData��

InstallDirRegKey HKCU "Software\huduniphonerecovery" INSTDIR
;SetFont ΢���ź� 9
SetFont ���� 9

; ��Ӵ����EXE�ļ���"��ϸ��Ϣ"�������������ʾ����"����"��"��ϸ��Ϣ"
VIProductVersion "1.0.0.0"

;VIAddVersionKey /LANG=2052 "ProductName" "����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���
VIAddVersionKey /LANG=2052 "ProductName" "����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���

VIAddVersionKey /LANG=2052 "ProductVersion" "1.0.0.0"
VIAddVersionKey /LANG=2052 "Comments" "�����Ȩ���Ϻ�������Ϣ�Ƽ����޹�˾���У����˲���˽�Ը��ƻ���ο���������"
VIAddVersionKey /LANG=2052 "CompanyName" "Wx.tianduntech.com"
VIAddVersionKey /LANG=2052 "LegalTrademarks" "�������ݻָ�"
VIAddVersionKey /LANG=2052 "LegalCopyright" "���ܿƼ� ��Ȩ����"

;VIAddVersionKey /LANG=2052 "FileDescription" "����ƻ���ָ���ʦ��װ����" ; ������Ϊ��ͬ���ļ���
VIAddVersionKey /LANG=2052 "FileDescription" "����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���

VIAddVersionKey /LANG=2052 "FileVersion" "1.0.0.0"

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Section Install
SectionEnd

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Function .onInit
    Call CreatehuduniphonerecoveryMutex
    ${WordFind2X} "$EXEFILE" "" "" "0" $Install_Exe
    InitPluginsDir
    File `/ONAME=$PLUGINSDIR\bg.bmp` `images\bg.bmp`

    ;File `/ONAME=$PLUGINSDIR\banner1.bmp` `images\banner1.bmp`
    File `/ONAME=$PLUGINSDIR\banner1.bmp` `0_images_����ƻ���ָ���ʦ\banner1.bmp` ; ������Ϊ��ͬ���ļ���

    File `/ONAME=$PLUGINSDIR\btn_agree.bmp` `images\btn_agree.bmp`
    ;File `/oname=$PLUGINSDIR\license.rtf` `license\license.rtf` ; ������Ϊ��ͬ���ļ���
    File `/oname=$PLUGINSDIR\license.rtf` `0_license_����ƻ���ָ���ʦ\license.rtf` ; ������Ϊ��ͬ���ļ���
    File `/ONAME=$PLUGINSDIR\checkbox1.bmp` `images\checkbox1.bmp`
    File `/ONAME=$PLUGINSDIR\checkbox2.bmp` `images\checkbox2.bmp`
    File `/ONAME=$PLUGINSDIR\btn_install.bmp` `images\btn_install.bmp`
    File `/ONAME=$PLUGINSDIR\btn_custom_install1.bmp` `images\btn_custom_install1.bmp`
    File `/ONAME=$PLUGINSDIR\btn_custom_install2.bmp` `images\btn_custom_install2.bmp`
    File `/ONAME=$PLUGINSDIR\close.bmp` `images\close.bmp`
    File `/ONAME=$PLUGINSDIR\browser.bmp` `images\browser.bmp`

    File `/ONAME=$PLUGINSDIR\bg2.bmp` `images\bg2.bmp`

    ;File `/ONAME=$PLUGINSDIR\banner2.bmp` `images\banner2.bmp`
    File `/ONAME=$PLUGINSDIR\banner2.bmp` `0_images_����ƻ���ָ���ʦ\banner2.bmp` ; ������Ϊ��ͬ���ļ���

    File `/ONAME=$PLUGINSDIR\loading1.bmp` `images\loading1.bmp`
    File `/ONAME=$PLUGINSDIR\loading2.bmp` `images\loading2.bmp`

    ;File `/ONAME=$PLUGINSDIR\banner3.bmp` `images\banner3.bmp`
    File `/ONAME=$PLUGINSDIR\banner3.bmp` `0_images_����ƻ���ָ���ʦ\banner3.bmp` ; ������Ϊ��ͬ���ļ���

    File `/ONAME=$PLUGINSDIR\btn_open_exe.bmp` `images\btn_open_exe.bmp`

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

Function CreatehuduniphonerecoveryMutex
	#��鰲װ���⣺#
	ReCheck:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_Install}") i .R1 ?e'
	Pop $R0
	System::Call 'kernel32::CloseHandle(i R1) i.s'
	#���ж�ػ��⣺#
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_UnInstall}") i .R3 ?e'
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
		System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_Install}") i .R1 ?e'
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

; �¼�
; ���Э��
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

Function onClickInstall
	; ��������ڰ汾�����,���¼����(���ں���ж��)
  ReadRegStr  $1 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ0.9" "InstallLocation"
  ${If} $1 != ""
	  StrCpy $INSTEDDIR $1
	  Call bUninstall_old
  ${EndIf}

	ReadRegStr $2 HKCU "Software\huduniphonerecovery" INSTDIR
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
    ${nsProcess::FindProcess} "WchatRecovery.exe" $R0
    ${nsProcess::Unload}
    ${If} $R0 == 0
		  ${nsProcess::KillProcess} "WchatRecovery.exe" $R1
			${nsProcess::Unload}
			Sleep 500 ; ����ʱ��(��λΪ:ms) ����
	  ${EndIf}
    SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
    ;SetShellVarContext current
    ;Delete "$INSTEDDIR\*.*"     ; ������������������г���ȫ��ɾ��(����ͻ�װ��WinXP������Ļ�)
    Delete "$INSTEDDIR\WchatRecovery.exe"
    Delete "$INSTEDDIR\uninstall.exe"
    Delete "$INSTEDDIR\*.dll"
    Delete "$INSTEDDIR\set.ini"
    Delete "$INSTEDDIR\temp\css\*.*"
    RMDir "$INSTEDDIR\temp\css"
    Delete "$INSTEDDIR\temp\images\*.*"
    RMDir "$INSTEDDIR\temp\images"
    Delete "$INSTEDDIR\temp\js\*.*"
    RMDir "$INSTEDDIR\temp\js"
    Delete "$INSTEDDIR\temp\*.*"
    RMDir "$INSTEDDIR\temp"
    Delete "$INSTEDDIR\res\*.*"
    RMDir "$INSTEDDIR\res"
    Delete "$INSTEDDIR\platforms\*.*"
    RMDir "$INSTEDDIR\platforms"
    Delete "$INSTEDDIR\imageformats\*.*"
    RMDir "$INSTEDDIR\imageformats"
    Delete "$INSTEDDIR\head\*.*"
    RMDir "$INSTEDDIR\head"
    Delete "$INSTEDDIR\Uninstall\*.*"
    RMDir "$INSTEDDIR\Uninstall"
    Delete "$INSTEDDIR\uninstall.exe"
    RMDir "$INSTEDDIR"

    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ0.9"

    ;SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
    SetShellVarContext current
    Delete "$DESKTOP\����ƻ���ָ���ʦ.lnk"

    Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\����ƻ���ָ���ʦ.lnk"
    Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\ж�� ����ƻ���ָ���ʦ.lnk"
    RMDir "$SMPROGRAMS\����ƻ���ָ���ʦ"
FunctionEnd

; ж���û���װ�ĵ�ǰ�汾�ļ�
Function bUninstall
  ${nsProcess::FindProcess} "WchatRecovery.exe" $R0
  ${nsProcess::Unload}
  ${If} $R0 == 0
	  ${nsProcess::KillProcess} "WchatRecovery.exe" $R1
		${nsProcess::Unload}
		Sleep 500 ; ����ʱ��(��λΪ:ms) ����
	${EndIf}
	;SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
	SetShellVarContext current
  ;Delete "$INSTEDDIR\*.*"     ; ������������������г���ȫ��ɾ��(����ͻ�װ��WinXP������Ļ�)

  Delete "$INSTEDDIR\WchatRecovery.exe"
  Delete "$INSTEDDIR\uninstall.exe"
  Delete "$INSTEDDIR\*.dll"
  Delete "$INSTEDDIR\set.ini"
  Delete "$INSTEDDIR\temp\css\*.*"
  RMDir "$INSTEDDIR\temp\css"
  Delete "$INSTEDDIR\temp\images\*.*"
  RMDir "$INSTEDDIR\temp\images"
  Delete "$INSTEDDIR\temp\js\*.*"
  RMDir "$INSTEDDIR\temp\js"
  Delete "$INSTEDDIR\temp\*.*"
  RMDir "$INSTEDDIR\temp"
  Delete "$INSTEDDIR\res\*.*"
  RMDir "$INSTEDDIR\res"
  Delete "$INSTEDDIR\platforms\*.*"
  RMDir "$INSTEDDIR\platforms"
  Delete "$INSTEDDIR\imageformats\*.*"
  RMDir "$INSTEDDIR\imageformats"
  Delete "$INSTEDDIR\head\*.*"
  RMDir "$INSTEDDIR\head"
  Delete "$INSTEDDIR\Uninstall\*.*"
  RMDir "$INSTEDDIR\Uninstall"
  Delete "$INSTEDDIR\uninstall.exe"
  RMDir "$INSTEDDIR"

  DeleteRegKey /ifempty HKCU "Software\huduniphonerecovery"
  DeleteRegKey /ifempty HKLM "Software\huduniphonerecovery"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\WchatRecovery.exe"

  ;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���

  ;SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
  SetShellVarContext current

  ;Delete "$DESKTOP\����ƻ���ָ���ʦ.lnk" ; ������Ϊ��ͬ���ļ���
  ;Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\����ƻ���ָ���ʦ.lnk" ; ������Ϊ��ͬ���ļ���
  ;Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\ж�� ����ƻ���ָ���ʦ.lnk" ; ������Ϊ��ͬ���ļ���
  ;RMDir "$SMPROGRAMS\����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���

  Delete "$DESKTOP\����ƻ���ָ���ʦ.lnk" ; ������Ϊ��ͬ���ļ���
  Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\����ƻ���ָ���ʦ.lnk" ; ������Ϊ��ͬ���ļ���
  Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\ж�� ����ƻ���ָ���ʦ.lnk" ; ������Ϊ��ͬ���ļ���
  RMDir "$SMPROGRAMS\����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���

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
	;${VersionCompare} "$R0" "6.1" $R3 ; ���ݲ���ϵͳ����װ��ͬ�ĳ���
	;${If} $R3 == 1
	;${Else}
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
	;${EndIf}
FunctionEnd

; ��װ������Ķ�Ӧִ��������
Function InstallationMainFun
	SendMessage $PB_ProgressBar ${PBM_SETRANGE32} 0 100  ;�ܲ���Ϊ��������ֵ
  CreateDirectory "$INSTDIR"
  SetOutPath "$INSTDIR"
  SetOverwrite on ;�򿪸��ǰ�װ

	;SetCtlColors $Lbl_Inatalling "${TEXT_COLOR}" "${BGCOLOR}"
  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����cONTROL��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
	${NSD_SetText} $Lbl_Inatalling "���ڰ�װ WchatRecovery.exe"	; ��װ������ʾ����

  ; �޸�ʱҪע�ⲻҪ�޸��ļ���˳��,�����10��40��ʱ��,�Ǹ���ʵ��������Թ���,���������������������
	SendMessage $PB_ProgressBar ${PBM_SETPOS} 10 0

  File "0_Files\����ƻ���ָ���ʦ\WchatRecovery.exe" ; ������Ϊ��ͬ���ļ���
  File "Files\set.ini"
  File "Files\*.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; �������óɴ����Control��ɫ,������ǰ���ֲ������(ע��Ҫ�ʹ�����ɫ��ͬ,�����������б���ɫ���Ϊ��ͬ��ɫ)
	${NSD_SetText} $Lbl_Inatalling "���ڰ�װ �����ļ� ..."	; ��װ������ʾ����

  SetOutPath "$INSTDIR\temp"
  ;File "Files\temp\*.*"
  ;SetOutPath "$INSTDIR\temp\js"
  ;File "Files\temp\js\*.*"
  SetOutPath "$INSTDIR\temp\images"
  File "Files\temp\images\*.*"
  SetOutPath "$INSTDIR\temp\css"
  File "Files\temp\css\*.*"
  SetOutPath "$INSTDIR\temp\js"
  File "Files\temp\js\*.*"

  SetOverwrite on
  SendMessage $PB_ProgressBar ${PBM_SETPOS} 60 0 ;85 0

  SetOutPath "$INSTDIR\head"
  ;File "Files\head\*.*"
  SetOutPath "$INSTDIR\imageformats"
  File "Files\imageformats\*.*"
  SetOutPath "$INSTDIR\platforms"
  File "Files\platforms\*.*"
  SetOutPath "$INSTDIR\res"
  File "Files\res\*.*"
  SetOutPath "$INSTDIR\" ;���һ��Ҫ����һ�����·��,����ע����ݷ�ʽ��·��,2016-01-21,KongMengYuan

  Call WriteReg ; ��װ����д��ע�����Ϣ
  Sleep 500 ; ����ʱ��(��λΪ:ms) ����

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 100 0

FunctionEnd

Function CreateLink
    SetShellVarContext current ;�߲ʷ�ԭʼ����.����һ��Ҫʹ�õ�ǰ�û�,����Win7 32λ�Ĳ���,�������ʹ��������װ,���������
    ;SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�,���ϲ��Ĵ��롰RequestExecutionLevel admin�����ʹ��. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�

    ; ������ɾ��Ŀ¼����ݷ�ʽ
    ;CreateShortCut "$DESKTOP\����ƻ���ָ���ʦ.lnk" "$INSTDIR\WchatRecovery.exe" "" "$INSTDIR\shortcut.ico" ; ������Ϊ��ͬ���ļ���
    ;CreateDirectory "$SMPROGRAMS\����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���
    ;CreateShortCut "$SMPROGRAMS\����ƻ���ָ���ʦ\ж�� ����ƻ���ָ���ʦ.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.ico" ; ������Ϊ��ͬ���ļ���
    ;CreateShortCut "$SMPROGRAMS\����ƻ���ָ���ʦ\����ƻ���ָ���ʦ.lnk" "$INSTDIR\WchatRecovery.exe" "" "$INSTDIR\shortcut.ico" ; ������Ϊ��ͬ���ļ���

    CreateShortCut "$DESKTOP\����ƻ���ָ���ʦ.lnk" "$INSTDIR\WchatRecovery.exe" "" "$INSTDIR\WchatRecovery.exe" ; ������Ϊ��ͬ���ļ���,������WchatRecovery.exe��ͼ���ļ�,ֱ��дͼ���ļ�����ʱ������,�����
    CreateDirectory "$SMPROGRAMS\����ƻ���ָ���ʦ" ; ������Ϊ��ͬ���ļ���
    CreateShortCut "$SMPROGRAMS\����ƻ���ָ���ʦ\ж�� ����ƻ���ָ���ʦ.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" ; ������Ϊ��ͬ���ļ��� ,uninstall.ico�����þ�ʹ��uninstall.exe
    CreateShortCut "$SMPROGRAMS\����ƻ���ָ���ʦ\����ƻ���ָ���ʦ.lnk" "$INSTDIR\WchatRecovery.exe" "" "$INSTDIR\WchatRecovery.exe" ; ������Ϊ��ͬ���ļ���

		Sleep 100 ; ����ʱ��(��λΪ:ms) ����
FunctionEnd

; Loading��ɺ���ת����һҳ
Function AutoNextPage
  Call NextPage
FunctionEnd

; ��װ����д��ע�����Ϣ
Function WriteReg
  ;SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
  SetShellVarContext current

  WriteUninstaller "$INSTDIR\uninstall.exe"

  ; HKCUдע���
  WriteRegStr HKCU "Software\huduniphonerecovery" INSTDIR $INSTDIR

  ; HKLMдע���(32λ��װ����64λ����ϵͳ�ϻ�д����HKLM\SOFTWARE\Wow6432Node��Ŀ¼��)
  WriteRegStr HKLM "SOFTWARE\huduniphonerecovery" INSTDIR "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\WchatRecovery.exe" "" "$INSTDIR\WchatRecovery.exe"

  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "DisplayName" "����ƻ���ָ���ʦ"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "UninstallString" '"$INSTDIR\uninstall.exe"'  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "DisplayIcon" '"$INSTDIR\shortcut.ico"'  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "DisplayVersion" "1.0.0.0"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "Publisher" "�Ϻ�������Ϣ�Ƽ����޹�˾"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "Contact" "Ѹ�� Support Department"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "HelpLink" "http://Wx.tianduntech.com"  ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "InstallLocation" "$INSTDIR" ; ������Ϊ��ͬ���ļ���
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "URLInfoAbout" "http://Wx.tianduntech.com"  ; ������Ϊ��ͬ���ļ���

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "DisplayName" "����ƻ���ָ���ʦ"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "UninstallString" '"$INSTDIR\uninstall.exe"'  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "DisplayIcon" '"$INSTDIR\WchatRecovery.exe"'  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "DisplayVersion" "1.0.0.0"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "Publisher" "�Ϻ�������Ϣ�Ƽ����޹�˾"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "Contact" "Ѹ�� Support Department"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "HelpLink" "http://Wx.tianduntech.com"  ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "InstallLocation" "$INSTDIR" ; ������Ϊ��ͬ���ļ���
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ" "URLInfoAbout" "http://Wx.tianduntech.com"  ; ������Ϊ��ͬ���ļ���

FunctionEnd

Function onClickCloseEnd
	  Call onClickClose
FunctionEnd

Function onClickOpenExe
    ExecShell "" "$INSTDIR\WchatRecovery.exe"
    Call onClickClose
    ;Sleep 4200 ; ����ʱ��(��λΪ:ms) ����
FunctionEnd

Function SetInstallLabel
  IntCmp $R9 0 0 Move Move
  	StrCmp $R9 "X" 0 Move
  		StrCpy $R9 "120"
  Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

; �ѵ�ǰ��װ��������д��set.ini,�����ϴ���php��վͳ��
Function WriteIniSetupName
  WriteINIStr "$INSTDIR\set.ini" "Install" "SetupName" $EXEFILE ; д�밲װ���ļ���
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
		;${NSD_CreateLabel} 37 358 180 14 "ͬ�⻥��ƻ���ָ���ʦ"
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
    ExecShell "open" "http://url.huifudashi.com/1/buy/welcome/"
    
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
FunctionEnd

;-----------------------------���²�����ж��ʹ�õ�-------------------------------------------------------

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#
;���԰�����õ���� Section Install ֮��,����ֻҪ���õ�Function����֮��Ϳ�����
Section Uninstall
SectionEnd

#-- ���� NSIS �ű��༭�������� Function ���α�������� Section ����֮���д���Ա��ⰲװ�������δ��Ԥ֪�����⡣--#

Function un.onInit
  Call un.CreatehuduniphonerecoveryMutex
  InitPluginsDir

  ;File `/ONAME=$PLUGINSDIR\banner4.bmp` `images\banner4.bmp`
  File `/ONAME=$PLUGINSDIR\banner4.bmp` `0_images_����ƻ���ָ���ʦ\banner4.bmp` ; ������Ϊ��ͬ���ļ���

  File `/ONAME=$PLUGINSDIR\bg2.bmp` `images\bg2.bmp`

  File `/ONAME=$PLUGINSDIR\btn_uninstall.bmp` `images\btn_uninstall.bmp`
  File `/ONAME=$PLUGINSDIR\btn_wrong.bmp` `images\btn_wrong.bmp`
  File `/ONAME=$PLUGINSDIR\unclose.bmp` `images\unclose.bmp`

  SkinBtn::Init "$PLUGINSDIR\btn_uninstall.bmp"
  SkinBtn::Init "$PLUGINSDIR\btn_wrong.bmp"
  SkinBtn::Init "$PLUGINSDIR\unclose.bmp"
FunctionEnd

Function un.CreatehuduniphonerecoveryMutex
	#��鰲װ���⣺#
	ReCheck:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_Install}") i .R1 ?e'
	Pop $R0
	System::Call 'kernel32::CloseHandle(i R1) i.s'
	#���ж�ػ��⣺#
	CheckUnInstall:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_UnInstall}") i .R3 ?e'
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
		System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_UnInstall}") i .R1 ?e'
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
  ;SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
  SetShellVarContext current
  ;Delete "$INSTDIR\*.*"     ; ������������������г���ȫ��ɾ��(����ͻ�װ��WinXP������Ļ�)
  Delete "$INSTDIR\WchatRecovery.exe"
  Delete "$INSTDIR\uninstall.exe"
  Delete "$INSTDIR\*.dll"
  Delete "$INSTDIR\set.ini"
  Delete "$INSTDIR\temp\css\*.*"
  RMDir "$INSTDIR\temp\css"
  Delete "$INSTDIR\temp\images\*.*"
  RMDir "$INSTDIR\temp\images"
  Delete "$INSTDIR\temp\js\*.*"
  RMDir "$INSTDIR\temp\js"
  Delete "$INSTDIR\temp\*.*"
  RMDir "$INSTDIR\temp"
  Delete "$INSTDIR\res\*.*"
  RMDir "$INSTDIR\res"
  Delete "$INSTDIR\platforms\*.*"
  RMDir "$INSTDIR\platforms"
  Delete "$INSTDIR\imageformats\*.*"
  RMDir "$INSTDIR\imageformats"
  Delete "$INSTDIR\head\*.*"
  RMDir "$INSTDIR\head"
  Delete "$INSTDIR\Uninstall\*.*"
  RMDir "$INSTDIR\Uninstall"
  Delete "$INSTDIR\uninstall.exe"
  RMDir "$INSTDIR"

  DeleteRegKey /ifempty HKCU "Software\huduniphonerecovery"
  DeleteRegKey /ifempty HKLM "Software\huduniphonerecovery"
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\WchatRecovery.exe"

  ;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ"; ������Ϊ��ͬ���ļ���
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\����ƻ���ָ���ʦ"; ������Ϊ��ͬ���ļ���

  ;SetShellVarContext all  ; ����adminȨ��,���û���װ. SetShellVarContext current ��ǰ�û�. �����ָ�����ڰ�װ����,��ô��ֻ�԰�װ������Ч,�����������ж�س���,��ô������ж�س�����Ч,���Ҫ���߶���Ч,������ڰ�װ�����ж�س����ﶼʹ�á�
  SetShellVarContext current

	;Delete "$DESKTOP\����ƻ���ָ���ʦ.lnk"; ������Ϊ��ͬ���ļ���
  ;Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\����ƻ���ָ���ʦ.lnk"; ������Ϊ��ͬ���ļ���
  ;Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\ж�� ����ƻ���ָ���ʦ.lnk"; ������Ϊ��ͬ���ļ���
  ;RMDir "$SMPROGRAMS\����ƻ���ָ���ʦ"; ������Ϊ��ͬ���ļ���

  Delete "$DESKTOP\����ƻ���ָ���ʦ.lnk"; ������Ϊ��ͬ���ļ���
  Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\����ƻ���ָ���ʦ.lnk"; ������Ϊ��ͬ���ļ���
  Delete "$SMPROGRAMS\����ƻ���ָ���ʦ\ж�� ����ƻ���ָ���ʦ.lnk"; ������Ϊ��ͬ���ļ���
  RMDir "$SMPROGRAMS\����ƻ���ָ���ʦ"; ������Ϊ��ͬ���ļ���

  ;MessageBox MB_OK "����ƻ���ָ���ʦ�Ѿ������ĵ������Ƴ���"  ; ������Ϊ��ͬ���ļ���
  MessageBox MB_OK "����ƻ���ָ���ʦ�Ѿ������ĵ������Ƴ���"  ; ������Ϊ��ͬ���ļ���

  KillProcDLL::KillProc "Au_.exe"
FunctionEnd

Function un.onClickUninstall
  ;ExecShell "open" "http://Wx.tianduntech.com/software/save/"
  ExecShell "open" "http://www.huifudashi.com/buy_discount.html"
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "��鿴�Żݻ���Ƿ���Ȼж�ر������"  IDYES +3 IDNO +1
  KillProcDLL::KillProc "Au_.exe"
  Quit

  ${nsProcess::FindProcess} "WchatRecovery.exe" $R0
  ${nsProcess::Unload}
  ${If} $R0 == 0
		;MessageBox MB_OKCANCEL "����ƻ���ָ���ʦ�������У����'ȷ��'ǿ�ƹرջ���ƻ���ָ���ʦ������ж�أ����'ȡ��'�˳�ж�ء�" IDOK yes_uninstall IDCANCEL no_uninstall ; ������Ϊ��ͬ���ļ���
		MessageBox MB_OKCANCEL "����ƻ���ָ���ʦ�������У����'ȷ��'ǿ�ƹرջ���ƻ���ָ���ʦ������ж�أ����'ȡ��'�˳�ж�ء�" IDOK yes_uninstall IDCANCEL no_uninstall ; ������Ϊ��ͬ���ļ���

		yes_uninstall:
		  ${nsProcess::KillProcess} "WchatRecovery.exe" $R1
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
