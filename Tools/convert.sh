#!/bin/bash

# 引数を対象サークルのパスとして対応
cd "$1"
SOURCE="$PWD"
echo "$SOURCEPATH"

# 一時避難先のパス
OUTPUTPATH="$(mktemp -d)"
echo "$OUTPUTPATH"

# 掃い出し
cd "$SOURCEPATH"
mv -v * "$OUTPUTPATH/"

# ベアリポジトリに変換
git init --bare

# リポジトリ登録
cd "$OUTPUTPATH"
git init
# 登録前のあれこれ
git config core.autocrlf false
find . -type d -empty -exec touch "{}/.gitkeep" \;
git add .
# メッセージはﾃｷﾄｰ
git commit -m init
git remote add origin "$SOURCEPATH"
git push --set-upstream origin master

# 後処理
cd "$SOURCE"
rm -vfr "$OUTPUTPATH"

exit $?

