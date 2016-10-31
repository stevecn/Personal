import json
import scrapy
from njubbs.items import njubbsItem


class njubbsSpider(scrapy.Spider):
    name = "njubbs"
    start_urls = [
        'http://bbs.nju.edu.cn/cache/t_act.js',
    ]

    def parse(self, response):
        strRe = "\"".join(response.text.split("\'"))
        print(strRe)
        strRe = strRe[5:-24]
        jsonStr = json.JSONEncoder().encode(strRe)
        print(strRe)
        # print(response.text)
        for ncd in response.xpath('//div[@id=".p.ncd__act"]'):
            item = njubbsItem()
            yield ncd.xpath('td')

