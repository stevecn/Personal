# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class njubbsItem(scrapy.Item):
    title = scrapy.Field()
    time = scrapy.Field()
    author = scrapy.Field()
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass

class QuoteItem(scrapy.Item):
    text = scrapy.Field()
    author = scrapy.Field()
