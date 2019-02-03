
[1mFrom:[0m /home/hala1224/Development/so_navy/lib/so_navy/scraper.rb @ line 26 SoNavy::Scraper.scrape_items:

    [1;34m22[0m: [32mdef[0m [1;36mself[0m.[1;34mscrape_items[0m(category)
    [1;34m23[0m:   puts [31m[1;31m"[0m[31mIn Scrapper[1;31m"[0m[31m[0m
    [1;34m24[0m:   puts category.url
    [1;34m25[0m:   webpage = [1;34;4mNokogiri[0m::HTML(open(category.url))
 => [1;34m26[0m:   binding.pry
    [1;34m27[0m: 
    [1;34m28[0m:   
    [1;34m29[0m:   items = webpage.css([31m[1;31m"[0m[31mdiv.row div.col.information[1;31m"[0m[31m[0m)
    [1;34m30[0m:   items.each [32mdo[0m |card|
    [1;34m31[0m:     [1;34m#creating an instance[0m
    [1;34m32[0m:     item = [1;34;4mSoNavy[0m::[1;34;4mItem[0m.new
    [1;34m33[0m: 
    [1;34m34[0m:     [1;34m# name_and_price = card.css("a.go-link").text.split("$")[0m
    [1;34m35[0m:     [1;34m#   My scrape[0m
    [1;34m36[0m:     [1;34m#Assigning object attributes[0m
    [1;34m37[0m:       item.product = webpage.css([31m[1;31m"[0m[31m.content h2[1;31m"[0m[31m[0m).text
    [1;34m38[0m:       item.description = webpage.css([31m[1;31m"[0m[31m.content p[1;31m"[0m[31m[0m).text
    [1;34m39[0m: 
    [1;34m40[0m:     [1;34m#Assigning object attributes[0m
    [1;34m41[0m:     [1;34m# item.description = card.css("p").text[0m
    [1;34m42[0m:     [1;34m# deal.product = name_and_price[0][0m
    [1;34m43[0m:     [1;34m# deal.price = name_and_price[1][0m
    [1;34m44[0m: 
    [1;34m45[0m:     [1;34m#Associated Objects[0m
    [1;34m46[0m:     category.add_item(item)
    [1;34m47[0m: 
    [1;34m48[0m:   [32mend[0m
    [1;34m49[0m: [32mend[0m

