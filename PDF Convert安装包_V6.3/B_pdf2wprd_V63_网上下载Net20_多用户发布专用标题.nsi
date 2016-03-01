; 多用户发布专用标题 多用户发布专用标 题   这里特意留一个空格,不替换它

; 本编码对应的编译程序为 NSIS 2.46.2015.08中文增强安装版.exe ,保存为ANSI编码(如果使用Nsis的Unicode版本编译会发现nsWindows.nsh找不到). 如果启动时使用了多语言,则必须使用Nsis的Unicode版本编译(重新安装"NSIS 2.46.Unicode版.exe")
; 学习NSIS可以通过安装菜单的“NSIS 图文教程集锦”、“NSIS 文档”、“NSISDialogDesigner”
/*
	操作系统__________________版本号
	Windows 10________________6.2     默认安装.Net4.5
	Windows 8	________________6.2     默认安装.Net4.5 (同时也携带有.Net3.5,只是不是默认安装)
	Windows 7 ________________6.1     默认安装.Net3.5
	Windows Server 2008 R2____6.1
	Windows Server 2008_______6.0
	Windows Vista_____________6.0
	Windows Server 2003 R2____5.2
	Windows Server 2003_______5.2
	Windows XP X64____________5.2     手动安装.Net2.0 SP2 64位
	Windows XP________________5.1     手动安装.Net2.0或.Net2.0 SP2或.Net3.5,不能安装.Net4.0
	Windows 2000______________5.0

  .Net Framework 2.0 SP2 32位 本程序比较的版本为 2.0.50727  来自 C:\Windows\Microsoft.NET\Framework\v2.0.50727   原安装文件25兆,安装后文件占用空间185兆,下载比较快,但是安装比较花时间
  .Net Framework 2.0 SP2 64位 本程序比较的版本为 2.0.50727  来自 C:\Windows\Microsoft.NET\Framework64\v2.0.50727 原安装文件48.5兆,安装后文件占用空间361兆,下载比较快,但是安装比较花时间

  安装包的特殊要求：
  1、把安装包文件名写入set.ini，然后每次启动软件时自动上报,安装完成后要回写set.ini 。写入安装包文件名,我们读取到用户当前的文件名是啥就是写入啥,这样保证了我们只需要更改文件名,即可实现对不同来源渠道的统计
  2、更换4张图片：banner1.bmp,banner2.bmp,banner3.bmp,banner4.bmp
  3、更换License文件：license.rtf
  4、删除多余的文件和图标
  5、安装目录使用固定英文目录
  6、安装包的文件名大图标网址
  7、"同意许可协议"是否重叠(查看最长的文件名)
  8、安装一次,立即体验,不关闭再安装,当前打开的执行文件会自动关闭
  9、修改安装包文件名、快捷方式名称,exe和dll要签名,安装包要签名
  10、软件安装完成后，弹出链接 http://url.huifudashi.com/1/buy/welcome/  目前不考虑
	11、软件卸载时，弹出链接 http://url.huifudashi.com/1/buy/discount/  目前不考虑

	12、win8和Win10要安装在“C:\ProgramData”目录下面,因为有时发现安装在“C:\Program Files (x86)”下面有时会不能写入config.ini这个文件(只是有的客户有这种情况)
	
  安装文件如果有变更,查找"注意此处的文件名称的修改"

  以下内容查找“发布成为不同的文件名”,修改对应的文件名
  ----------
  打包成这些标题:
  程序图标不用变，程序名字(程序在“任务栏”上的快捷名字)，程序顶部的名字(顶部是Image,正式版header_01.png 免费版header_02.png,需要美工作图)，安装包名字，安装包快捷方式 对应变化
  多用户发布专用标 题   这里特意留一个空格,不替换它
  01、迅捷PDF转换器           (首先作它,看默认是否好用)
  02、pdf转换器
  03、pdf转换成word转换器
  04、word转换成pdf转换器
  05、pdf转换成jpg转换器
  06、jpg转换成pdf转换器
  07、pdf转换成ppt转换器
  08、ppt转换成pdf转换器

  09、pdf转换成txt转换器
  10、txt转换成pdf转换器
  11、pdf转换成html转换器
  12、pdf转换成excel转换器
  13、excel转换成pdf转换器

  14、excel转换成word转换器
  15、ppt转换成word转换器
  16、word转换成excel转换器
  17、pdf to word converter

  18、好用PDF转换器           (其次先作它,把这个测试好后,然后就用整体替换了),查"发布成为不同的文件名"一个一个替换
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

Var RadioButton1 ; 多语言选择:简体中文
Var RadioButton2 ; 多语言选择:English
Var RadioButton3 ; 多语言选择:日本語
Var RadioButton4 ; 多语言选择:中文繁體
Var RadioButton_Font ; 多语言选择:字体大小
Var LanguageBgImage ; 多语言选择: 背景图片
Var LanguageBgImageHandle ; 多语言选择: 背景图片句柄

;---------------------------全局编译脚本预定义的常量-----------------------------------------------------
; MUI 预定义常量
!define MUI_ABORTWARNING
; 安装图标的路径名字
!define MUI_ICON "images\install.ico"
; 卸载图标的路径名字
!define MUI_UNICON "images\uninstall.ico"
; 产品协议书的路径名字
!define MUI_PAGE_LICENSE_RTY "license\license.rtf"
!define PRODUCT_NAME "pdf2word"
!define PRODUCT_VERSION "6.3"
!define PRODUCT_PUBLISHER "上海互盾信息科技有限公司"
!define PRODUCT_WEB_SITE "http://www.huduntech.com"
!define EM_OUTFILE_NAME "${PRODUCT_NAME}.exe"

!define PBM_SETRANGE32 100

!define wxRexoverMutex_Install     "pdf2wordMutex_Install"
!define wxRexoverMutex_UnInstall   "pdf2wordMutex_UnInstall"
;---------------------------设置软件压缩类型（也可以通过外面编译脚本控制）------------------------------------
SetCompressor lzma
SetCompress force
XPStyle on
RequestExecutionLevel admin ;获取管理员权限.  none|user|highest|admin , none和admin的权限差不多,可用F1里面查到相关解释
; ------ MUI 现代界面定义 (1.67 版本以上兼容) ------
!include "MUI2.nsh"
!include "WinCore.nsh"
; 引用文件函数头文件
!include "FileFunc.nsh"
!include "nsWindows.nsh"
!include "LoadRTF.nsh"
!include "WinMessages.nsh"
!include "WordFunc.nsh"
!include "LogicLib.nsh" ; 样例可以查看LogicLib.nsi, 条件判断及循环语句的使用,比如Switch, IfCmd, Select, While, For这几种专有用法
!include "Library.nsh"
!include "nsProcess.nsh"
!include "MUI2.nsh" ;下拉菜单专用,Page custom nsDialogsPage

!define MUI_CUSTOMFUNCTION_GUIINIT onGUIInit
!define MUI_CUSTOMFUNCTION_UNGUIINIT un.unonGUIInit

; 自定义页面
;语言选择界面(不使用Nsis自带的那种方法,自带的语言选择需要使用Unicode版本的NSIS编译,而如果用它编译的话,下面的许多代码都不识别了,所以使用这种方法作一个单独的语言选择框)
;Page custom Page_MutiLanguage ; 多语言选择,需要 !include "MUI2.nsh"
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
;Name "迅捷PDF转换器" ; 发布成为不同的文件名
Name "多用户发布专用标题" ; 发布成为不同的文件名

; 应用程序输出路径
OutFile "${EM_OUTFILE_NAME}"

;InstallDir "$PROGRAMFILES\迅捷PDF转换器" ; 发布成为不同的文件名(安装目录名)
;InstallDir "$PROGRAMFILES\多用户发布专用标题" ; 发布成为不同的文件名(安装目录名)
InstallDir "C:\ProgramData\多用户发布专用标题" ; 发布成为不同的文件名(安装目录名),Win8和Win10的特殊处理,现在就Win7以后都装在C:\ProgramData了
		
InstallDirRegKey HKCU "Software\pdf2word" INSTDIR
;SetFont 微软雅黑 9
SetFont 宋体 9

; 添加打包的EXE文件的"详细信息"，鼠标悬浮可显示，或"属性"的"详细信息"
VIProductVersion "6.3.0.0"

;VIAddVersionKey /LANG=2052 "ProductName" "迅捷PDF转换器" ; 发布成为不同的文件名
VIAddVersionKey /LANG=2052 "ProductName" "多用户发布专用标题" ; 发布成为不同的文件名

VIAddVersionKey /LANG=2052 "ProductVersion" "6.3.0.0"
VIAddVersionKey /LANG=2052 "Comments" "软件版权归上海互盾信息科技有限公司所有，他人不得私自复制或二次开发本程序。"
VIAddVersionKey /LANG=2052 "CompanyName" "www.huduntech.com"
VIAddVersionKey /LANG=2052 "LegalTrademarks" "迅捷PDF"
VIAddVersionKey /LANG=2052 "LegalCopyright" "互盾科技 版权所有"

;VIAddVersionKey /LANG=2052 "FileDescription" "迅捷PDF转换器安装程序" ; 发布成为不同的文件名
VIAddVersionKey /LANG=2052 "FileDescription" "多用户发布专用标题" ; 发布成为不同的文件名

VIAddVersionKey /LANG=2052 "FileVersion" "6.3.0.0"

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

Section Install
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

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
  SetCtlColors $0 ""  transparent ; 背景设成透明

  ${NSW_SetWindowSize} $HWNDPARENT 428 284 ; 改变窗体大小554,384/554,534
  ${NSW_SetWindowSize} $0 428 384 ; 改变Page大小

  ; 贴背景大图
;  ${NSD_CreateBitmap} 0 0 20% 20% ""
;  Pop $BgImage
;  ${NSD_SetImage} $BgImage $PLUGINSDIR\bg2.bmp $ImageHandle

  ; 贴背景大图
  ${NSD_CreateBitmap} 0,0,100%,100% ""
  Pop $LanguageBgImage
  File "/oname=$PLUGINSDIR\language_top.bmp" "images\language_top.bmp"
  ${NSD_SetImage} $LanguageBgImage "$PLUGINSDIR\language_top.bmp" $LanguageBgImageHandle

  CreateFont $RadioButton_Font "SimSun" "12" "400"
  ${NSD_CreateLabel} 10 2 190 10u "Please select install language" ; 此处一定要使用英文,否则不同的操作系统语言会产生乱码(比如此处写成中文,则在日文系统下会变为乱码,因为中文必须有中文代码页,日文系统默认并不安装它)
  ;${NSD_CreateRadioButton} 10 12u 100% 10u "中文简体"
  ${NSD_CreateRadioButton} 10 12u 100% 10u ""
  Pop $RadioButton1
  SendMessage $RadioButton1 ${WM_SETFONT} $RadioButton_Font 0 ; 设置字体大小
  SetCtlColors $RadioButton1 0x000000 transparent ; 背景变为透明
  
  ${NSD_CreateRadioButton} 10 32u 100% 10u English
  Pop $RadioButton2
  SendMessage $RadioButton2 ${WM_SETFONT} $RadioButton_Font 0 ; 设置字体大小
  SetCtlColors $RadioButton2 0x000000 transparent ; 背景变为透明

  ${NSD_CreateRadioButton} 10 52u 100% 10u '日本語'
  Pop $RadioButton3
;  SendMessage $RadioButton3 ${WM_SETFONT} $hCtl_asdf_Font1 0 ; 设置字体大小
;  SetCtlColors $RadioButton3 0x000000 transparent ; 背景变为透明

  ${NSD_CreateRadioButton} 10 72u 100% 10u '中文繁體'
	Pop $RadioButton4
  SendMessage $RadioButton1 ${WM_SETFONT} $RadioButton_Font 0 ; 设置字体大小
  SetCtlColors $RadioButton1 0x000000 transparent ; 背景变为透明

  ${NSD_CB_SelectString} $RadioButton1 "简体中文" ;默认选择的是"简体中文"
  ${NSD_Check} $RadioButton1 ;设置焦点

  ;Next 下一页按钮(选择语言界面)
  ${NSD_CreateButton} 2 160 180 50 ""
  Pop $Btn_Next_Exe
  StrCpy $1 $Btn_Next_Exe
  Call SkinBtn_Next_Exe ; 加入图片
  GetFunctionAddress $3 onClickNextExe ; 调用点击事件
  SkinBtn::onClick $1 $3

  ;Close 关闭按钮(选择语言界面)
  ${NSD_CreateButton} 200 160 180 50 ""
  Pop $Btn_Close_Exe
  StrCpy $1 $Btn_Close_Exe
  Call SkinBtn_Close_Exe ; 加入图片
  GetFunctionAddress $3 onClickCloseLanguage  ; 调用点击事件
  SkinBtn::onClick $1 $3
    
  nsDialogs::Show
FunctionEnd

; 点击Close按钮(语言选择界面)
Function onClickCloseLanguage
  FindProcDLL::FindProc "$Install_Exe"
  Sleep 500 ; 休眠时间(单位为:ms) 毫秒
  Pop $R0
  ${If} $R0 != 0
    KillProcDLL::KillProc "$Install_Exe"
  ${EndIf}
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

Function Createpdf2wordMutex
	#检查安装互斥：#
	ReCheck:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_Install}") i .R1 ?e'
	Pop $R0
	System::Call 'kernel32::CloseHandle(i R1) i.s'
	#检查卸载互斥：#
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_UnInstall}") i .R3 ?e'
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
		System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_Install}") i .R1 ?e'
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

Function SkinBtn_Next_Exe
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_next_exe.bmp $1
FunctionEnd

Function SkinBtn_Close_Exe
  SkinBtn::Set /IMGID=$PLUGINSDIR\btn_close_exe.bmp $1
FunctionEnd

; 事件
; 用户许可协议
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

; 点击Next按钮(语言选择界面)
Var LanSelect ; 语言选择,zh-CN中文简体,en English,ja日本語,zh-TW中文繁體
Function onClickNextExe
	;Pop $19 ;使用完$19,还原他本来值
	${NSD_GetState} $RadioButton1 $LanSelect
	${If} $LanSelect == ${BST_CHECKED}
	  ;MessageBox MB_OK "RadioButton1 中文简体 被选中啦！"
		StrCpy $LanSelect "zh-CN"		; 将值赋给$LanguageSelection
	${Else}
		${NSD_GetState} $RadioButton2 $LanSelect
		${If} LanSelect == ${BST_CHECKED}
		  ;MessageBox MB_OK "RadioButton2 English 被选中啦！"
			StrCpy $LanSelect "en"		; 将值赋给$LanguageSelection
		${Else}
			${NSD_GetState} $RadioButton3 $LanSelect
			${If} $LanSelect == ${BST_CHECKED}
			  ;MessageBox MB_OK "RadioButton3 日本語 被选中啦！"
				StrCpy $LanSelect "ja"		; 将值赋给$LanguageSelection
			${Else}
				${NSD_GetState} $RadioButton4 $LanSelect
				${If} $LanSelect == ${BST_CHECKED}
					;MessageBox MB_OK "RadioButton4 中文繁體 被选中啦！"
					StrCpy $LanSelect "zh-TW"		; 将值赋给$LanguageSelection
				${EndIf}
			${EndIf}
		${EndIf}
	${EndIf}
	;MessageBox MB_OK '"$LanSelect - 这是堆栈弹出的"' ; 将堆栈的数(刚才压进的10)弹出到$20
	
	/*
	; 如何使用：
	; 需要在顶部增加 !include "LogicLib.nsh" ; 样例可以查看LogicLib.nsi, 条件判断及循环语句的使用,比如Switch, IfCmd, Select, While, For这几种专有用法
	${Switch} $LanSelect
	${Case} "1" ; 中文简体
		MessageBox MB_OK "RadioButton1 中文简体 被选中啦！"
	${Case} "2" ; English
		MessageBox MB_OK "RadioButton2 English 被选中啦！"
	${Case} "3" ; 日本語
		MessageBox MB_OK "RadioButton3 日本語 被选中啦！"
	${Case} "4" ; 中文繁體
		MessageBox MB_OK "RadioButton4 中文繁體 被选中啦！"
	${Default}
		MessageBox MB_OK "RadioButton1 中文简体 被选中啦！"
  ${EndSwitch}
  */
  
  Call NextPage
  ;Sleep 4200 ; 休眠时间(单位为:ms) 毫秒
