@echo off
set "sysdsk=%USERPROFILE:~0,1%"
set "target=Desktop"
set "lnkdir=%USERPROFILE%\%target%"

for %%d in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
	if not %%d == %sysdsk% (
		if exist "%%d:\%target%" (
			echo find: %%d:\%target%
			dir /a "%USERPROFILE%" 2>nul | findstr /i /c:"%target% [%%d:\%target%]" >res.findstr
			for %%I in (res.findstr) do @if %%~zI EQU 0 (
				if exist %lnkdir% (
					ren %lnkdir% %target%.bak
					echo rename
				)
				mklink /j %lnkdir% %%d:\%target%
				echo mklink
			) else (
				echo find link
				goto end_loop
			)

			goto end_loop
		)
	)
)
:end_loop

:: 任务计划设置用户登录后启动
:: Add it to Task Scheduler, exec when user login.
:: 自动映射当前用户Desktop至第一个匹配到磁盘的Desktop目录
:: It will mklink user's Desktop to the first matched disk Desktop dir.

:: 对于那些喜欢把文件存在桌面的, 经常系统盘空间不够的用户有用
:: Useful to those love to save file on Desktop without enough disk space.

:: 需要先在目标磁盘手动建立 Desktop 目录
:: Need to mkdir Desktop on target disk first.
