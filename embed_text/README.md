# 既存PDFファイルに対して、検索可能となるようテキスト情報を追加するサンプルコード

## 使用言語
Ruby

## 使用ライブラリ
- [Prawn](https://github.com/prawnpdf/prawn)

## 使用コマンド
- [PDFtk](https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/)

## 使用方法
    $ ruby embed_text.rb 1000100017.pdf output.pdf

## License
LGPLv3


(PrawnがLGPLv2 or LGPLv3のため)

## 制限その他
- 既存PDFを読み込めるgemがないため、外部コマンド(PDFtk)を呼び出しています。
（[CombinePDF](https://github.com/boazsegev/combine_pdf)も試しましたが、
　読み込み中にエラー）。
- 一箇所のみテキストを埋め込んでいます。
