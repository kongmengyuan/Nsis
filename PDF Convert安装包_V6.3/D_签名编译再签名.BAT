@ECHO OFF
REM     REM ------------------------------------------------------使用数组例子-----Begin
REM     @ECHO OFF
REM     @ECHO 使用数组保存(注意修改第1行数组的长度)
REM     SET Obj_Length=6
REM     SET Obj[0].Name=Test0
REM     SET Obj[0].Value=Hello World
REM     SET Obj[1].Name=Test1
REM     SET Obj[1].Value=孔梦圆测试bat下面数组使用1
REM     SET Obj[2].Name=Test2
REM     SET Obj[2].Value=孔梦圆测试bat下面数组使用2
REM     SET Obj[3].Name=Test3
REM     SET Obj[3].Value=孔梦圆测试bat下面数组使用3
REM     SET Obj[4].Name=Test4
REM     SET Obj[4].Value=孔梦圆测试bat下面数组使用4
REM     SET Obj[5].Name=Test5
REM     SET Obj[5].Value=孔梦圆测试bat下面数组使用5
REM
REM     @ECHO 取出数组内容
REM     SET Obj_Index=0
REM
REM     :LoopStart
REM     IF %Obj_Index% EQU %Obj_Length% GOTO :EOF
REM
REM     SET Obj_Current.Name=0
REM     SET Obj_Current.Value=0
REM
REM     FOR /F "usebackq delims==. tokens=1-3" %%I IN (`SET Obj[%Obj_Index%]`) DO (
REM       SET Obj_Current.%%J=%%K
REM     )
REM
REM     REM ----------------------------具体程序位置--------Begin
REM     @ECHO Name = %Obj_Current.Name%
REM     @ECHO Value = %Obj_Current.Value%
REM     @ECHO.
REM     REM ----------------------------具体程序位置--------End
REM
REM     SET /A Obj_Index=%Obj_Index% + 1
REM
REM     @ECHO
REM     GOTO LoopStart
REM     @ECHO ON
REM     REM ------------------------------------------------------使用数组例子-----End


@ECHO 记录下开始时间
SET d1=%date:~0,10%
SET t1=%time:~0,8%
ECHO 开始日期%d1% 开始时间%t1%

REM ------------------------------------------------------使用数组例子-----Begin
@ECHO OFF
@ECHO 使用数组保存
SET Obj_Length=18
SET Obj[0].Name=01、迅捷PDF转换器
SET Obj[0].Value=迅捷PDF转换器
SET Obj[1].Name=02、pdf转换器
SET Obj[1].Value=pdf转换器
SET Obj[2].Name=03、pdf转换成word转换器
SET Obj[2].Value=pdf转换成word转换器
SET Obj[3].Name=04、word转换成pdf转换器
SET Obj[3].Value=word转换成pdf转换器
SET Obj[4].Name=05、pdf转换成jpg转换器
SET Obj[4].Value=pdf转换成jpg转换器
SET Obj[5].Name=06、jpg转换成pdf转换器
SET Obj[5].Value=jpg转换成pdf转换器
SET Obj[6].Name=07、pdf转换成ppt转换器
SET Obj[6].Value=pdf转换成ppt转换器
SET Obj[7].Name=08、ppt转换成pdf转换器
SET Obj[7].Value=ppt转换成pdf转换器
SET Obj[8].Name=09、pdf转换成txt转换器
SET Obj[8].Value=pdf转换成txt转换器
SET Obj[9].Name=10、txt转换成pdf转换器
SET Obj[9].Value=txt转换成pdf转换器
SET Obj[10].Name=11、pdf转换成html转换器
SET Obj[10].Value=pdf转换成html转换器
SET Obj[11].Name=12、pdf转换成excel转换器
SET Obj[11].Value=pdf转换成excel转换器
SET Obj[12].Name=13、excel转换成pdf转换器
SET Obj[12].Value=excel转换成pdf转换器
SET Obj[13].Name=14、excel转换成word转换器
SET Obj[13].Value=excel转换成word转换器
SET Obj[14].Name=15、ppt转换成word转换器
SET Obj[14].Value=ppt转换成word转换器
SET Obj[15].Name=16、word转换成excel转换器
SET Obj[15].Value=word转换成excel转换器
SET Obj[16].Name=17、pdf to word converter
SET Obj[16].Value=pdf to word converter
SET Obj[17].Name=18、好用PDF转换器
SET Obj[17].Value=好用PDF转换器

REM PAUSE
@ECHO 取出数组内容
SET Obj_Index=0

:LoopStart
IF %Obj_Index% EQU %Obj_Length% GOTO :EOF

SET Obj_Current.Name=0
SET Obj_Current.Value=0

FOR /F "usebackq delims==. tokens=1-3" %%I IN (`SET Obj[%Obj_Index%]`) DO (
  SET Obj_Current.%%J=%%K
)

REM ----------------------------具体程序位置--------Begin
@ECHO Name = %Obj_Current.Name%
@ECHO Value = %Obj_Current.Value%
@ECHO.
REM PAUSE
CALL F:\Work_Hudun\安装包制作\Nsis\"PDF Convert安装包_KongMY_V6.3"\A_编译成多个文件名.bat %Obj_Current.Name%
CLS

