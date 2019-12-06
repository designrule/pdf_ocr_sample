#!/bin/sh

curl http://www.soumu.go.jp/senkyo/seiji_s/seijishikin/contents/SS20191129/1000100017.pdf -O

./meta_pdf.rb 1000100017.pdf output.pdf
