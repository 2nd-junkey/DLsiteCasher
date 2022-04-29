#!/bin/bash

# 引数を"/root/**/サークル/作品"の親ディレクトリのパスとして処理
if [ "$1" == "" ]; then
    echo "第一引数(対象)未設定"
    exit 1
fi
if [ ! -d "$1" ]; then
    echo "directory($1) is not exist"
    exit 1
fi
TARGETROOT="$1"

if [ "$2" == "" ]; then
    echo "第二引数(保存先)未設定"
fi
if [ ! -d "$2" ]; then
    echo "directory($2) is not exit"
fi
SAVEROOT=""$2""

cd "$TARGETROOT"
git init
git config core.autocrlf false

find "$TARGETROOT" -mindepth 3 -maxdepth 3 -type d -not -path "*/.git/*" | while read dname; do
  #echo "dname: $dname"
  cd "$dname"
  # サークル
  cd ..
  CIRCLE=`basename "$(pwd)"`
  #echo "circle: $CIRCLE"
  cd - > /dev/null

  # 作品
  PRODUCT=`basename "$(pwd)"`
  #echo "product: $PRODUCT"

  # 保存先の更新
  SAVEPATH="$SAVEROOT/$CIRCLE/$PRODUCT"
  #echo "savepath: $SAVEPATH"


  # 出力先の処理
  mkdir -p "$SAVEPATH"
  cd "$SAVEPATH"
  git init --bare
  cd -

  # リポジトリ
  git init
  git config core.autocrlf false
  find . -type d -empty -exec touch "{}/.gitkeep" \;
  git add .
  git commit -m init
  git remote add origin "$SAVEPATH"
  git push --set-upstream origin master

  # submodule登録
  cd ..
  rm -fr "$PRODUCT"
  git submodule add "$SAVEPATH"


  # 事後処理
  echo

done
exit $?
