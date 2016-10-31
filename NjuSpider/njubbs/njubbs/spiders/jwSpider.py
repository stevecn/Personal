import scrapy
from njubbs.items import njubbsItem

class njubbsSpider(scrapy.Spider):
    name = "njujw"
    start_urls = [
        'http://jw.nju.edu.cn/',
    ]

    def parse(self, response):
        # print(response.text)
        news = response.xpath('//div[@class="conbox1"]/div[@class="con1"]/ul/li')
        print(news)
        for li in news:
            title = li.xpath('a/@title').extract_first()
            print('\n')
            url = li.xpath('a/@href').extract_first()
            print(title)
            print(response.urljoin(url))
            print("\n")


   def articleParse(self, response):
       title = response.xpath('//div[@class="div_detail"]/div[@class="div_title"]/center').extract_first()

       print(title)
        contengt = response.xpath('//div[@class="div_detail"]/dev[@class="div_contentDetail"]')