FunctionEnd

Function onClickInstall
	; 如果有早期版本的软件,则记录下来(便于后面卸载)
  ReadRegStr  $1 HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器6.2" "InstallLocation" ; 读取注册表
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

; 卸载以前用户安装的旧版本文件
Function bUninstall_old
    ${nsProcess::FindProcess} "PDF Convert.exe" $R0
    ${nsProcess::Unload}
    ${If} $R0 == 0
		  ${nsProcess::KillProcess} "PDF Convert.exe" $R1
			${nsProcess::Unload}
			Sleep 500 ; 休眠时间(单位为:ms) 毫秒
	  ${EndIf}
    SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
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



    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器6.2"

    ;SetShellVarContext current ;高彩芳原始代码.这里一定要使用当前用户,经过Win7 32位的测试,如果不是使用它来安装,则程序会出错
    SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
    Delete "$DESKTOP\迅捷PDF转换器.lnk"

    Delete "$SMPROGRAMS\迅捷PDF转换器\迅捷PDF转换器.lnk"
    Delete "$SMPROGRAMS\迅捷PDF转换器\卸载 迅捷PDF转换器.lnk"
    RMDir "$SMPROGRAMS\迅捷PDF转换器"
FunctionEnd

; 卸载用户安装的当前版本文件
Function bUninstall
  ${nsProcess::FindProcess} "PDF Convert.exe" $R0
  ${nsProcess::Unload}
  ${If} $R0 == 0
	  ${nsProcess::KillProcess} "PDF Convert.exe" $R1
		${nsProcess::Unload}
		Sleep 500 ; 休眠时间(单位为:ms) 毫秒
	${EndIf}
	SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
  ;Delete "$INSTEDDIR\*.*"     ; 这种情况会把桌面的所有程序全部删除(如果客户装在WinXP的桌面的话)
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

  ;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" ; 发布成为不同的文件名
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" ; 发布成为不同的文件名

  ;SetShellVarContext current ;高彩芳原始代码.这里一定要使用当前用户,经过Win7 32位的测试,如果不是使用它来安装,则程序会出错
  SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。

  ;Delete "$DESKTOP\迅捷PDF转换器.lnk" ; 发布成为不同的文件名
  ;Delete "$SMPROGRAMS\迅捷PDF转换器\迅捷PDF转换器.lnk" ; 发布成为不同的文件名
  ;Delete "$SMPROGRAMS\迅捷PDF转换器\卸载 迅捷PDF转换器.lnk" ; 发布成为不同的文件名
  ;RMDir "$SMPROGRAMS\迅捷PDF转换器" ; 发布成为不同的文件名

  Delete "$DESKTOP\多用户发布专用标题.lnk" ; 发布成为不同的文件名
  Delete "$SMPROGRAMS\多用户发布专用标题\多用户发布专用标题.lnk" ; 发布成为不同的文件名
  Delete "$SMPROGRAMS\多用户发布专用标题\卸载 多用户发布专用标题.lnk" ; 发布成为不同的文件名
  RMDir "$SMPROGRAMS\多用户发布专用标题" ; 发布成为不同的文件名

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
	${VersionCompare} "$R0" "6.1" $R3 ; 根据操作系统来安装不同的程序
	${If} $R3 == 1
		;Nsis自带帮助文档：当 !if 与 !endif 命令组成一对时,将会告诉编译器是否编译含在其两者之间的代码。如果值为非零或者 值1 和 值2 的逻辑运算结果为真,那么所含的代码将会被编译。否则,那些代码将会被跳过。运算符 可以是 == or != (字符串比较), <=, < > 或 >= (实数比较), && or || (布尔运算)。 如果设置了 [!] ，则逻辑运算结果取非。
    !if 1   ; 是否在后台运行,1有效
      GetFunctionAddress $0 InstallationMainFun4.5
      ;使用BgWorker插件非常简单,只需用$0接收方法地址,然后调用BgWorker::CallAndWait。顾名思义,BgWorker调用过程是同步的,而且会Wait到InstallationMainFun方法执行结束,如果BgWorker::CallAndWait调用下面还有代码的话,只有在执行完InstallationMainFun方法后才能执行。
      BgWorker::CallAndWait
      Call CreateLink
			Call AutoNextPage
    !else
      Call InstallationMainFun4.5
      Call CreateLink
			Call AutoNextPage
    !endif
	${Else}
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
	${EndIf}
