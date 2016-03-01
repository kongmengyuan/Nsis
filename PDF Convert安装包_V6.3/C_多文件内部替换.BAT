@ECHO OFF
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
COPY "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\B_pdf2wprd_V63_网上下载Net20_多用户发布专用标题.nsi" "F:\Work_Hudun\安装包制作\Nsis\PDF Convert安装包_KongMY_V6.3\%Obj_Current.Name:~0,3%B_pdf2wprd_V63_网上下载Net20_多用户发布专用标题.nsi"
CLS
REM ----------------------------具体程序位置--------End

SET /A Obj_Index=%Obj_Index% + 1

GOTO LoopStart
@ECHO ON
REM ------------------------------------------------------使用数组例子-----End
