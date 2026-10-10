@echo off
cd /d "%~dp0"
title 雀魂 rating 批量跑谱

echo ============================================================
echo            雀魂 rating 批量跑谱 (Mortal 4.1b)
echo ============================================================
echo.
echo  UID 在牌谱屋网址里, 例如
echo  https://amae-koromo.sapk.ch/player/12345678/12 里的 12345678
echo  也可以直接输入昵称, 例如: 示例玩家
echo.

set /p "WHO=请输入雀魂 UID 或昵称: "
if not defined WHO goto :noinput

set "GAMES="
set /p "GAMES=要跑最近多少局 (直接回车 = 20): "
if not defined GAMES set "GAMES=20"

set "MODE="
set /p "MODE=场次类型 玉/金/王座/玉东/金东 (直接回车 = 玉): "
if not defined MODE set "MODE=玉"

echo.
echo ------------------------------------------------------------
echo  目标: %WHO%   局数: %GAMES%   场次: %MODE%
echo  跑谱时会弹出一个浏览器窗口, 请不要关闭它(程序结束会自己关).
echo  中途可以按 Ctrl+C 中断, 下次跑会接着跑没跑完的局.
echo ------------------------------------------------------------
echo.

python mahjong_rating.py --id "%WHO%" --games %GAMES% --mode %MODE%

echo.
echo ============================================================
echo  跑完了, 图片会自动弹出来, 结果也都在 rating_out 文件夹里:
echo    rating_*.png   图表(上 rating, 下 pt, 右侧战绩)
echo    rating_*.csv   每局明细
echo    summary_*.txt  战绩概览
echo ============================================================
pause
exit /b 0

:noinput
echo.
echo 没有输入, 已退出.
pause
exit /b 1
