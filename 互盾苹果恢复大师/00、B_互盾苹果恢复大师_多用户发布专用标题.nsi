; 互盾苹果恢复大师 多用户发布专用标 题   这里特意留一个空格,不替换它
/*
  安装包的特殊要求：
  1、把安装包文件名写入set.ini，然后每次启动软件时自动上报,安装完成后要回写set.ini 。写入安装包文件名,我们读取到用户当前的文件名是啥就是写入啥,这样保证了我们只需要更改文件名,即可实现对不同来源渠道的统计
  2、更换4张图片：banner1.bmp,banner2.bmp,banner3.bmp,banner4.bmp
  3、更换License文件：license.rtf
  4、删除多余的文件和图标
  5、安装目录使用固定英文目录
  6、安装包的文件名大图标网址(删除安装包时可以看到版本号和网址)
  7、"同意许可协议"是否重叠(查看最长的文件名)
  8、安装一次,立即体验,不关闭再安装,当前打开的执行文件会自动关闭
  9、修改安装包文件名、快捷方式名称,exe和dll要签名,安装包要签名
	10、软件安装完成后，弹出链接 http://url.huifudashi.com/1/buy/welcome/
	11、软件卸载时，弹出链接 http://url.huifudashi.com/1/buy/discount/
	
	特殊说明：由于“互盾苹果恢复大师”原程序没有把UAC屏蔽过去(没有像PDF转换器,KongMengyuan编码的那样),所以只能在安装包时使用SetShellVarContext all而不是SetShellVarContext current,这样的坏处是初次执行时会有一个提示(而不像“PDF转换器”那样一直把UAC屏蔽得非常好)。同时影响的语句有：
						使用RequestExecutionLevel admin而不是RequestExecutionLevel user
						使用SetShellVarContext all而不是SetShellVarContext current
						好处：一直解决不了首次安装“PDF转换器”之后“立即体验”文件不能拖入的问题，设置为“SetShellVarContext current”就解决它了，这是一个格外的惊喜

  安装文件如果有变更,查找"注意此处的文件名称的修改"

  以下内容查找“发布成为不同的文件名”,修改对应的文件名
  ----------
  打包成这些标题:
  程序图标不用变，程序名字(程序在“任务栏”上的快捷名字)，程序顶部的名字(顶部是Image,正式版header_01.png 免费版header_02.png,需要美工作图)，安装包名字，安装包快捷方式 对应变化
  01、互盾苹果恢复大师           (首先作它,看默认是否好用)
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

;---------------------------全局编译脚本预定义的常量-----------------------------------------------------
; MUI 预定义常量
!define MUI_ABORTWARNING
; 安装图标的路径名字
!define MUI_ICON "images\install.ico"
; 卸载图标的路径名字
!define MUI_UNICON "images\uninstall.ico"
; 产品协议书的路径名字
;!define MUI_PAGE_LICENSE_RTY "license\license.rtf"
!define MUI_PAGE_LICENSE_RTY "0_license_互盾苹果恢复大师\license.rtf" ; 发布成为不同的文件名

;!define PRODUCT_NAME "HudunIPhoneRecovery" ; 发布成为不同的文件名(安装目录名,一般用统一的英文目录)
!define PRODUCT_NAME "互盾苹果恢复大师" ; 发布成为不同的文件名(安装目录名,一般用统一的英文目录)

!define PRODUCT_VERSION "1.0"
!define PRODUCT_PUBLISHER "上海互盾信息科技有限公司"
!define PRODUCT_WEB_SITE "http://Wx.tianduntech.com"
!define EM_OUTFILE_NAME "${PRODUCT_NAME}.exe"

!define PBM_SETRANGE32 100

!define wxRexoverMutex_Install     "huduniphonerecoveryMutex_Install"
!define wxRexoverMutex_UnInstall   "huduniphonerecoveryMutex_UnInstall"
;---------------------------设置软件压缩类型（也可以通过外面编译脚本控制）------------------------------------
SetCompressor lzma
SetCompress force
XPStyle on
RequestExecutionLevel admin ;获取管理员权限.  none|user|highest|admin , none和admin的权限差不多,可用F1里面查到相关解释
;RequestExecutionLevel user ;只要求普通用户权限级别(不需要管理员组权限),反正目前是安装在AppData当前用户,所以不用管理员权限也可以。 none|user|highest|admin , none和admin的权限差不多,可用F1里面查到相关解释
; ------ MUI 现代界面定义 (1.67 版本以上兼容) ------
!include "MUI2.nsh"
!include "WinCore.nsh"
; 引用文件函数头文件
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

; 自定义页面
; 欢迎页面
Page custom WelcomePage
; 安装过程页面
Page custom LoadingPage
; 安装完成页面
Page custom CompletePage

; 安装卸载过程页面
UninstPage custom un.UninstallPage
!insertmacro MUI_UNPAGE_INSTFILES

; 安装界面包含的语言设置(可以同时设置多个)
;!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "SimpChinese"

;------------------------------------------------------MUI 现代界面定义以及函数结束------------------------
; 应用程序显示名字
;Name "互盾苹果恢复大师" ; 发布成为不同的文件名
Name "互盾苹果恢复大师" ; 发布成为不同的文件名

; 应用程序输出路径
OutFile "${EM_OUTFILE_NAME}"

;InstallDir "$PROGRAMFILES\互盾苹果恢复大师" ; 发布成为不同的文件名(安装目录名)
;InstallDir "$PROGRAMFILES\huduniphonerecovery" ; 发布成为不同的文件名(安装目录名)
;有些程序干脆直接安装到appdata中(比如"金山词霸")，然后从头到尾不提示要管理员权限,只是担心当前用户注册好后其它用户使用不了,所以就没用这种目录.郑侃炜说"这个问题不大".那就装在appdata下面,权限就不用担心了,因为是当前用户,拥有所有权限
InstallDir "$APPDATA\huduniphonerecovery" ; 发布成为不同的文件名(安装目录名),Win8和Win10的特殊处理,现在就Win7以后都装在C:\ProgramData了

InstallDirRegKey HKCU "Software\huduniphonerecovery" INSTDIR
;SetFont 微软雅黑 9
SetFont 宋体 9

; 添加打包的EXE文件的"详细信息"，鼠标悬浮可显示，或"属性"的"详细信息"
VIProductVersion "1.0.0.0"

;VIAddVersionKey /LANG=2052 "ProductName" "互盾苹果恢复大师" ; 发布成为不同的文件名
VIAddVersionKey /LANG=2052 "ProductName" "互盾苹果恢复大师" ; 发布成为不同的文件名

VIAddVersionKey /LANG=2052 "ProductVersion" "1.0.0.0"
VIAddVersionKey /LANG=2052 "Comments" "软件版权归上海互盾信息科技有限公司所有，他人不得私自复制或二次开发本程序。"
VIAddVersionKey /LANG=2052 "CompanyName" "Wx.tianduntech.com"
VIAddVersionKey /LANG=2052 "LegalTrademarks" "互盾数据恢复"
VIAddVersionKey /LANG=2052 "LegalCopyright" "互盾科技 版权所有"

;VIAddVersionKey /LANG=2052 "FileDescription" "互盾苹果恢复大师安装程序" ; 发布成为不同的文件名
VIAddVersionKey /LANG=2052 "FileDescription" "互盾苹果恢复大师" ; 发布成为不同的文件名

VIAddVersionKey /LANG=2052 "FileVersion" "1.0.0.0"

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

Section Install
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

Function .onInit
    Call CreatehuduniphonerecoveryMutex
    ${WordFind2X} "$EXEFILE" "" "" "0" $Install_Exe
    InitPluginsDir
    File `/ONAME=$PLUGINSDIR\bg.bmp` `images\bg.bmp`

    ;File `/ONAME=$PLUGINSDIR\banner1.bmp` `images\banner1.bmp`
    File `/ONAME=$PLUGINSDIR\banner1.bmp` `0_images_互盾苹果恢复大师\banner1.bmp` ; 发布成为不同的文件名

    File `/ONAME=$PLUGINSDIR\btn_agree.bmp` `images\btn_agree.bmp`
    ;File `/oname=$PLUGINSDIR\license.rtf` `license\license.rtf` ; 发布成为不同的文件名
    File `/oname=$PLUGINSDIR\license.rtf` `0_license_互盾苹果恢复大师\license.rtf` ; 发布成为不同的文件名
    File `/ONAME=$PLUGINSDIR\checkbox1.bmp` `images\checkbox1.bmp`
    File `/ONAME=$PLUGINSDIR\checkbox2.bmp` `images\checkbox2.bmp`
    File `/ONAME=$PLUGINSDIR\btn_install.bmp` `images\btn_install.bmp`
    File `/ONAME=$PLUGINSDIR\btn_custom_install1.bmp` `images\btn_custom_install1.bmp`
    File `/ONAME=$PLUGINSDIR\btn_custom_install2.bmp` `images\btn_custom_install2.bmp`
    File `/ONAME=$PLUGINSDIR\close.bmp` `images\close.bmp`
    File `/ONAME=$PLUGINSDIR\browser.bmp` `images\browser.bmp`

    File `/ONAME=$PLUGINSDIR\bg2.bmp` `images\bg2.bmp`

    ;File `/ONAME=$PLUGINSDIR\banner2.bmp` `images\banner2.bmp`
    File `/ONAME=$PLUGINSDIR\banner2.bmp` `0_images_互盾苹果恢复大师\banner2.bmp` ; 发布成为不同的文件名

    File `/ONAME=$PLUGINSDIR\loading1.bmp` `images\loading1.bmp`
    File `/ONAME=$PLUGINSDIR\loading2.bmp` `images\loading2.bmp`

    ;File `/ONAME=$PLUGINSDIR\banner3.bmp` `images\banner3.bmp`
    File `/ONAME=$PLUGINSDIR\banner3.bmp` `0_images_互盾苹果恢复大师\banner3.bmp` ; 发布成为不同的文件名

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
    ; 消除边框
    System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
    ; 隐藏一些既有控件
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

; 处理无边框移动
Function onGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

Function CreatehuduniphonerecoveryMutex
	#检查安装互斥：#
	ReCheck:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_Install}") i .R1 ?e'
	Pop $R0
	System::Call 'kernel32::CloseHandle(i R1) i.s'
	#检查卸载互斥：#
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_UnInstall}") i .R3 ?e'
	Pop $R2
	System::Call 'kernel32::CloseHandle(i R3) i.s'
	#判断安装/卸载互斥的存在#
	${If} $R0 != 0
		MessageBox MB_RetryCancel|MB_ICONEXCLAMATION "安装程序已经运行！" IdRetry ReCheck
		Quit
	${ElseIf} $R2 != 0
		MessageBox MB_RetryCancel|MB_ICONEXCLAMATION "卸载程序正在运行！" IdRetry ReCheck
		Quit
	${Else}
		#创建安装互斥：#
		System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_Install}") i .R1 ?e'
		Pop $R0
		StrCmp $R0 0 +2
		Quit
	${EndIf}
FunctionEnd

; 贴图
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

; 事件
; 许可协议
Function onClickAgreement
	${IF} $Bool_License == 1
    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; 改变窗体大小,收缩
    ${NSW_SetWindowSize} $0 554 384 ; 改变Page大小
		IntOp $Bool_License $Bool_License - 1
	${ELSE}
	  ; 先把“自定义安装”收缩
	  ${IF} $Bool_Custom == 1
	    IntOp $Bool_Custom $Bool_Custom - 1
	    StrCpy $1 $Btn_Custom_Install
			Call SkinBtn_Custom_Install1
	    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; 改变窗体大小,收缩
	    ${NSW_SetWindowSize} $0 554 384 ; 改变Page大小
  	${EndIf}
    ${NSW_SetWindowSize} $HWNDPARENT 554 534 ; 改变窗体大小,展开
    ${NSW_SetWindowSize} $0 554 534 ; 改变Page大小
	  ShowWindow $Txt_License ${SW_SHOW}
		IntOp $Bool_License $Bool_License + 1
	${EndIf}
FunctionEnd

; CheckBox选中否
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

; 立即安装事件
;（1）处理页面跳转的命令
Function RelGotoPage
  IntCmp $R9 0 0 Move Move
  	StrCmp $R9 "X" 0 Move
  		StrCpy $R9 "120"
  Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

;（2）立即安装跳转到下一页
Function NextPage
  StrCpy $R9 1 ;Goto the next page
  Call RelGotoPage
  Abort
FunctionEnd

Function onClickInstall
	; 如果有早期版本的软件,则记录下来(便于后面卸载)
  ReadRegStr  $1 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师0.9" "InstallLocation"
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

; 卸载以前用户安装的旧版本文件
Function bUninstall_old
    ${nsProcess::FindProcess} "WchatRecovery.exe" $R0
    ${nsProcess::Unload}
    ${If} $R0 == 0
		  ${nsProcess::KillProcess} "WchatRecovery.exe" $R1
			${nsProcess::Unload}
			Sleep 500 ; 休眠时间(单位为:ms) 毫秒
	  ${EndIf}
    SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
    ;SetShellVarContext current
    ;Delete "$INSTEDDIR\*.*"     ; 这种情况会把桌面的所有程序全部删除(如果客户装在WinXP的桌面的话)
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

    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师0.9"

    ;SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
    SetShellVarContext current
    Delete "$DESKTOP\互盾苹果恢复大师.lnk"

    Delete "$SMPROGRAMS\互盾苹果恢复大师\互盾苹果恢复大师.lnk"
    Delete "$SMPROGRAMS\互盾苹果恢复大师\卸载 互盾苹果恢复大师.lnk"
    RMDir "$SMPROGRAMS\互盾苹果恢复大师"
FunctionEnd

; 卸载用户安装的当前版本文件
Function bUninstall
  ${nsProcess::FindProcess} "WchatRecovery.exe" $R0
  ${nsProcess::Unload}
  ${If} $R0 == 0
	  ${nsProcess::KillProcess} "WchatRecovery.exe" $R1
		${nsProcess::Unload}
		Sleep 500 ; 休眠时间(单位为:ms) 毫秒
	${EndIf}
	;SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
	SetShellVarContext current
  ;Delete "$INSTEDDIR\*.*"     ; 这种情况会把桌面的所有程序全部删除(如果客户装在WinXP的桌面的话)

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

  ;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" ; 发布成为不同的文件名
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" ; 发布成为不同的文件名

  ;SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
  SetShellVarContext current

  ;Delete "$DESKTOP\互盾苹果恢复大师.lnk" ; 发布成为不同的文件名
  ;Delete "$SMPROGRAMS\互盾苹果恢复大师\互盾苹果恢复大师.lnk" ; 发布成为不同的文件名
  ;Delete "$SMPROGRAMS\互盾苹果恢复大师\卸载 互盾苹果恢复大师.lnk" ; 发布成为不同的文件名
  ;RMDir "$SMPROGRAMS\互盾苹果恢复大师" ; 发布成为不同的文件名

  Delete "$DESKTOP\互盾苹果恢复大师.lnk" ; 发布成为不同的文件名
  Delete "$SMPROGRAMS\互盾苹果恢复大师\互盾苹果恢复大师.lnk" ; 发布成为不同的文件名
  Delete "$SMPROGRAMS\互盾苹果恢复大师\卸载 互盾苹果恢复大师.lnk" ; 发布成为不同的文件名
  RMDir "$SMPROGRAMS\互盾苹果恢复大师" ; 发布成为不同的文件名

  SetAutoClose true
FunctionEnd

; 自定义安装事件
Function onClickCustomInstall
	${IF} $Bool_Custom == 1
    IntOp $Bool_Custom $Bool_Custom - 1
    StrCpy $1 $Btn_Custom_Install
		Call SkinBtn_Custom_Install1
    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; 改变窗体大小,收缩
    ${NSW_SetWindowSize} $0 554 384 ; 改变Page大小
	${ELSE}
	  ; 先把“用户许可协议”收缩
  	${IF} $Bool_License == 1
      ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; 改变窗体大小,收缩
      ${NSW_SetWindowSize} $0 554 384 ; 改变Page大小
  		IntOp $Bool_License $Bool_License - 1
  	${EndIf}

    ${NSW_SetWindowSize} $HWNDPARENT 554 436 ; 改变窗体大小,展开
    ${NSW_SetWindowSize} $0 554 436 ; 改变Page大小
    ShowWindow $Txt_License ${SW_HIDE}
    IntOp $Bool_Custom $Bool_Custom + 1
    StrCpy $1 $Btn_Custom_Install
		Call SkinBtn_Custom_Install2
	${EndIf}
FunctionEnd

; 点击右上角关闭按钮
Function onClickClose
  FindProcDLL::FindProc "$Install_Exe"
  Sleep 500 ; 休眠时间(单位为:ms) 毫秒
  Pop $R0
  ${If} $R0 != 0
    KillProcDLL::KillProc "$Install_Exe"
  ${EndIf}
FunctionEnd

;Function onClickClose
;    ${NSW_DestroyWindow} $hwndparent
;FunctionEnd

; 更改目录
Function OnChangeDirRequest
	Pop $0
	System::Call "user32::GetWindowText(i$Txt_Browser,t.r0,i${NSIS_MAX_STRLEN})"
	StrCpy $INSTDIR $0
FunctionEnd

; 浏览按钮
Function OnClickBrowse
  Pop $0
  Push $INSTDIR                  ; input string "C:\Program Files\ProgramName"
  Call GetParent
  Pop $R0                        ; first part "C:\Program Files"
  Push $INSTDIR                  ; input string "C:\Program Files\ProgramName"
  Push "\"                       ; input chop char
  Call GetLastPart
  Pop $R1                        ; last part "ProgramName"
  ;nsDialogs::SelectFolderDialog "请选择 $R0 安装的文件夹:" "$R0" ;高彩芳这句提示是错的
  nsDialogs::SelectFolderDialog "请选择 $R1 安装的文件夹:" "$R0"
  Pop $0
  ${If} $0 == "error"            # returns 'error' if 'cancel' was pressed?
    Return
  ${EndIf}
  ${If} $0 != ""
	  StrCpy $INSTDIR "$0\$R1"
	  ;MessageBox MB_OK "$INSTDIR"
	  ;下面语句是错误的
	  ;system::Call `user32::SetWindowText(i $Txt_Browser, t "$INSTDIR")` ;调用系统的API,使用user32里面的SetWindowText方法
	  ${NSD_SetText} $Txt_Browser $INSTDIR ;把得到的新路径赋值给文本框
  ${EndIf}
FunctionEnd

; Usage:
; Push "C:\Program Files\Directory\Whatever"
; Call GetParent
; Pop $R0 ; $R0 equal "C:\Program Files\Directory"
; 得到选中目录用于拼接安装程序名称
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
; 截取选中目录
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
    Goto exit2 ; 2015-12-21,KongMengyuan质疑: 此处以下的代码不知如何执行,有空时问一下高彩芳

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

; 进度条控制
Function NSD_TimerFun
  GetFunctionAddress $0 NSD_TimerFun
  nsDialogs::KillTimer $0

	ReadRegStr $R0 HKLM "SOFTWARE\Microsoft\Windows NT\CurrentVersion" CurrentVersion
	ClearErrors
	;${VersionCompare} "$R0" "6.1" $R3 ; 根据操作系统来安装不同的程序
	;${If} $R3 == 1
	;${Else}
    !if 1   ; 是否在后台运行,1有效
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

; 安装编译过的对应执行主程序
Function InstallationMainFun
	SendMessage $PB_ProgressBar ${PBM_SETRANGE32} 0 100  ;总步长为顶部定义值
  CreateDirectory "$INSTDIR"
  SetOutPath "$INSTDIR"
  SetOverwrite on ;打开覆盖安装

	;SetCtlColors $Lbl_Inatalling "${TEXT_COLOR}" "${BGCOLOR}"
  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的cONTROL颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
	${NSD_SetText} $Lbl_Inatalling "正在安装 WchatRecovery.exe"	; 安装进程显示内容

  ; 修改时要注意不要修改文件的顺序,后面的10和40是时间,是根据实际情况测试过的,进度条是依据它来处理的
	SendMessage $PB_ProgressBar ${PBM_SETPOS} 10 0

  File "0_Files\互盾苹果恢复大师\WchatRecovery.exe" ; 发布成为不同的文件名
  File "Files\set.ini"
  File "Files\*.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
	${NSD_SetText} $Lbl_Inatalling "正在安装 其它文件 ..."	; 安装进程显示内容

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
  SetOutPath "$INSTDIR\" ;最后一定要设置一下这个路径,这是注册表快捷方式的路径,2016-01-21,KongMengYuan

  Call WriteReg ; 安装过程写入注册表信息
  Sleep 500 ; 休眠时间(单位为:ms) 毫秒

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 100 0

FunctionEnd

Function CreateLink
    SetShellVarContext current ;高彩芳原始代码.这里一定要使用当前用户,经过Win7 32位的测试,如果不是使用它来安装,则程序会出错
    ;SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户,和上部的代码“RequestExecutionLevel admin”配对使用. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。

    ; 创建和删除目录及快捷方式
    ;CreateShortCut "$DESKTOP\互盾苹果恢复大师.lnk" "$INSTDIR\WchatRecovery.exe" "" "$INSTDIR\shortcut.ico" ; 发布成为不同的文件名
    ;CreateDirectory "$SMPROGRAMS\互盾苹果恢复大师" ; 发布成为不同的文件名
    ;CreateShortCut "$SMPROGRAMS\互盾苹果恢复大师\卸载 互盾苹果恢复大师.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.ico" ; 发布成为不同的文件名
    ;CreateShortCut "$SMPROGRAMS\互盾苹果恢复大师\互盾苹果恢复大师.lnk" "$INSTDIR\WchatRecovery.exe" "" "$INSTDIR\shortcut.ico" ; 发布成为不同的文件名

    CreateShortCut "$DESKTOP\互盾苹果恢复大师.lnk" "$INSTDIR\WchatRecovery.exe" "" "$INSTDIR\WchatRecovery.exe" ; 发布成为不同的文件名,最后面的WchatRecovery.exe是图标文件,直接写图标文件名有时不好用,很奇怪
    CreateDirectory "$SMPROGRAMS\互盾苹果恢复大师" ; 发布成为不同的文件名
    CreateShortCut "$SMPROGRAMS\互盾苹果恢复大师\卸载 互盾苹果恢复大师.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.exe" ; 发布成为不同的文件名 ,uninstall.ico不好用就使用uninstall.exe
    CreateShortCut "$SMPROGRAMS\互盾苹果恢复大师\互盾苹果恢复大师.lnk" "$INSTDIR\WchatRecovery.exe" "" "$INSTDIR\WchatRecovery.exe" ; 发布成为不同的文件名

		Sleep 100 ; 休眠时间(单位为:ms) 毫秒
FunctionEnd

; Loading完成后跳转到下一页
Function AutoNextPage
  Call NextPage
FunctionEnd

; 安装过程写入注册表信息
Function WriteReg
  ;SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
  SetShellVarContext current

  WriteUninstaller "$INSTDIR\uninstall.exe"

  ; HKCU写注册表
  WriteRegStr HKCU "Software\huduniphonerecovery" INSTDIR $INSTDIR

  ; HKLM写注册表(32位安装包在64位操作系统上会写到“HKLM\SOFTWARE\Wow6432Node”目录下)
  WriteRegStr HKLM "SOFTWARE\huduniphonerecovery" INSTDIR "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\WchatRecovery.exe" "" "$INSTDIR\WchatRecovery.exe"

  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "DisplayName" "互盾苹果恢复大师"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "UninstallString" '"$INSTDIR\uninstall.exe"'  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "DisplayIcon" '"$INSTDIR\shortcut.ico"'  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "DisplayVersion" "1.0.0.0"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "Publisher" "上海互盾信息科技有限公司"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "Contact" "迅捷 Support Department"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "HelpLink" "http://Wx.tianduntech.com"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "InstallLocation" "$INSTDIR" ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "URLInfoAbout" "http://Wx.tianduntech.com"  ; 发布成为不同的文件名

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "DisplayName" "互盾苹果恢复大师"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "UninstallString" '"$INSTDIR\uninstall.exe"'  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "DisplayIcon" '"$INSTDIR\WchatRecovery.exe"'  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "DisplayVersion" "1.0.0.0"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "Publisher" "上海互盾信息科技有限公司"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "Contact" "迅捷 Support Department"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "HelpLink" "http://Wx.tianduntech.com"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "InstallLocation" "$INSTDIR" ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师" "URLInfoAbout" "http://Wx.tianduntech.com"  ; 发布成为不同的文件名

FunctionEnd

Function onClickCloseEnd
	  Call onClickClose
FunctionEnd

Function onClickOpenExe
    ExecShell "" "$INSTDIR\WchatRecovery.exe"
    Call onClickClose
    ;Sleep 4200 ; 休眠时间(单位为:ms) 毫秒
FunctionEnd

Function SetInstallLabel
  IntCmp $R9 0 0 Move Move
  	StrCmp $R9 "X" 0 Move
  		StrCpy $R9 "120"
  Move:
  SendMessage $HWNDPARENT "0x408" "$R9" ""
FunctionEnd

; 把当前安装包的名字写入set.ini,便于上传到php网站统计
Function WriteIniSetupName
  WriteINIStr "$INSTDIR\set.ini" "Install" "SetupName" $EXEFILE ; 写入安装包文件名
FunctionEnd

; 无论是函数的定义还是函数的调用都没有参数传递。通常nsi的参数传递是通过堆栈操作Pop,Push和20个寄存器变量~, $R0~$R9进行的。也可以通过全局变量完成参数传递。
; 欢迎界面
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
    SetCtlColors $0 ""  transparent ; 背景设成透明

    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; 改变窗体大小554,384/554,534
    ${NSW_SetWindowSize} $0 554 534 ; 改变Page大小

    nsDialogs::CreateControl "RichEdit20A" \
    ${ES_READONLY}|${WS_VISIBLE}|${WS_CHILD}|${WS_TABSTOP}|${WS_VSCROLL}|${ES_MULTILINE}|${ES_WANTRETURN} \
		${WS_EX_STATICEDGE}  3 387 548 144 ''
    Pop $Txt_License
		${LoadRTF} '$PLUGINSDIR\license.rtf' $Txt_License

		; 立即安装
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

    ; 注意此处如果字符串过长,会和后面的"用户许可协议"重叠,要修改第3个参数
		; 高彩芳编码
		;${NSD_CreateLabel} 37 358 180 14 "同意互盾苹果恢复大师"
		;${NSD_CreateLabel} 40 358 30 14 "同意" ; 发布成为不同的文件名,x y width height text,注意第3个参数,它会影响后面的“用户许可协议”点击,设置成为合理的字符宽度
		${NSD_CreateLabel} 40 358 30 14 "同意"  ; 发布成为不同的文件名,x y width height text,注意第3个参数,它会影响后面的“用户许可协议”点击,设置成为合理的字符宽度

    Pop $Lbl_Agree
    SetCtlColors $Lbl_Agree ""  transparent ; 背景设成透明

		; 许可协议?
		; 注意前面的字符串"同意。。。"如果过长,会和后面的"用户许可协议"重叠,要修改第1个参数
		; 高彩芳编码
		;${NSD_CreateButton} 190 349 76 30 ""
		${NSD_CreateButton} 63 349 76 30 "" ; x y width height text
    Pop $Btn_Agreen
	  StrCpy $1 $Btn_Agreen
	  Call SkinBtn_Btn_Agree
	  GetFunctionAddress $3 onClickAgreement
    SkinBtn::onClick $1 $3
    StrCpy $Bool_License 0

    ; 自定义安装
		${NSD_CreateButton} 458 349 86 30 ""
    Pop $Btn_Custom_Install
	  StrCpy $1 $Btn_Custom_Install
	  Call SkinBtn_Custom_Install1
	  GetFunctionAddress $3 onClickCustomInstall
    SkinBtn::onClick $1 $3
    StrCpy $Bool_Custom 0

    ; 安装位置标签
    ${NSD_CreateLabel} 16 403 65 14 "安装位置："
    Pop $Lbl_Install_Position
    SetCtlColors $Lbl_Install_Position ""  transparent ; 背景设成透明

		; 更改目录控件创建
		; 高彩芳编码
	  ;${NSD_CreateDirRequest} 78 395 388 30 "$INSTDIR"
	  ${NSD_CreateDirRequest} 78 400 388 20 "$INSTDIR"
 	  Pop	$Txt_Browser
 	  ;EnableWindow $Txt_Browser 0
 	  ${NSD_OnChange} $Txt_Browser OnChangeDirRequest

 	  ; 浏览按钮?
		${NSD_CreateButton} 468 395 74 30 ""
 	  Pop	$Btn_Browser
 	  ;MessageBox MB_OK "Btn_Browser:$Btn_Browser"
 	  StrCpy $1 $Btn_Browser
	  Call SkinBtn_Browser
	  GetFunctionAddress $3 OnClickBrowse
    SkinBtn::onClick $1 $3

    ; 关闭按钮
    ${NSD_CreateButton} 534 0 20 20 ""
    Pop $Btn_Close
	  StrCpy $1 $Btn_Close
	  Call SkinBtn_Btn_Close
	  GetFunctionAddress $3 onClickClose
    SkinBtn::onClick $1 $3

    ; Banner图
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BannerImage
    ${NSD_SetImage} $BannerImage $PLUGINSDIR\banner1.bmp $ImageHandle

    ; 贴背景大图
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BgImage
    ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BannerImage $0 ; 处理无边框窗体移动
    WndProc::onCallback $BgImage $0 ; 处理无边框窗体移动
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
    SetCtlColors $0 ""  transparent ; 背景设成透明?

    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; 改变窗体大小?
    ${NSW_SetWindowSize} $0 554 534 ; 改变Page大小

    ;正在安装
    ;${NSD_CreateLabel} 27 308 65 14 "正在安装" ; 27 308 65 14 定义为 左边,顶部,长度,高度,超过长度不会自动换行
    ${NSD_CreateLabel} 27 308 100% 14 "正在安装, 请耐心等候..." ; 27 308 65 14 定义为 左边,顶部,长度,高度,超过长度会自动换行
    Pop $Lbl_Inatalling
    SetCtlColors $Lbl_Inatalling ""  transparent ; 背景设成透明?

		;进度条控件
		${NSD_CreateProgressBar} 27 332 500 7 ""
    Pop $PB_ProgressBar
    SkinProgress::Set $PB_ProgressBar "$PLUGINSDIR\loading2.bmp" "$PLUGINSDIR\loading1.bmp"
    GetFunctionAddress $0 NSD_TimerFun
    nsDialogs::CreateTimer $0 1

    ;关闭按钮
    ${NSD_CreateButton} 534 0 20 20 ""
    Pop $Btn_Close
	  StrCpy $1 $Btn_Close
	  Call SkinBtn_Btn_Close
	  GetFunctionAddress $3 onClickClose
    SkinBtn::onClick $1 $3

    ;Banner图
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BannerImage
    ${NSD_SetImage} $BannerImage $PLUGINSDIR\banner2.bmp $ImageHandle

    ;贴背景大图
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BgImage
    ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BannerImage $0 ;处理无边框窗体移动
    WndProc::onCallback $BgImage $0 ;处理无边框窗体移动
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
    SetCtlColors $0 ""  transparent ; 背景设成透明?

    ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; 改变窗体大小?
    ${NSW_SetWindowSize} $0 554 534 ; 改变Page大小

	  Call WriteIniSetupName ; 把当前安装包的名字写入set.ini,便于上传到php网站统计
    ExecShell "open" "http://url.huifudashi.com/1/buy/welcome/"
    
    ;立即体验
    ${NSD_CreateButton} 187 293 180 50 ""
    Pop $Btn_Open_Exe
	  StrCpy $1 $Btn_Open_Exe
	  Call SkinBtn_Open_Exe
	  GetFunctionAddress $3 onClickOpenExe
    SkinBtn::onClick $1 $3

    ;关闭按钮
    ${NSD_CreateButton} 534 0 20 20 ""
    Pop $Btn_Close
	  StrCpy $1 $Btn_Close
	  Call SkinBtn_Btn_Close
	  ;GetFunctionAddress $3 onClickCloseEnd ;关闭之后再去检测NetFramework是否安装.2015-12-22,KongMengyuan修改,现改为在安装过程中自动下载安装
    SkinBtn::onClick $1 $3

    ;Banner图
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BannerImage
    ${NSD_SetImage} $BannerImage $PLUGINSDIR\banner3.bmp $ImageHandle

    ;贴背景大图
    ${NSD_CreateBitmap} 0 0 100% 100% ""
    Pop $BgImage
    ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

    GetFunctionAddress $0 onGUICallback
    WndProc::onCallback $BannerImage $0 ;处理无边框窗体移动
    WndProc::onCallback $BgImage $0 ;处理无边框窗体移动
    nsDialogs::Show
    ${NSD_FreeImage} $ImageHandle
FunctionEnd

;-----------------------------以下部分是卸载使用的-------------------------------------------------------

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#
;可以把这段拿到最顶部 Section Install 之后,不过只要它用的Function在它之后就可以了
Section Uninstall
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

Function un.onInit
  Call un.CreatehuduniphonerecoveryMutex
  InitPluginsDir

  ;File `/ONAME=$PLUGINSDIR\banner4.bmp` `images\banner4.bmp`
  File `/ONAME=$PLUGINSDIR\banner4.bmp` `0_images_互盾苹果恢复大师\banner4.bmp` ; 发布成为不同的文件名

  File `/ONAME=$PLUGINSDIR\bg2.bmp` `images\bg2.bmp`

  File `/ONAME=$PLUGINSDIR\btn_uninstall.bmp` `images\btn_uninstall.bmp`
  File `/ONAME=$PLUGINSDIR\btn_wrong.bmp` `images\btn_wrong.bmp`
  File `/ONAME=$PLUGINSDIR\unclose.bmp` `images\unclose.bmp`

  SkinBtn::Init "$PLUGINSDIR\btn_uninstall.bmp"
  SkinBtn::Init "$PLUGINSDIR\btn_wrong.bmp"
  SkinBtn::Init "$PLUGINSDIR\unclose.bmp"
FunctionEnd

Function un.CreatehuduniphonerecoveryMutex
	#检查安装互斥：#
	ReCheck:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_Install}") i .R1 ?e'
	Pop $R0
	System::Call 'kernel32::CloseHandle(i R1) i.s'
	#检查卸载互斥：#
	CheckUnInstall:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_UnInstall}") i .R3 ?e'
	Pop $R2
	System::Call 'kernel32::CloseHandle(i R3) i.s'
	#判断安装/卸载互斥的存在#
	${If} $R0 != 0
		MessageBox MB_RetryCancel|MB_ICONEXCLAMATION "安装程序正在运行！" IdRetry ReCheck
		Quit
	${ElseIf} $R2 != 0
		MessageBox MB_RetryCancel|MB_ICONEXCLAMATION "卸载程序已经运行！" IdRetry ReCheck
		Quit
	${Else}
		#创建卸载互斥：#
		System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${huduniphonerecoveryMutex_UnInstall}") i .R1 ?e'
		Pop $R0
		StrCmp $R0 0 +2
		Quit
	${EndIf}
FunctionEnd

Function un.unonGUIInit
	;消除边框
	System::Call `user32::SetWindowLong(i$HWNDPARENT,i${GWL_STYLE},0x9480084C)i.R0`
	;隐藏一些既有控件
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

;处理无边框移动
Function un.onGUICallback
  ${If} $MSG = ${WM_LBUTTONDOWN}
    SendMessage $HWNDPARENT ${WM_NCLBUTTONDOWN} ${HTCAPTION} $0
  ${EndIf}
FunctionEnd

;贴图
Function un.SkinBtn_Btn_Uninstall
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_uninstall.bmp $1
FunctionEnd

Function un.SkinBtn_Wrong
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_wrong.bmp $1
FunctionEnd

Function un.SkinBtn_Btn_Close
  SkinBtn::Set /IMGID=$PLUGINSDIR\unclose.bmp $1
FunctionEnd

;点击右上角关闭按钮?
Function un.onClickClose
  FindProcDLL::FindProc "Au_.exe"
  Sleep 500 ; 休眠时间(单位为:ms) 毫秒
  Pop $R0
  ${If} $R0 != 0
	  KillProcDLL::KillProc "Au_.exe"
  ${EndIf}
FunctionEnd

;点错了?
Function un.onClickWrong
  FindProcDLL::FindProc "Au_.exe"
  Sleep 500 ; 休眠时间(单位为:ms) 毫秒
  Pop $R0
  ${If} $R0 != 0
	  KillProcDLL::KillProc "Au_.exe"
  ${EndIf}
FunctionEnd

/******************************
 *  以下是安装程序的卸载部分  *
 ******************************/