FunctionEnd

; 安装netFramework2.0编译过的对应执行主程序
Function InstallationMainFun

	SendMessage $PB_ProgressBar ${PBM_SETRANGE32} 0 100  ;总步长为顶部定义值
  CreateDirectory "$INSTDIR"
  SetOutPath "$INSTDIR"
  SetOverwrite on ;打开覆盖安装

	;SetCtlColors $Lbl_Inatalling "${TEXT_COLOR}" "${BGCOLOR}"
  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的cONTROL颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
	${NSD_SetText} $Lbl_Inatalling "正在安装 Aspose.Cells.dll"	; 安装进程显示内容

  ; 修改时要注意不要修改文件的顺序,后面的10和40是时间,是根据实际情况测试过的,进度条是依据它来处理的
	SendMessage $PB_ProgressBar ${PBM_SETPOS} 3 0 ;10 0
  File "Files\Aspose.Cells.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
	${NSD_SetText} $Lbl_Inatalling "正在安装 Aspose.Pdf.dll"	; 安装进程显示内容

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 10 0 ;40 0
  File "Files\Aspose.Pdf.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
	${NSD_SetText} $Lbl_Inatalling "正在安装 Aspose.Slides.dll"	; 安装进程显示内容

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 20 0 ;60 0
  File "Files\Aspose.Slides.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
	${NSD_SetText} $Lbl_Inatalling "正在安装 Aspose.Words.dll"	; 安装进程显示内容

  ; 修改时要注意不要修改文件的顺序,后面的10和40是时间,是根据实际情况测试过的,进度条是依据它来处理的
  SendMessage $PB_ProgressBar ${PBM_SETPOS} 30 0 ;70 0
  File "Files\Aspose.Words.dll"

  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
	${NSD_SetText} $Lbl_Inatalling "正在安装 其它文件 ..."	; 安装进程显示内容

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

  Call WriteReg ; 安装过程写入注册表信息
  Sleep 500 ; 休眠时间(单位为:ms) 毫秒

  Call GetNetFrameworkVersion ;获取.Net Framework安装的版本号

	${VersionCompare} "$R0" "5.2" $R3 ; 根据操作系统来安装不同的程序
	;MessageBox MB_OK $R3
	${If} $R3 == 0 ;判断是否为WinXP_64位,它需要安装Net2.0 SP2 64位
    Pop $R1
	  ${VersionCompare} "$R1" "2.0.50727" $R6
  	;MessageBox MB_OK $R6
    ${If} $R6 == 2
			;下载Framework2.0的64位,需要用NSISdl插件
			/*
			NSISdl::download /TRANSLATE2 '正在下载 %s' '正在连接...' '(剩余 1 秒)' '(剩余 1 分钟)' '(剩余 1 小时)' '(剩余 %u 秒)' '(剩余 %u 分钟)' '(剩余 %u 小时)' '已完成：%skB(%d%%) 大小：%skB 速度：%u.%01ukB/s' /TIMEOUT=7500 /NOIEPROXY 'http://download.huifutz.com/DataRecovery/DingjiSoft.exe' '$INSTDIR\DingjiSoft.exe'
		  Pop $R0
		  StrCmp $R0 "success" 0 +3
		  MessageBox MB_YESNO|MB_ICONQUESTION "DingjiSoft.exe 已成功下载至：$\r$\n$\t$INSTDIR\DingjiSoft.exe$\r$\n是否立即执行安装程序？" IDNO +2 ;$INSTDIR 安装目录, $EXEDIR当前目录
		  ExecWait '$INSTDIR\DingjiSoft.exe'
		  Delete "$INSTDIR\DingjiSoft.exe"
		  */

			; 安装进程显示内容
		  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
			${NSD_SetText} $Lbl_Inatalling "请耐心等候(可能会有1-2分钟), 正在下载 .NET Framework 2.0 SP2..."

		  NSISdl::download /TRANSLATE2 '正在下载 %s' '正在连接...' '(剩余 1 秒)' '(剩余 1 分钟)' '(剩余 1 小时)' '(剩余 %u 秒)' '(剩余 %u 分钟)' '(剩余 %u 小时)' '已完成：%skB(%d%%) 大小：%skB 速度：%u.%01ukB/s' /TIMEOUT=7500 /NOIEPROXY 'http://download.xjpdf.com/donet/NetFx20SP2_x64.exe' '$INSTDIR\NetFx20SP2_x64.exe'
		  Pop $R0
		  StrCmp $R0 "success" 0 +3
		  DetailPrint "正在安装 .NET Framework 2.0 SP2..."
      SendMessage $PB_ProgressBar ${PBM_SETPOS} 90 0 ;进度条显示
		  SetDetailsPrint listonly

			; 安装进程显示内容
		  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
			${NSD_SetText} $Lbl_Inatalling "请耐心等候(可能会有3-5分钟), 正在安装 .NET Framework 2.0 SP2..."

		  ExecWait '$INSTDIR\NetFx20SP2_x64.exe /quiet /norestart' $R1 ;静默安装,没有任何提示
		  Delete "$INSTDIR\NetFx20SP2_x64.exe"
    ${EndIf}
	${ElseIf} $R3 == 2 ;后者大,需要安装Net2.0 SP2 32位
    Pop $R1
	  ${VersionCompare} "$R1" "2.0.50727" $R6
  	;MessageBox MB_OK $R6
    ${If} $R6 == 2
		  /*
			;在线下载并安装程序,需要用NSISdl插件
		  NSISdl::download /TRANSLATE2 '正在下载 %s' '正在连接...' '(剩余 1 秒)' '(剩余 1 分钟)' '(剩余 1 小时)' '(剩余 %u 秒)' '(剩余 %u 分钟)' '(剩余 %u 小时)' '已完成：%skB(%d%%) 大小：%skB 速度：%u.%01ukB/s' /TIMEOUT=7500 /NOIEPROXY 'http://download.microsoft.com/download/c/6/e/c6e88215-0178-4c6c-b5f3-158ff77b1f38/NetFx20SP2_x86.exe' '$TEMP\NetFx20SP2_x86.exe'
		  Pop $R0
		  StrCmp $R0 "success" 0 +3
		  MessageBox MB_YESNO|MB_ICONQUESTION "NetFx20SP2_x86.exe 已成功下载。$\r$\n是否立即安装？" IDNO +2
		  SetDetailsPrint textonly
		  DetailPrint "正在安装 .NET Framework 2.0 SP2..."
		  SetDetailsPrint listonly
		  ExecWait '$TEMP\NetFx20SP2_x86.exe /quiet /norestart' $R1 ;静默安装,没有任何提示
		  Delete "$TEMP\NetFx20SP2_x86.exe"
		  */

			; 测试安装进程显示内容
		  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
			${NSD_SetText} $Lbl_Inatalling "请耐心等候(可能会有1-2分钟), 正在下载 .NET Framework 2.0 SP2..."

		  NSISdl::download /TRANSLATE2 '正在下载 %s' '正在连接...' '(剩余 1 秒)' '(剩余 1 分钟)' '(剩余 1 小时)' '(剩余 %u 秒)' '(剩余 %u 分钟)' '(剩余 %u 小时)' '已完成：%skB(%d%%) 大小：%skB 速度：%u.%01ukB/s' /TIMEOUT=7500 /NOIEPROXY 'http://download.xjpdf.com/donet/NetFx20SP2_x86.exe' '$INSTDIR\NetFx20SP2_x86.exe'
		  Pop $R0
		  StrCmp $R0 "success" 0 +3
		  DetailPrint "正在安装 .NET Framework 2.0 SP2..."
      SendMessage $PB_ProgressBar ${PBM_SETPOS} 90 0 ;进度条显示
		  SetDetailsPrint listonly

			; 测试安装进程显示内容
		  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
			${NSD_SetText} $Lbl_Inatalling "请耐心等候(可能会有3-5分钟), 正在安装 .NET Framework 2.0 SP2..."

		  ExecWait '$INSTDIR\NetFx20SP2_x86.exe /quiet /norestart' $R1 ;静默安装,没有任何提示
		  Delete "$INSTDIR\NetFx20SP2_x86.exe"
		${EndIf}
	${EndIf}

  SendMessage $PB_ProgressBar ${PBM_SETPOS} 100 0

