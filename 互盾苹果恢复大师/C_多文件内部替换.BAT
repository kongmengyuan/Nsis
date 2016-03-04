@ECHO OFF
REM ------------------------------------------------------使用数组例子-----Begin
@ECHO OFF
@ECHO 使用数组保存
SET Obj_Length=1
SET Obj[0].Name=00、互盾苹果恢复大师
SET Obj[0].Value=互盾苹果恢复大师

REM PAUSE
@ECHO 取出数组内容
SET Obj_Index=0

:LoopStart
REM IF %Obj_Index% EQU %Obj_Length% GOTO :EOF
IF %Obj_Index% EQU %Obj_Length% GOTO :allEnd

SET Obj_Current.Name=0
SET Obj_Current.Value=0

FOR /F "usebackq delims==. tokens=1-3" %%I IN (`SET Obj[%Obj_Index%]`) DO (
  SET Obj_Current.%%J=%%K
)

REM ----------------------------具体程序位置--------Begin
@ECHO Name = %Obj_Current.Name%
@ECHO Value = %Obj_Current.Value%
@ECHO.

REM set str=123456789
REM echo 第一个字符为：%str:~0,1%
REM echo 头两个字符为：%str:~0,2%
REM echo 头5个字符为：%str:~0,5%
REM echo 去掉最后一个字符后的字符串为：%str:~0,-1%
REM echo 去掉最后3个字符后的字符串为：%str:~0,-3%
REM echo 第4个字符为：%str:~3,1%
REM echo 第4个及其之后的3个字符为：%str:~3,4%
REM echo 最后一个字符为：%str:~-1%
REM echo 最后一个字符为：%str:~-1,1%
REM echo 最后两个字符为：%str:~-1,2%
REM echo 倒数第4个字符为：%str:~-4,1%
REM echo 倒数第4个及其之后的字符为：%str:~-4%
REM echo 倒数第4个及其之后的1个字符为：%str:~-4,2%
REM echo 倒数第4个及其之后的2个字符为：%str:~-4,3%

@ECHO 头3个字符为：%str:~0,3%
REM ----打包源码----
COPY "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\B_互盾苹果恢复大师_多用户发布专用标题.nsi" "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\%Obj_Current.Name:~0,3%B_互盾苹果恢复大师_多用户发布专用标题.nsi"
REM ----4张安装包替换图片----
MD "0_images_%Obj_Current.Value%"
COPY "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\images\banner1.bmp" "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\0_images_%Obj_Current.Value%"
COPY "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\images\banner2.bmp" "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\0_images_%Obj_Current.Value%"
COPY "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\images\banner3.bmp" "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\0_images_%Obj_Current.Value%"
COPY "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\images\banner4.bmp" "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\0_images_%Obj_Current.Value%"
REM ----License用户许可协议----
MD "0_license_%Obj_Current.Value%"
COPY "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\license" "F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\0_license_%Obj_Current.Value%"
CLS
REM ----------------------------具体程序位置--------End

SET /A Obj_Index=%Obj_Index% + 1

GOTO LoopStart
@ECHO ON
REM ------------------------------------------------------使用数组例子-----End

:allEnd
REM ----手动执行对应的目录exe文件,C_替换对应nsi文件-----
REM ----要等上面的代码执行完再手动替换这个文件,执行按钮"下面的数据对应替换"----
REM CALL F:\Work_Hudun\安装包制作\Nsis\互盾苹果恢复大师\C_替换对应nsi文件\nsiReplace\bin\Debug\nsiReplace.exe
