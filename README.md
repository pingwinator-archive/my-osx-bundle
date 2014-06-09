my-osx-bundle
=============

個人用のOSXインストール用。

まだ未テストなので注意

前提
----
* Xcodeを導入済みである事。

使用方法
--------

```bash
sudo /usr/bin/xcodebuild -license
# 途中で「agree」を入力して同意する
git clone https://github.com/ariela/my-osx-bundle.git ~/my-osx-bundle
sh ~/my-osx-bundle/install.sh
```

インストール内容
----------------
* Xcode Commandline Toolsのインストール
* Homebrewのインストール
* Xcodeのライセンス承認
* Homebrewによるインストール
    * zsh
    * git
    * wget
    * brew-cask
    * wacomタブレットドライバ
    * VLC
    * Chrome
    * Flash
    * QuickSilver
    * TotalFinder
    * iTerm2
    * SourceTree
    * Dropbox
    * BlueHarvest
    * CyberDuck
    * CotEditor
    * Netbeans(PHP)
    * Virtualbox
    * Vagrant
    * Vagrant Manager
    * Notifyr
    * ATOK Passport (独自cask)
    * CLIP STUDIO PAINT (独自cask)
    * Sublime Text 3 (独自cask)
* シェルをHomebrew版のzshに変更
* ZSHの設定反映
* VIMの設定反映

[ariela/homebrew-ariela-cask](https://github.com/ariela/homebrew-ariela-cask/)
---------------------------
独自に作成したcaskの定義。サポート無しです。

* atok-passport
* clipstudio-paint
* sublime-text3