FunctionEnd

; 安装netFramework4.5编译过的对应执行主程序
Function InstallationMainFun4.5
    SendMessage $PB_ProgressBar ${PBM_SETRANGE32} 0 100  ;总步长为顶部定义值

    CreateDirectory "$INSTDIR"

    ;MessageBox MB_OK "$INSTDIR"

    SetOutPath "$INSTDIR"
    SetOverwrite on

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
		${NSD_SetText} $Lbl_Inatalling "正在安装 Aspose.Cells.dll"	; 安装进程显示内容

		SendMessage $PB_ProgressBar ${PBM_SETPOS} 10 0
    File "Files\Aspose.Cells.dll"

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
		${NSD_SetText} $Lbl_Inatalling "正在安装 Aspose.Pdf.dll"	; 安装进程显示内容

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 40 0
    File "Files\Aspose.Pdf.dll"

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
		${NSD_SetText} $Lbl_Inatalling "正在安装 Aspose.Slides.dll"	; 安装进程显示内容

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 60 0
    File "Files\Aspose.Slides.dll"

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
		${NSD_SetText} $Lbl_Inatalling "正在安装 Aspose.Words.dll"	; 安装进程显示内容

    SendMessage $PB_ProgressBar ${PBM_SETPOS} 70 0
    File "Files\Aspose.Words.dll"

	  SetCtlColors $Lbl_Inatalling ""  F0F0F0 ; 背景设置成窗体的Control颜色,否则以前的字不会擦除(注意要和窗体颜色相同,否则字体那行背景色会变为不同颜色)
		${NSD_SetText} $Lbl_Inatalling "正在安装 其它文件 ... "	; 安装进程显示内容

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
    SetOverwrite on ; 覆盖安装,比较安全,只对目录有效
    ; 修改时要注意不要修改文件的顺序,后面的85是时间,是根据实际情况测试过的,进度条是依据它来处理的
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

    Call WriteReg ; 安装过程写入注册表信息
    Sleep 500 ; 休眠时间(单位为:ms) 毫秒
