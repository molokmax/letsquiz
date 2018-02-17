SET TARGET_DIR=D:\develop\denwer\home\localhost\www



rd /s /q %TARGET_DIR%\app
rd /s /q %TARGET_DIR%\fonts
rd /s /q %TARGET_DIR%\image
rd /s /q %TARGET_DIR%\photo
rd /s /q %TARGET_DIR%\templates

del %TARGET_DIR%\*.php /f /q
del %TARGET_DIR%\*.js /f /q
del %TARGET_DIR%\*.css /f /q

xcopy app %TARGET_DIR%\app\ /s /e
xcopy fonts %TARGET_DIR%\fonts\ /s /e
xcopy image %TARGET_DIR%\image\ /s /e
xcopy photo %TARGET_DIR%\photo\ /s /e
xcopy templates %TARGET_DIR%\templates\ /s /e

xcopy *.php %TARGET_DIR%\
xcopy *.js %TARGET_DIR%\
xcopy *.css %TARGET_DIR%\
