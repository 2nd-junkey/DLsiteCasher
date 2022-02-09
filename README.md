# tl;dr

DLsiteの物量に沈んで全部nasにぶん投げた人へ贈る

# install

`./install.sh //nas/DLsite ./Storage`

# usage

- install.sh
  - nasとローカルのパスでごにょごにょする
- Tools
  - convert.sh
    - 引数に渡されたサークルを全部ベアリポジトリに交換
  - check.sh
    - 新しいサークルのチェック
    - コミット漏れがあれば停止
    - プッシュ漏れがあればプッシュ
    - プッシュしてから放置してるのがあったら削除
  - link.sh
    - 新しいサークルの追加
  - dirtylsit.sh
    - 未コミット一覧を表示
  - unpushed.sh
    - 未プッシュ一覧を表示
    - 確認後push
  - clear.sh
    - 差分が無く、pushしてから一定期間たったものを削除
      - 期間は一旦1週間