Function un.uninstall
  ;SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
  SetShellVarContext current
  ;Delete "$INSTDIR\*.*"     ; 这种情况会把桌面的所有程序全部删除(如果客户装在WinXP的桌面的话)
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

  ;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师"; 发布成为不同的文件名
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\互盾苹果恢复大师"; 发布成为不同的文件名

  ;SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
  SetShellVarContext current

	;Delete "$DESKTOP\互盾苹果恢复大师.lnk"; 发布成为不同的文件名
  ;Delete "$SMPROGRAMS\互盾苹果恢复大师\互盾苹果恢复大师.lnk"; 发布成为不同的文件名
  ;Delete "$SMPROGRAMS\互盾苹果恢复大师\卸载 互盾苹果恢复大师.lnk"; 发布成为不同的文件名
  ;RMDir "$SMPROGRAMS\互盾苹果恢复大师"; 发布成为不同的文件名

  Delete "$DESKTOP\互盾苹果恢复大师.lnk"; 发布成为不同的文件名
  Delete "$SMPROGRAMS\互盾苹果恢复大师\互盾苹果恢复大师.lnk"; 发布成为不同的文件名
  Delete "$SMPROGRAMS\互盾苹果恢复大师\卸载 互盾苹果恢复大师.lnk"; 发布成为不同的文件名
  RMDir "$SMPROGRAMS\互盾苹果恢复大师"; 发布成为不同的文件名

  ;MessageBox MB_OK "互盾苹果恢复大师已经从您的电脑上移除！"  ; 发布成为不同的文件名
  MessageBox MB_OK "互盾苹果恢复大师已经从您的电脑上移除！"  ; 发布成为不同的文件名

  KillProcDLL::KillProc "Au_.exe"