FunctionEnd

Function CreateLink
    ;SetShellVarContext current ;高彩芳原始代码.这里一定要使用当前用户,经过Win7 32位的测试,如果不是使用它来安装,则程序会出错
    SetShellVarContext all  ; 授予admin权限,多用户安装,将快捷方式创建到alluser的开始菜单中. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。

    ; 创建和删除目录及快捷方式
    ;CreateShortCut "$DESKTOP\迅捷PDF转换器.lnk" "$INSTDIR\PDF Convert.exe" "" "$INSTDIR\shortcut.ico" ; 发布成为不同的文件名
    ;CreateDirectory "$SMPROGRAMS\迅捷PDF转换器" ; 发布成为不同的文件名
    ;CreateShortCut "$SMPROGRAMS\迅捷PDF转换器\卸载 迅捷PDF转换器.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.ico" ; 发布成为不同的文件名
    ;CreateShortCut "$SMPROGRAMS\迅捷PDF转换器\迅捷PDF转换器.lnk" "$INSTDIR\PDF Convert.exe" "" "$INSTDIR\shortcut.ico" ; 发布成为不同的文件名

    CreateShortCut "$DESKTOP\多用户发布专用标题.lnk" "$INSTDIR\PDF Convert.exe" "" "$INSTDIR\shortcut.ico" ; 发布成为不同的文件名
    CreateDirectory "$SMPROGRAMS\多用户发布专用标题" ; 发布成为不同的文件名
    CreateShortCut "$SMPROGRAMS\多用户发布专用标题\卸载 多用户发布专用标题.lnk" "$INSTDIR\uninstall.exe" "" "$INSTDIR\uninstall.ico" ; 发布成为不同的文件名
    CreateShortCut "$SMPROGRAMS\多用户发布专用标题\多用户发布专用标题.lnk" "$INSTDIR\PDF Convert.exe" "" "$INSTDIR\shortcut.ico" ; 发布成为不同的文件名

		Sleep 100 ; 休眠时间(单位为:ms) 毫秒
