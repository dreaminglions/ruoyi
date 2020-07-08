@echo off
echo.
echo [��Ϣ] ������̣�����jar���ļ���
echo.
pause
echo.

cd %~dp0
cd..

call mvn clean package -Dmaven.test.skip=true

pause