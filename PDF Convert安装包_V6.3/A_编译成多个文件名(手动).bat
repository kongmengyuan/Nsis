@ECHO OFF
CLS
REM     ʹ�÷�������ִ��
REM     ʹ���ⲿ������01�������Դ�������F:\Temp����  (�Զ�ִ��) 02��ִ��"C_���ļ��ڲ��滻.BAT" 03���Զ���ļ��滻"���û�����ר�ñ���" 04��ִ��"D_����Dos����ֱ�ӱ���.BAT"
REM     ʹ���ⲿ������01�������Դ�������F:\Temp����  (�ֶ�ִ��) 02��ִ���±ߵ���� 03���Գ���ǩ�� 04���滻"���û�����ר�ñ���"���ٱ���"B_pdf2wprd_V63_��������Net20_���û�����ר�ñ���.nsi" 05���԰�װ��ǩ�� 06���԰�װ������
REM     Դ��·��Net20 F:\Temp\Դ��\02��pdfת����_OK\20\PdfCon_V6.3\PdfCon\PDF Convert\bin\Release
REM     Դ��·��Net45 F:\Temp\Դ��\02��pdfת����_OK\45\PdfCon_V6.3\PdfCon\PDF Convert\bin\Release

REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 01��Ѹ��PDFת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 02��pdfת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 03��pdfת����wordת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 04��wordת����pdfת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 05��pdfת����jpgת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 06��jpgת����pdfת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 07��pdfת����pptת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 08��pptת����pdfת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 09��pdfת����txtת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 10��txtת����pdfת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 11��pdfת����htmlת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 12��pdfת����excelת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 13��excelת����pdfת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 14��excelת����wordת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 15��pptת����wordת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 16��wordת����excelת����
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 17��"pdf to word converter"
REM     F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\A_����ɶ���ļ���.bat 18������PDFת����

REM     REM �滻,����������ʾ����test.rar
REM     SET "filename=testAAAABBBB.rar"
REM     SET "str=AAAABBBB"
REM     CALL SET "newname=%%filename:%str%=%%"
REM     ECHO %newname%

REM ============�Ѱ�װ����4���ļ����뵽images��============
SET input=%1%
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\����ɶ������_PDFת����\Nsis��װ��ͼƬ\%1%\*.*"
REM ע������ĳ�·��,Ҫ����˫����
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\images\"
REM ECHO �������˲���1: %fileNames1%
REM ECHO �������˲���2: %fileNames2%
COPY %fileNames1% %fileNames2% /Y

REM ============��Net20�ı����ļ����뵽Files��============
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\20\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\*.exe"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\20\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\*.manifest"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\20\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\ar"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\ar"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\20\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\en"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\en"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\20\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\zh-CN"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\zh-CN"
COPY %fileNames1% %fileNames2% /Y

REM ============��Net45�ı����ļ����뵽Files4.54.5��============
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\45\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\*.exe"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files4.5"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\45\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\*.manifest"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files4.5"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\45\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\ar"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files4.5\ar"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\45\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\en"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files4.5\en"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Temp\Դ��\%1%_OK\45\PdfCon_V6.3\PdfCon\"PDF Convert"\bin\Release\zh-CN"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files4.5\zh-CN"
COPY %fileNames1% %fileNames2% /Y

REM ============================================�˲��ֲ�ͬ=====Begin
REM ע������ǰ�治��ǰ3���ַ�(�ֶ�����)
F:
CD F:\Work_Hudun\��װ������\Nsis\PDF Convert��װ��_KongMY_V6.3
C:\Program Files (x86)\NSIS\makensis.exe B_pdf2wprd_V63_��������Net20_���û�����ר�ñ���.nsi

REM     REM ע������ǰ����ϴ��������ǰ3���ַ�(�Զ�����)
REM     C:
REM     CD "C:\Program Files (x86)"\NSIS\
REM     SET fileName=%1%
REM     makensis.exe "F:\Work_Hudun\��װ������\Nsis\PDF Convert��װ��_KongMY_V6.3"\%fileName:~0,3%B_pdf2wprd_V63_��������Net20_���û�����ר�ñ���.nsi
REM ============================================�˲��ֲ�ͬ=====End

ECHO .
ECHO .
ECHO �˴�ִ�е���     %1%
ECHO .
ECHO .
REM PAUSE