@ECHO =================== 对自己的软件签名 ===================
REM signtool sign /f abc.pfx /p mypassword %fileNameExe%
REM 把其中的密码替换为自己的密码。
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\PDF Convert.vshost.exe"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\PDF Convert.exe"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\Controls.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\ar\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\en\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\zh-CN\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\PDF Convert.vshost.exe"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\PDF Convert.exe"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\Controls.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\ar\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\en\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\zh-CN\PDF Convert.resources.dll"
REM 对自己的软件加盖时间戳
REM 可以使用WoSign提供的时间戳服务：http://timestamp.wosign.com/timestamp
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\PDF Convert.vshost.exe"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\PDF Convert.exe"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\Controls.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\ar\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\en\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files\zh-CN\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\PDF Convert.vshost.exe"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\PDF Convert.exe"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\Controls.dll
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\ar\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\en\PDF Convert.resources.dll"
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\Files4.5\zh-CN\PDF Convert.resources.dll"

@ECHO =================== 在Dos下面直接编译Nsis文件 ====================
C:
CD C:\"Program Files (x86)"\NSIS\
makensis.exe "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\%Obj_Current.Name:~0,3%B_pdf2wprd_V63_网上下载Net20_多用户发布专用标题.nsi"
CLS

F:
CD "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\"
DIR /W
CALL SET "fileNameExe=pdf2word.exe"
@ECHO 您输入了参数1: %fileNameExe%

@ECHO =================== 对自己的软件签名 ===================
REM signtool sign /f abc.pfx /p mypassword %fileNameExe%
REM 把其中的密码替换为自己的密码。
REM signtool sign /f 上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J %fileNameExe%
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" sign /f F:\Work_Hudun\安装包制作\数字签名_混淆加密\互盾签名\上海信息技术有限公司_sha256_cn\pfx+MS\上海苍果信息技术有限公司.pfx /p S3225GdJ5H23236J %fileNameExe%
REM 对自己的软件加盖时间戳
REM 可以使用WoSign提供的时间戳服务：http://timestamp.wosign.com/timestamp
"C:\Program Files (x86)\Windows Kits\8.1\bin\x64\signtool.exe" timestamp /t http://timestamp.wosign.com/timestamp %fileNameExe%

@ECHO 删除原文件名
DEL %Obj_Current.Name%.exe /F/Q
@ECHO 重命名
REN %fileNameExe% %Obj_Current.Name%.exe

REM ----------------------------具体程序位置--------End

SET /A Obj_Index=%Obj_Index% + 1

REM -----Aspose的转换有时会死机,此处停一下-----Begin
@ECHO 这是一个计时器的示例,等候0.5分钟(30秒),
SET d=%date:~0,10%
SET t=%time:~0,8%
ECHO 当前日期%d% 当前时间%t%
SET minute=%time:~3,2%+0.5
SET FileTime=%time:~0,3%%minute%
SET pt=%FileTime%
PING -n %pt% 127.0.0.1>nul
@ECHO 时间到
SET t=%time:~0,8%
ECHO 当前日期%d% 当前时间%t%
REM -----Aspose的转换有时会死机,此处停一下-----End

REM PAUSE
GOTO LoopStart
@ECHO ON
REM ------------------------------------------------------使用数组例子-----End

@ECHO 记录下结束时间
SET d2=%date:~0,10%
SET t2=%time:~0,8%
ECHO 结束日期%d2% 结束时间%t2%

@ECHO 计算时间差
CALL :time2sec %time1%
SET t1=%ns%
CALL :time2sec %time1%
SET t1=%ns%
SET /a tdiff=%t2% - %t1%
@ECHO .
@ECHO .
@ECHO 最终从 %time1% 到 %time2% 用时 %tdiff% 秒.
@ECHO .
@ECHO .
PAUSE

:time2sec
REM 将时间转换成秒数，保存到ns中
SET tt=%1
SET hh=%tt:~0,2%
SET mm=%tt:~3,2%
SET ss=%tt:~6,2%
SET /a ns=(%hh%*60+%mm%)*60+%ss%
GOTO :EOF

REM     @ECHO 两个时间差. Bat语句中计算两个时间差,可以先将时间转换成秒数,然后将两个时间数进行相减。
REM     @ECHO off
REM     SET ns=0
REM     REM 显示开始时间
REM     SET time1=%time%
REM     ECHO 当前时间是%time1%
REM     CALL :time2sec %time1%
REM     SET t1=%ns%
REM     PAUSE
REM     REM 显示结束时间
REM     SET time2=%time%
REM     ECHO 当前时间是%time2%
REM     CALL :time2sec %time2%
REM     SET t2=%ns%
REM     REM 计算时间差
REM     SET /a tdiff=%t2% - %t1%
REM     ECHO diff %time1% from %time2% = %tdiff% seconds.
REM
REM     PAUSE
REM     GOTO :EOF
REM
REM     :time2sec
REM     REM 将时间转换成秒数，保存到ns中
REM     SET tt=%1
REM     SET hh=%tt:~0,2%
REM     SET mm=%tt:~3,2%
REM     SET ss=%tt:~6,2%
REM     SET /a ns=(%hh%*60+%mm%)*60+%ss%
REM     GOTO :EOF