FunctionEnd

; Loading完成后跳转到下一页
Function AutoNextPage
  Call NextPage
FunctionEnd

; 安装过程写入注册表信息
Function WriteReg
  SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。

  WriteUninstaller "$INSTDIR\uninstall.exe"

  ; HKCU写注册表
  WriteRegStr HKCU "Software\pdf2word" INSTDIR $INSTDIR

  ; HKLM写注册表(32位安装包在64位操作系统上会写到“HKLM\SOFTWARE\Wow6432Node”目录下)
  WriteRegStr HKLM "SOFTWARE\pdf2word" INSTDIR "$INSTDIR"
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\App Paths\pdf2word.exe" "" "$INSTDIR\PDF Convert.exe"

  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "DisplayName" "迅捷PDF转换器"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "UninstallString" '"$INSTDIR\uninstall.exe"'  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "DisplayIcon" '"$INSTDIR\shortcut.ico"'  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "DisplayVersion" "6.3.0.0"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "Publisher" "上海互盾信息科技有限公司"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "Contact" "迅捷 Support Department"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "HelpLink" "http://www.xjpdf.com"  ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "InstallLocation" "$INSTDIR" ; 发布成为不同的文件名
  ;WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器" "URLInfoAbout" "http://www.xjpdf.com"  ; 发布成为不同的文件名

  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "DisplayName" "多用户发布专用标题"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "UninstallString" '"$INSTDIR\uninstall.exe"'  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "DisplayIcon" '"$INSTDIR\shortcut.ico"'  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "DisplayVersion" "6.3.0.0"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "Publisher" "上海互盾信息科技有限公司"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "Contact" "迅捷 Support Department"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "HelpLink" "http://www.xjpdf.com"  ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "InstallLocation" "$INSTDIR" ; 发布成为不同的文件名
  WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题" "URLInfoAbout" "http://www.xjpdf.com"  ; 发布成为不同的文件名

FunctionEnd

Function onClickCloseEnd
    Call GetNetFrameworkVersion ;获取.Net Framework安装的版本号

    Pop $R1
	  ${VersionCompare} "$R1" "2.0.50727" $R6
    ${If} $R6 == 2
      ; 高彩芳原代码,是好用的,只是有"是/否",现在修改为"是"(免得客户点了否)
	    ; MessageBox MB_YESNO|MB_ICONQUESTION "迅捷PDF转换器需要.NET Framework 2.0运行环境，您机器上没有安装此环境。$\r$\n$\r$\n您可以点击“是”现在安装.NET Framework 2.0或稍后自行去互联网下载安装。$\r$\n$\r$\n是否现在安装.NET Framework 2.0？" IDYES okrun IDNO norun
	    ; 2015-12-21,郑侃炜指示,那个.NET安装，现在是 YES OR NO的提示，你换成 OK 的提示就好，直接进行安装。。省得用户点NO，然后用不了
	    ;MessageBox MB_OK "迅捷PDF转换器需要.NET Framework 2.0运行环境，您机器上没有安装此环境。$\r$\n$\r$\n您可以点击“是”现在安装.NET Framework 2.0或稍后自行去互联网下载安装。$\r$\n$\r$\n是否现在安装.NET Framework 2.0？"  ; 发布成为不同的文件名
	    MessageBox MB_OK "多用户发布专用标题需要.NET Framework 2.0运行环境，您机器上没有安装此环境。$\r$\n$\r$\n您可以点击“是”现在安装.NET Framework 2.0或稍后自行去互联网下载安装。$\r$\n$\r$\n是否现在安装.NET Framework 2.0？"  ; 发布成为不同的文件名

	    okrun:
		  Call InstallNetFramework2
		  Call GetNetFrameworkVersion ;获取.Net Framework安装的版本号
	    Pop $R1
		  ${VersionCompare} "$R1" "2.0.50727" $R6 ;比较结果为0-相等,1-前者新,2-后者新

	    ${If} $R6 == 2
		    ;MessageBox MB_ICONINFORMATION "很抱歉未能帮您成功安装.NET Framework 2.0，请您稍后自行去互联网下载安装，否则迅捷PDF转换器将无法正常工作。" IDOK +1  ; 发布成为不同的文件名
		    MessageBox MB_ICONINFORMATION "很抱歉未能帮您成功安装.NET Framework 2.0，请您稍后自行去互联网下载安装，否则多用户发布专用标题将无法正常工作。" IDOK +1  ; 发布成为不同的文件名

		    Call onClickClose
		    Quit
	    ${Else}
		    ;MessageBox MB_ICONINFORMATION ".NetFramework2.0已经成功安装在您的机器上了！$\r$\n$\r$\n您现在可以体验“迅捷PDF转换器”了。" ; 发布成为不同的文件名
		    MessageBox MB_ICONINFORMATION ".NetFramework2.0已经成功安装在您的机器上了！$\r$\n$\r$\n您现在可以体验“多用户发布专用标题”了。" ; 发布成为不同的文件名

		    Call onClickClose
		    Quit
		  ${EndIf}
		  norun:
	    ;MessageBox MB_OK "您机器上没有安装.NET Framework 2.0环境，请您稍后自行去互联网下载安装，否则迅捷PDF转换器将无法正常工作。" IDOK +1  ; 发布成为不同的文件名
	    MessageBox MB_OK "您机器上没有安装.NET Framework 2.0环境，请您稍后自行去互联网下载安装，否则多用户发布专用标题将无法正常工作。" IDOK +1  ; 发布成为不同的文件名

		  Call onClickClose
		  Quit
    ${EndIF}

	  Call onClickClose
