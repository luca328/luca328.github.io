git pull
git add *
@echo off
set /p commit= "Enter commit name: "
git commit -m "%commit%"
git push

timeout /t 60
