SET TARGET_DIR=D:\develop\denwer\home\localhost\www



rd /s /q %TARGET_DIR%\app
rd /s /q %TARGET_DIR%\fonts
rd /s /q %TARGET_DIR%\image
rd /s /q %TARGET_DIR%\photo
rd /s /q %TARGET_DIR%\templates

del %TARGET_DIR%\*.php /f /q
del %TARGET_DIR%\*.js /f /q
del %TARGET_DIR%\*.css /f /q

xcopy dist\* %TARGET_DIR%\ /s /e