FunctionEnd

Function onClickOpenExe
/*
    Call GetNetFrameworkVersion ;获取.Net Framework安装的版本号

    Pop $R1
	  ${VersionCompare} "$R1" "2.0.50727" $R6
    ${If} $R6 == 2
      ;高彩芳原代码,是好用的,只是有"是/否",现在修改为"是"(免得客户点了否)
	    ;MessageBox MB_YESNO|MB_ICONQUESTION "迅捷PDF转换器需要.NET Framework 2.0运行环境，您机器上没有安装此环境。$\r$\n$\r$\n您可以点击“是”现在安装.NET Framework 2.0或稍后自行去互联网下载安装。$\r$\n$\r$\n是否现在安装.NET Framework 2.0？" IDYES okrun IDNO norun
      ;2015-12-21,郑侃炜指示,那个.NET安装，现在是 YES OR NO的提示，你换成 OK 的提示就好，直接进行安装。。省得用户点NO，然后用不了
	    ;MessageBox MB_OK "迅捷PDF转换器需要.NET Framework 2.0运行环境，您机器上没有安装此环境。$\r$\n$\r$\n您可以点击“是”现在安装.NET Framework 2.0或稍后自行去互联网下载安装。$\r$\n$\r$\n是否现在安装.NET Framework 2.0？"  ; 发布成为不同的文件名
	    MessageBox MB_OK "多用户发布专用标题需要.NET Framework 2.0运行环境，您机器上没有安装此环境。$\r$\n$\r$\n您可以点击“是”现在安装.NET Framework 2.0或稍后自行去互联网下载安装。$\r$\n$\r$\n是否现在安装.NET Framework 2.0？"  ; 发布成为不同的文件名

	    okrun:
		  Call InstallNetFramework2
		  Call GetNetFrameworkVersion ;获取.Net Framework安装的版本号
	    Pop $R1
		  ${VersionCompare} "$R1" "2.0.50727" $R6
	    ${If} $R6 == 2
		    ;MessageBox MB_ICONINFORMATION "很抱歉未能帮您成功安装.NET Framework 2.0，请您稍后自行去互联网下载安装，否则迅捷PDF转换器将无法正常工作。" IDOK +1  ; 发布成为不同的文件名
		    MessageBox MB_ICONINFORMATION "很抱歉未能帮您成功安装.NET Framework 2.0，请您稍后自行去互联网下载安装，否则多用户发布专用标题将无法正常工作。" IDOK +1  ; 发布成为不同的文件名

		    Call onClickClose
		    Quit
	    ${Else}
		    ;MessageBox MB_ICONINFORMATION ".NetFramework2.0已经成功安装在您的机器上了！$\r$\n$\r$\n您现在可以体验“迅捷PDF转换器”了。"  ; 发布成为不同的文件名
		    MessageBox MB_ICONINFORMATION ".NetFramework2.0已经成功安装在您的机器上了！$\r$\n$\r$\n您现在可以体验“多用户发布专用标题”了。"  ; 发布成为不同的文件名

		    ExecShell "" "$INSTDIR\PDF Convert.exe"
		    Call onClickClose
		    Quit
		  ${EndIf}

	   	norun:
	    ;MessageBox MB_OK "您机器上没有安装.NET Framework 2.0环境，请您稍后自行去互联网下载安装，否则迅捷PDF转换器将无法正常工作。" IDOK +1  ; 发布成为不同的文件名
	    MessageBox MB_OK "您机器上没有安装.NET Framework 2.0环境，请您稍后自行去互联网下载安装，否则多用户发布专用标题将无法正常工作。" IDOK +1  ; 发布成为不同的文件名

		  Call onClickClose
		  Quit
    ${EndIF}
*/
    ExecShell "" "$INSTDIR\PDF Convert.exe"
    Call onClickClose
    ;Sleep 4200 ; 休眠时间(单位为:ms) 毫秒
FunctionEnd

; +获取.Net Framework版本支持,从注册表中读取当前是否已经安装了Net Framework,安装的是哪个版本
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

; WinXP的32位需要安装.Net Framework 2.0 SP2
Function InstallNetFramework2
/*
	;SilentInstall normal|silent|silentlog ;2015-12-21,KongMengyuan增加,静默安装,但放在这里是错误的,不能放在Function里,必须放在Section里面
  SetOutPath "$TEMP"
  File "Files\NetFx20SP2_x86.exe"
  ; 高彩芳的原始代码,正常安装(有提示)
  ;ExecWait '$TEMP\NetFx20SP2_x86.exe /norestart' $R1

	; 默认安装
	; 以下两种写法对于Framework的安装都是错误的,但是普通的Setup.exe这种写法是正确的
  ;ExecWait '$TEMP\NetFx20SP2_x86.exe /quiet /norestart' $R1
  ;ExecWait '$TEMP\NetFx20SP2_x86.exe /S' $R1
  ;2015-12-21,KongMengyuan修改,变成静默安装(没有提示),微软的官方framework的静默安装参数为  dotnetfx.exe /q:a /c:"install /q" 将上述命令参数放到InstallScript中就必须添加引号的转义符。
  ;Nsis静默安装FrameWork
  ;.NETFramework 2.0
	;dotnetfx.exe /Q:U /C:"install /L /QB"
	;.NETFramework 2.0 sp2
	;dotnetfx.exe /QB /norestart
  ;ExecWait '$TEMP\NetFx20SP2_x86.exe /q:a /c:"install /q"' $R1 ; 安装.Net2.0或者其它的FrameWork,单引号里面可以加入双引号
  ExecWait '$TEMP\NetFx20SP2_x86.exe /QB /norestart' $R1 ; 安装.Net2.0 SP2

  ClearErrors
  Delete "$TEMP\NetFx20SP2_x86.exe"
*/
FunctionEnd