FunctionEnd

Function un.onClickUninstall
  ;ExecShell "open" "http://Wx.tianduntech.com/software/save/"
  ExecShell "open" "http://www.huifudashi.com/buy_discount.html"
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "请查看优惠活动。是否仍然卸载本软件？"  IDYES +3 IDNO +1
  KillProcDLL::KillProc "Au_.exe"
  Quit

  ${nsProcess::FindProcess} "WchatRecovery.exe" $R0
  ${nsProcess::Unload}
  ${If} $R0 == 0
		;MessageBox MB_OKCANCEL "互盾苹果恢复大师正在运行，点击'确定'强制关闭互盾苹果恢复大师并继续卸载，点击'取消'退出卸载。" IDOK yes_uninstall IDCANCEL no_uninstall ; 发布成为不同的文件名
		MessageBox MB_OKCANCEL "互盾苹果恢复大师正在运行，点击'确定'强制关闭互盾苹果恢复大师并继续卸载，点击'取消'退出卸载。" IDOK yes_uninstall IDCANCEL no_uninstall ; 发布成为不同的文件名

		yes_uninstall:
		  ${nsProcess::KillProcess} "WchatRecovery.exe" $R1
			${nsProcess::Unload}
			Sleep 500 ; 休眠时间(单位为:ms) 毫秒
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
  SetCtlColors $0 ""  transparent ; 背景设成透明?

  ${NSW_SetWindowSize} $HWNDPARENT 554 384 ; 改变窗体大小
  ${NSW_SetWindowSize} $0 554 534 ; 改变Page大小

  ; 狠心卸载
  ${NSD_CreateButton} 326 340 94 30 ""
  Pop $Btn_Uninstall
  StrCpy $1 $Btn_Uninstall
  Call un.SkinBtn_Btn_Uninstall
  GetFunctionAddress $3 un.onClickUninstall
  SkinBtn::onClick $1 $3
  StrCpy $Bool_Uninstall 0

  ; 点错了?
  ${NSD_CreateButton} 439 340 94 30 ""
  Pop $Btn_Wrong
  StrCpy $1 $Btn_Wrong
  Call un.SkinBtn_Wrong
  GetFunctionAddress $3 un.onClickWrong
  SkinBtn::onClick $1 $3

  ; 关闭按钮
  ${NSD_CreateButton} 534 0 20 20 ""
  Pop $Btn_Close
  StrCpy $1 $Btn_Close
  Call un.SkinBtn_Btn_Close
  GetFunctionAddress $3 un.onClickClose
  SkinBtn::onClick $1 $3

  ; Banner图
  ${NSD_CreateBitmap} 0 0 100% 100% ""
  Pop $BannerImage
  ${NSD_SetImage} $BannerImage $PLUGINSDIR\banner4.bmp $ImageHandle

  ; 贴背景大图
  ${NSD_CreateBitmap} 0 0 100% 100% ""
  Pop $BgImage
  ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

  GetFunctionAddress $0 un.onGUICallback
  WndProc::onCallback $BannerImage $0 ; 处理无边框窗体移动
  WndProc::onCallback $BgImage $0 ; 处理无边框窗体移动
  nsDialogs::Show
  ${NSD_FreeImage} $ImageHandle
FunctionEnd
