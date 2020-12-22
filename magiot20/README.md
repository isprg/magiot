# BYOD下における応用演習環境の構築
## リポジトリの内容
- このリポジトリの内容はBYOD下での応用演習環境の一部である
- PortableGitの変更内容，PortableGitのバイナリを実行するためのオプション付きexeを作成するフォルダの3つをこのリポジトリで管理する
  - 各フォルダの詳細はそれぞれのフォルダのReadme.md参照のこと
- 実行環境はPython3.8.2, node-v12.16.3-win-x64, visual studio code-1.44.0-30を想定

## 演習環境の準備
### フォルダの作成とダウンロード
- `C:\`ドライブに`oit`という名前のフォルダを作成する
- `oit-magiot20200502.exe` をダウンロードする
- `C:\oit\` の中に`oit-magiot20200502.exe`を置いて実行する
- 解凍先に`C:\oit\`を指定する．

### vscode, winpython, portablegit, nodeのインストール
- 自己解凍ファイル展開後のフォルダ構成は以下のとおり(X,Y,Zにはバージョン番号が入る)
```
C:\oit\magiotYY\vscode-portable-win64-1.XX.Y-Z\app
C:\oit\magiotYY\vscode-portable-win64-1.XX.Y-Z\data
C:\oit\magiotYY\vscode-portable-win64-1.XX.Y-Z\vscode-portable.exe
:
C:\oit\magiotYY\node-vXX.YY.Z-win-x64\node_modules
C:\oit\magiotYY\node-vXX.YY.Z-win-x64\node.exe
:
C:\oit\magiotYY\PortableGit-2.XX.Y-64\bin
C:\oit\magiotYY\PortableGit-2.XX.Y-64\cmd
C:\oit\magiotYY\PortableGit-2.XX.Y-64\etc
C:\oit\magiotYY\PortableGit-2.XX.Y-64\usr
C:\oit\PortableGit-2.XX.Y-64\git-bash.exe
:
C:\oit\magiotYY\WPy64-XXXX\notebooks
C:\oit\magiotYY\WPy64-XXXX\python-3.8.1.amd64
:
C:\oit\magiotYY\magiot-bash-2.XX.Y-64.exe
```
### 環境の初期化
- `C:\oit\magiot20\magiot-bash-2.25.0-64.exe` を実行する．
- bashのターミナルが起動し，ホームディレクトリのセットアップが行われるので，下記を実行して移動し，フォルダを確認する
```bash
$ cd
$ pwd
/c/Users/????????/oithomes/magiot
```
- ユーザのホームディレクトリに`oithomes/magiot/kadai/magiot20`というフォルダができる．

### vscodeの準備
- 設定ファイルをダウンロードするために下記コマンドを実行する
```bash
$ gomagiot
```
- vscodeを起動し，ファイル->フォルダーを開く，で`oithomes/magiot/kadai/magiot20`を開く
  - vscodeの背景が白くなったらOK
  - `C:\byod\magiot20\vscode-portable-win64-1.XX.Y-ZZ\vscode-portable.exe` を実行する
- vscodeのエクスプローラが開くので，`magiot20`の中に適当にフォルダを作成する
  - 右クリックで新しいフォルダー
- フォルダーの中に適当にpythonのファイルを作成する

### vscodeのwarningの解決
#### Linter pylint is not installed
- pylintをインストールする
- bashのターミナルで下記コマンドを実行する
```bash
$ pip install pylint
```
- インストールが正常に完了したらvscodeを再起動する

### Firebase Realtime Database on JS
- https://tech-blog.rakus.co.jp/entry/20190930/firebase
- このとおりにしたらいけた．
- pythonでやる場合もDBの設定までは同じようにやると良いかと

### Firebase Realtime Database on python
#### 参考サイト
- 一通り見ること
- https://qiita.com/sai-san/items/24dbee74c5744033c330
- https://firebase.google.com/docs/database/admin/start?hl=ja
- https://firebase.google.com/docs/admin/setup?hl=ja
  - 認証に必要なjsonファイルの作成はここを参考にする
#### 基本的な手順
- `pip install firebase-admin` 実行
- firebaseで認証のためのjsonファイルをダウンロード
- vscodeでpythonのプログラムを書く
- vscodeのターミナル(Ctl+@で開く）でpythonファイルを実行する(`python hoge.py`)．以上．

# magiot環境初期セットアップ詳細
- 以下は0から開発環境のセットアップを行う際に参考にする情報なので，通常は気にしなくて良い．
## Step1. VSCode Portableのダウンロード
- [Download VSCode](https://portapps.github.io/app/vscode-portable/#download)から最新バージョンの7z archive (Windows 64-bits)をダウンロードし，c:\oit\magiotYYに保存・実行（展開）する．
  - 何故か本家のvscodeをportableモードで動かすより，こちらのほうが安定する．

## Step2. 以下の2つをC:\oit\magiotYY以下に追加インストール
- ディレクトリ名を指定のものに変更する
- PortableGit(x64)（解凍するだけ）
  - フォルダ名は「PortableGit-2.20.0-64」のようにつける
  - [PortableGit-2.xx.x.xx-64-bit.7z.exe](https://github.com/git-for-windows/git/releases)
  - bash.exe経由で起動するように本リポジトリのadv-bashフォルダからexeファイルを作成しておく
    - go環境を作成し(msys2のpacman利用)，adv-bash/build_adv-bash.sh を実行する．その後ファイル名をadv-bash-2.xx.x-64.exe にし，`c:\oit\is\_devYY\`直下に配置する．
    - exeはリポジトリにもUPされているので，それをそのまま使っても良い

## Step3. vscodeの拡張機能の追加
- EvilInspector
- Japanese Language Pack
- Local History
- python


## Step4. VS Codeユーザー設定の変更
- ファイル->基本設定->設定をクリックする
- ユーザー設定を選択し，updateで設定を検索する．
- 拡張機能やアプリケーションの更新関連の自動アップデート等をすべてOFFにしておく
  - `C:\oit\vscode-portable-win64-1.XX.Y-Z\data\appdata\Code\User\settings.json` ファイルが生成されるので，下記のようになっているか確認しておくこと
  - 最初から当該内容のファイルを作成するのでもOK．なお，bash.exeに関連する設定(terminal.integratedで始まる3つの設定)はspringbootには必ずしもなくてもよいが，vscode上でF5でアプリケーション実行する際には必要．

```json
{
  "terminal.integrated.shell.windows": "C:\\oit\\magiotYY\\PortableGit-2.23.0-64\\bin\\bash.exe",
  "terminal.integrated.env.windows": {
    "MSYSTEM": "MINGW64",
    "CHERE_INVOKING": "1"
  },
  "terminal.integrated.shellArgs.windows": [
    "--login",
    "-i"
  ],
    "update.enableWindowsBackgroundUpdates": false,
    "update.mode": "none",
    "update.showReleaseNotes": false,
    "extensions.autoUpdate": false,
    "extensions.autoCheckUpdates": false,
    "extensions.ignoreRecommendations": true,
    "extensions.showRecommendationsOnlyOnDemand": true,
    "editor.suggestSelection": "first",
    "vsintellicode.modify.editor.suggestSelection": "automaticallyOverrodeDefaultValue"
}```

## Step5. VS Codeワークスペース設定
- 自動整形設定やjava.homeの設定(settings.jsonに追記）
  - https://qiita.com/maron8676/items/017cd830ab0c5fb8bcac
- springbootなどのフォルダの.vscode\.settings.jsonファイルの設定
  - 例えば以下のような感じ
```json
{
  "files.encoding": "utf8",
  "java.home": "C:\\oit\\magiotYY\\amazonjdk11.0.3_7",
  "java.jdt.ls.vmargs": "-noverify -Dfile.encoding=utf8 -Xmx1G -XX:+UseG1GC -XX:+UseStringDeduplication",
  "java.trace.server": "messages",
  "java.errors.incompleteClasspath.severity": "ignore",
  "terminal.integrated.shell.windows": "C:\\oit\\magiotYY\\PortableGit-2.23.0-64\\bin\\bash.exe",
  "terminal.integrated.env.windows": {
    "MSYSTEM": "MINGW64",
    "CHERE_INVOKING": "1"
  },
  "terminal.integrated.shellArgs.windows": [
    "--login",
    "-i"
  ],
  "extensions.ignoreRecommendations": true,
  "files.exclude": {
    "bin/": true,
    ".*": true,
    "**/.*": true,
    "**/.classpath": true,
    "**/.project": true,
    "**/.settings": true,
    "**/.factorypath": true
  },
  "workbench.editor.enablePreview": false,
  "workbench.colorTheme": "Default Light+",
  "workbench.editor.labelFormat": "short", // タブに表示する文字列の設定
  "workbench.editor.tabSizing": "shrink", // タブの表示設定
  "files.eol": "\n",
  "files.autoSave": "onFocusChange",
  "files.insertFinalNewline": true, // ファイルの保存時に末尾を改行
  "files.trimFinalNewlines": true, // ファイルの保存時に最終行以降をトリミング
  "files.trimTrailingWhitespace": true, // ファイルの保存時に行末の空白をトリミング
  "editor.codeLens": false,
  "editor.renderWhitespace": "boundary",
  "editor.fontFamily": "Consolas, monospace",
  "editor.fontSize": 15,
  "editor.formatOnPaste": true,
  "editor.formatOnSave": true,
  "editor.formatOnType": true,
  "editor.tabSize": 2,
  "editor.tabCompletion": "on",
  "editor.detectIndentation": false,
  "editor.wordWrap": "on",
  "editor.renderControlCharacters": true,
  "editor.minimap.showSlider": "always",
  "editor.renderLineHighlight": "all", // 選択行を行番号含めすべてハイライト
  "editor.quickSuggestions": {
    "comments": false, // コメント内では無効
    "strings": true, // 文字列内では有効
    "other": true //  その他の場所で有効
  },
  "editor.folding": true, // コードの折りたたみを許可
  "editor.lineNumbers": "on", // 行番号の表示
  "editor.matchBrackets": true, // 対応する括弧の強調表示をオンに
  "git.enabled": false,
  "telemetry.enableTelemetry": false,
  "telemetry.enableCrashReporter": false,
  "java.configuration.updateBuildConfiguration": "automatic"
}
```

### Step6. 不要なフォルダを削除（配布時のみ必要）
- `C:\oit\magiotYY\vscode-portable-win64-1.31.0-1\data\appdata\Code`の中身を以下を除いて削除する．
  - `C:\oit\magiotYY\vscode-portable-win64-1.31.0-1\data\appdata\Code\User\settings.json,locale.json`
  - `C:\oit\magiotYY\vscode-portable-win64-1.31.0-1\data\appdata\Code\languagepacks.json`
- `C:\oit\magiotYY\vscode-portable-win64-1.31.0-1\data\extensions\redhat.java-0.38.0\server\config_win`以下にキャッシュができる場合があるので削除する(config.ini以外はキャッシュ）
- `C:\oit\magiotYY\vscode-portable-win64-1.31.0-1\data\logs`フォルダを丸ごと削除
- `C:\oit\magiotYY\vscode-portable-win64-1.31.0-1\logs`フォルダを丸ごと削除

### Step7. シェルのセットアップ
- C:\oit\magiotYY\PortableGit-2.XX.YY.Z-64 以下に本リポジトリのPortableGitフォルダ以下をコピーする
  - PortableGit/usr/local/bin/coursegradle,coursejdk,coursevscode が更新されているかを確認する
  - etcフォルダ以下の内容も確認すること