/*
; WinXP的64位需要安装.Net Framework 2.0 SP2 64位,这个文件有点大,是48.524296MB(显示46.2MB),不考虑打包在一起了,2015-12-21
Function InstallNetFramework2_64
  SetOutPath "$TEMP"
  File "Files\NetFx20SP2_x64.exe"
  ExecWait '$TEMP\NetFx20SP2_x64.exe /QB /norestart' $R1 ; 安装.Net2.0 SP2 64位

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

; 把当前安装包的名字写入set.ini,便于上传到php网站统计
Function WriteIniSetupName
	; 得到当前时间,系统时间,系统当前时间
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

  ;File /oname=$EXEDIR\set.ini "ini_test.ini" ; 当前目录
  ;File /oname=$INSTDIR\set.ini "set.ini" ; 安装目录
  ;WriteINIStr "$EXEDIR\ini_test.ini" "Field 1" "Test111" "测试ini修改 datetime=$1年$2月$3日$4时$5分"
  ;ReadINIStr ${TEMP1} "$EXEDIR\ini_test.ini" "Field 1" "Test111"

  WriteINIStr "$INSTDIR\set.ini" "Install" "SetupName" $EXEFILE ; 写入安装包文件名,写入ini文件
FunctionEnd

; 把所选择的语言写入config.ini
Function WriteIniLanguage
; "$INSTDIR\config.ini"
	; 得到当前时间,系统时间,系统当前时间
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

  ;File /oname=$EXEDIR\set.ini "ini_test.ini" ; 当前目录
  ;File /oname=$INSTDIR\set.ini "set.ini" ; 安装目录
  ;WriteINIStr "$EXEDIR\ini_test.ini" "Field 1" "Test111" "测试ini修改 datetime=$1年$2月$3日$4时$5分"
  ;ReadINIStr ${TEMP1} "$EXEDIR\ini_test.ini" "Field 1" "Test111"

  WriteINIStr "$INSTDIR\config.ini" "App" "language" $LanSelect ; 写入安装语言,语言选择,zh-CN中文简体,en English,ja日本語,zh-TW中文繁體
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
		;${NSD_CreateLabel} 37 358 180 14 "同意迅捷PDF转换器"
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
    ;ExecShell "open" "http://url.pdfconvert.com/1/buy/welcome/" ; 软件安装完成后，弹出链接
    
	  Call WriteIniLanguage ; 把所选择的语言写入config.ini

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
    ;ExecShell "open" "http://url.huifudashi.com/1/buy/welcome/" ;自动弹出网址,软件安装完成后,弹出链接
FunctionEnd

;-----------------------------以下部分是卸载使用的-------------------------------------------------------

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#
;可以把这段拿到最顶部 Section Install 之后,不过只要它用的Function在它之后就可以了
Section Uninstall
SectionEnd

#-- 根据 NSIS 脚本编辑规则，所有 Function 区段必须放置在 Section 区段之后编写，以避免安装程序出现未可预知的问题。--#

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
	#检查安装互斥：#
	ReCheck:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_Install}") i .R1 ?e'
	Pop $R0
	System::Call 'kernel32::CloseHandle(i R1) i.s'
	#检查卸载互斥：#
	CheckUnInstall:
	System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_UnInstall}") i .R3 ?e'
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
		System::Call 'kernel32::CreateMutexA(i 0, i 0, t "${pdf2wordMutex_UnInstall}") i .R1 ?e'
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
  SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。
  ;Delete "$INSTDIR\*.*"   ; 这种情况会把桌面的所有程序全部删除(如果客户装在WinXP的桌面的话)
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

  ;DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\迅捷PDF转换器"; 发布成为不同的文件名
  DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\多用户发布专用标题"; 发布成为不同的文件名

  ;SetShellVarContext current ;高彩芳原始代码.这里一定要使用当前用户,经过Win7 32位的测试,如果不是使用它来安装,则程序会出错
  SetShellVarContext all  ; 授予admin权限,多用户安装. SetShellVarContext current 当前用户. 如果该指令用于安装程序,那么它只对安装程序有效,而如果它用于卸载程序,那么它仅对卸载程序有效,如果要两者都有效,你必须在安装程序和卸载程序里都使用。

	;Delete "$DESKTOP\迅捷PDF转换器.lnk"; 发布成为不同的文件名
  ;Delete "$SMPROGRAMS\迅捷PDF转换器\迅捷PDF转换器.lnk"; 发布成为不同的文件名
  ;Delete "$SMPROGRAMS\迅捷PDF转换器\卸载 迅捷PDF转换器.lnk"; 发布成为不同的文件名
  ;RMDir "$SMPROGRAMS\迅捷PDF转换器"; 发布成为不同的文件名

  Delete "$DESKTOP\多用户发布专用标题.lnk"; 发布成为不同的文件名
  Delete "$SMPROGRAMS\多用户发布专用标题\多用户发布专用标题.lnk"; 发布成为不同的文件名
  Delete "$SMPROGRAMS\多用户发布专用标题\卸载 多用户发布专用标题.lnk"; 发布成为不同的文件名
  RMDir "$SMPROGRAMS\多用户发布专用标题"; 发布成为不同的文件名

  ;MessageBox MB_OK "迅捷PDF转换器已经从您的电脑上移除！"  ; 发布成为不同的文件名
  MessageBox MB_OK "多用户发布专用标题已经从您的电脑上移除！"  ; 发布成为不同的文件名

  KillProcDLL::KillProc "Au_.exe"
  ;ExecShell "open" "http://url.huifudashi.com/1/buy/discount/" ;自动弹出网址,软件卸载时,弹出链接
FunctionEnd

Function un.onClickUninstall
  ExecShell "open" "http://www.xjpdf.com/software/pdfConvert/uninstall/" ; 软件卸载时，弹出链接
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "请查看优惠活动。是否仍然卸载本软件？"  IDYES +3 IDNO +1
  KillProcDLL::KillProc "Au_.exe"
  Quit

  ${nsProcess::FindProcess} "PDF Convert.exe" $R0
  ${nsProcess::Unload}
  ${If} $R0 == 0
		;MessageBox MB_OKCANCEL "迅捷PDF转换器正在运行，点击'确定'强制关闭迅捷PDF转换器并继续卸载，点击'取消'退出卸载。" IDOK yes_uninstall IDCANCEL no_uninstall ; 发布成为不同的文件名
		MessageBox MB_OKCANCEL "多用户发布专用标题正在运行，点击'确定'强制关闭多用户发布专用标题并继续卸载，点击'取消'退出卸载。" IDOK yes_uninstall IDCANCEL no_uninstall ; 发布成为不同的文件名

		yes_uninstall:
		  ${nsProcess::KillProcess} "PDF Convert.exe" $R1
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
