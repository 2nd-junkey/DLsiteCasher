# tl;dr

DLsiteの物量に沈んで全部nasにぶん投げた人へ贈る

# install

`./Tools/install.sh //nas/DLsite ./Storage`

# usage

- install.sh
  - `Tools/convert.sh`に各サークルのパスを渡す
  - 指定したディレクトリにsubmoduleのリンクを生成
- Tools
  - convert.sh
    - 引数に渡されたサークルを全部ベアリポジトリに交換
  - addNewCiecle.sh
    - 新しいサークルのチェック
    - 必要なら追加
  - uncommit.sh
    - 未コミット一覧を表示
  - pushAll.sh
    - 未プッシュ一覧を表示
    - 確認後push
  - clear.sh
    - 差分が無く、pushしてから一定期間たったものを削除
      - 期間は一旦1週間
