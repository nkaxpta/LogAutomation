## 概要
サーバログアウト時の作業ログを自動で保存する.batファイルです。

## 事前設定
1. .batファイルをメモ帳などで開く  
2. 5行目 `set LOGFILE_PATH="<ログ保存フォルダ>"` の""内に作業ログを保存したいフォルダパスを貼り付け保存する
#### 注意
.batファイルは仕様上文字コードが**Shift-JIS**出ないと文字化けを起こし、正常に動きません。必ずShift-JISにしてから保存してください。

## 使い方
1. 作業ログをクリップボードにコピーした状態で.batファイルを開く  
2. 保存したい名前を入力しEnter  
3. ②が終了後に勝手に保存されます（デフォルトでの保存名は yyyy-mm-dd <②で入力した名前>）

## 補足：タスクバーなどに登録して一発で起動する方法
.batファイルはWindowsの仕様上、このままではタスクバーやスタートメニューにピン止めすることができません。  
しかし、ショートカットは追加することができるため、以下の方法でピン止め禁止を回避します。  

1. .batファイルのショートカットを作成  
2. 作成したショートカットのプロパティのリンク先の先頭に `cmd.exe /c ` を追記し、適用  
※「/c」の後に半角スペースあり
3. ショートカットをタスクバーなどにピン止め  

これでショートカットをクリックするだけで勝手に.batファイルが起動されるようになります。