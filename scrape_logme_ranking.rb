#URLにアクセスするためのライブラリの読み込み
require 'open-uri'
#Nokogiriライブラリの読み込み
require 'nokogiri'

#スクレイピング先のURL
url = 'http://logmi.jp/category/it'
charset = nil
sleep(1)
html = open(url) do |f|
  charset = f.charset #文字種別を取得
 f.read #htmlを読み込んで変数htmlに渡す
end

#htmlをパース（解析）してオブジェクトを生成
doc = Nokogiri::HTML.parse(html,nil,charset)

doc.css('div#common-list-block div.inner ul.common-log-list li a div.text-title').each do |node|
  p node.text.strip
end
#p html
url = doc.css('div#common-list-block div.inner div.wp-pagenavi a.nextpostslink').attribute('href').value
while url != nil
  sleep(1)
  html = open(url) do |f|
  charset = f.charset #文字種別を取得
  f.read #htmlを読み込んで変数htmlに渡す
  end
  #htmlをパース（解析）してオブジェクトを生成
  doc = Nokogiri::HTML.parse(html,nil,charset)
 titles = doc.css('div#common-list-block div.inner ul.common-log-list li a div.text-title')
  titles.each do |node|
  p node.text.strip
  end
  url = doc.css('div#common-list-block div.inner div.wp-pagenavi a.nextpostslink').attribute('href').value
  text_page = doc.css('div#common-list-block div.inner div.wp-pagenavi span.current').text
  p text_page
end







#urls.each do |url|
 # charset = nil
  #sleep(1)
  #html = open(url) do |f|
  #charset = f.charset #文字種別を取得
  #f.read #htmlを読み込んで変数htmlに渡す
  #end
  #htmlをパース（解析）してオブジェクトを生成
  #doc = Nokogiri::HTML.parse(html,nil,charset)
  
 # doc.css('div#common-list-block div.inner ul.common-log-list li a div.text-title').each do |node|
 # p node.text.strip
 # end
#end

#doc.css('div#ranking-block').each do |node|
    #title
 #   p node.css('dd').inner_text
 # end


#doc.css('div#category-navi > div.inner > nav > ul > li > a').each do |a|
  #カテゴリ
 # p a.attribute('href').value if a.attribute('href') != nil
#end

