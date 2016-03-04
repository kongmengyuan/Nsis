@ECHO OFF
CLS
REM     使用方法：先执行
REM     使用外部参数：01、编译好源码程序在F:\Temp下面  (自动执行) 02、执行"C_多文件内部替换.BAT" 03、对多个文件替换"多用户发布专用标题" 04、执行"D_测试Dos下面直接编译.BAT"
REM     使用外部参数：01、编译好源码程序在F:\Temp下面  (手动执行) 02、执行下边的语句 03、对程序签名 04、替换"多用户发布专用标题"并再编译"B_pdf2wprd_V63_网上下载Net20_多用户发布专用标题.nsi" 05、对安装包签名 06、对安装包改名
REM     源码路径Net20 F:\Temp\源码\02、pdf转换器_OK\20\PdfCon_V6.3\PdfCon\PDF Convert\bin\Release
REM     源码路径Net45 F:\Temp\源码\02、pdf转换器_OK\45\PdfCon_V6.3\PdfCon\PDF Convert\bin\Release

REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 01、迅捷PDF转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 02、pdf转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 03、pdf转换成word转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 04、word转换成pdf转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 05、pdf转换成jpg转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 06、jpg转换成pdf转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 07、pdf转换成ppt转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 08、ppt转换成pdf转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 09、pdf转换成txt转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 10、txt转换成pdf转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 11、pdf转换成html转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 12、pdf转换成excel转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 13、excel转换成pdf转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 14、excel转换成word转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 15、ppt转换成word转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 16、word转换成excel转换器
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 17、"pdf to word converter"
REM     F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat 18、好用PDF转换器

REM     REM 替换,以下内容显示的是test.rar
REM     SET "filename=testAAAABBBB.rar"
REM     SET "str=AAAABBBB"
REM     CALL SET "newname=%%filename:%str%=%%"
REM     ECHO %newname%

REM ============把安装包的4个文件拷入到images中============
SET input=%1%
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\打包成多个名称_PDF转换器\Nsis安装包图片\%1%\*.*"
REM 注意下面的长路径,要加上双引号
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\images\"
REM ECHO 您输入了参数1: %fileNames1%
REM ECHO 您输入了参数2: %fileNames2%
COPY %fileNames1% %fileNames2% /Y

@ECHO =================== 拷贝对应文件名下面的文件替换基础目录文件 ====================
SET input=%1%
REM -----拷贝替换安装包对应文件-----
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_Nsis安装包\%1%\*.BMP"
REM 注意下面的长路径,要加上双引号
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\images"
ECHO 您输入了参数1: %fileNames1%
ECHO 您输入了参数2: %fileNames2%
COPY %fileNames1% %fileNames2% /Y

CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_Nsis安装包\%1%\license.rtf"
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\license"
COPY %fileNames1% %fileNames2% /Y

REM =======拷贝替换程序对应文件=========
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_程序图片\%1%\ClearListTips_01.png"
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\Files\zh-CN\ClearListTips01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_程序图片\%1%\frmAutoUpdate01.png"
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\Files\zh-CN\frmAutoUpdate01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_程序图片\%1%\frmSplash.png"
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\Files\zh-CN\frmSplash"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_程序图片\%1%\header_01.png"
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\Files\zh-CN\MainInfo01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_程序图片\%1%\PassWordDlg_01.png"
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\Files\zh-CN\PassWordDlg01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_程序图片\%1%\RegDlg_01.png"
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\Files\zh-CN\RegDlg01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\打包成多个名称\中_程序图片\%1%\RegTips_01.png"
CALL SET "fileNames2= F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\Files\zh-CN\RegTips01"
COPY %fileNames1% %fileNames2% /Y

REM ============================================此部分不同=====Begin
REM 注意名称前面不加前3个字符(手动运行)
F:
CD F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3
REM C:\Program Files (x86)\NSIS\makensis.exe B_pdf2wprd_V63_网上下载Net20_多用户发布专用标题.nsi

REM 注意名称前面加上传入参数的前3个字符(自动运行)
C:
CD "C:\Program Files (x86)"\NSIS\
SET fileName=%1%
makensis.exe "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3"\%fileName:~0,3%B_pdf2wprd_V63_网上下载Net20_多用户发布专用标题.nsi
REM ============================================此部分不同=====End

ECHO .
ECHO .
ECHO 此次执行的是     %1%
ECHO .
ECHO .
REM PAUSE