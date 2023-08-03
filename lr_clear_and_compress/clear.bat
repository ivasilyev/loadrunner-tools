@echo off

rem Usage: script.bat <directory>

::
:: The script removes redundant LR assets (like web, sapgui)
:: The output is muted for non-existing files
::

set "S_NAME=%cd%"
set "D_NAME=%1"

cd /d "%D_NAME%"

title Clear LR temp files

if exist vuser_init.c ( 
    for /D %%i in ("%cd%") do (
        for /D %%j in ("%%i\result*") do (
            rd /S /Q "%%j" && echo Remove %%j
        )
        for /D %%j in ("%%i\DfeConfig" "%%i\data") do ( 
            if exist %%j ( 
                rd /S /Q %%j && echo Remove %%j 
            )
        )
    )
) else (
    for /D %%i in ( "%cd%\*" ) do (
        for /D %%j in ("%%i\result*") do rd /S /Q "%%jn" && echo Remove %%j
        for /D %%j in ("%%i\DfeConfig" "%%i\data") do if exist %%j ( 
            rd /S /Q %%j && echo Remove %%j 
        )

    echo Check children directories
    for /D %%k in ( "i\*" ) do (
        for /D %%l in ("%%k\result*") do rd /S /Q "%%l" && echo Remove "%%l"
        for /D %%l in ("%%k\DfeConfig" "%%k\data") do if exist %%l (
            rd /S /Q %%l && echo Remove %%l 
        )
    )
)

set DELETE_LIST=^
    *.bak ^
    *.ci ^
    *.log ^
    *.idx ^
    *.pickle ^
    *.sdf ^
    *.tmp ^
    data.zip ^
    combined*.c ^
    output* ^
    mdrv* ^
    options.txt ^
    pre_cci.c ^
    shunra.shunra ^
    replay.har ^
    Bookmarks.xml ^
    Breakpoints.xml ^
    CompilerLogMetadata.xml ^
    ReplaySummaryReport.xml ^
    ScriptUploadMetadata.xml  ^
    UserTasks.xml ^
    Watches.xml ^
    TransactionsData.db  ^
    custom_body_variables.txt

del %delete_list% /s /Q 2>&1 | findstr -v "Could Not Find”

cd /d "%S_NAME%"
