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

@ECHO =================== ������Ӧ�ļ���������ļ��滻����Ŀ¼�ļ� ====================
SET input=%1%
REM -----�����滻��װ����Ӧ�ļ�-----
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_Nsis��װ��\%1%\*.BMP"
REM ע������ĳ�·��,Ҫ����˫����
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\images"
ECHO �������˲���1: %fileNames1%
ECHO �������˲���2: %fileNames2%
COPY %fileNames1% %fileNames2% /Y

CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_Nsis��װ��\%1%\license.rtf"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\license"
COPY %fileNames1% %fileNames2% /Y

REM =======�����滻�����Ӧ�ļ�=========
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_����ͼƬ\%1%\ClearListTips_01.png"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\zh-CN\ClearListTips01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_����ͼƬ\%1%\frmAutoUpdate01.png"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\zh-CN\frmAutoUpdate01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_����ͼƬ\%1%\frmSplash.png"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\zh-CN\frmSplash"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_����ͼƬ\%1%\header_01.png"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\zh-CN\MainInfo01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_����ͼƬ\%1%\PassWordDlg_01.png"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\zh-CN\PassWordDlg01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_����ͼƬ\%1%\RegDlg_01.png"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\zh-CN\RegDlg01"
COPY %fileNames1% %fileNames2% /Y
CALL SET "fileNames1= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\����ɶ������\��_����ͼƬ\%1%\RegTips_01.png"
CALL SET "fileNames2= F:\Work_Hudun\��װ������\Nsis\"PDF Convert��װ��_KongMY_V6.3"\Files\zh-CN\RegTips01"
COPY %fileNames1% %fileNames2% /Y

REM ============================================�˲��ֲ�ͬ=====Begin
REM ע������ǰ�治��ǰ3���ַ�(�ֶ�����)
F:
CD F:\Work_Hudun\��װ������\Nsis\PDF Convert��װ��_KongMY_V6.3
REM C:\Program Files (x86)\NSIS\makensis.exe B_pdf2wprd_V63_��������Net20_���û�����ר�ñ���.nsi

REM ע������ǰ����ϴ��������ǰ3���ַ�(�Զ�����)
C:
CD "C:\Program Files (x86)"\NSIS\
SET fileName=%1%
makensis.exe "F:\Work_Hudun\��װ������\Nsis\PDF Convert��װ��_KongMY_V6.3"\%fileName:~0,3%B_pdf2wprd_V63_��������Net20_���û�����ר�ñ���.nsi
REM ============================================�˲��ֲ�ͬ=====End

ECHO .
ECHO .
ECHO �˴�ִ�е���     %1%
ECHO .
ECHO .
REM PAUSE