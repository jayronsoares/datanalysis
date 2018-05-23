from __future__ import absolute_import, print_function
import tweepy
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
import json
import dateutil.parser
import logging

# How to fix: “UnicodeDecodeError: 'ascii' codec can't decode byte”
import sys
reload(sys)
sys.setdefaultencoding('utf-8')


# Credentials
consumer_key = ''
consumer_secret = ''
access_token = ''
access_secret = ''

# Target to scrap
# u'palavra: significa unicode string

TRACK = ['@clarotvoficial', '@ClaroBrasil', '@clarotvatende', '@NETatende', '@NEToficial',
         '@AssinantesSKY','@SKYresponde', '@skybrasil', u'problema @NETatende',
         'internet @ClaroBrasil','Internet deslisgada', 'internet deslisgada',
         'internet fora do ar','@TIMBrasil','@Vivoemrede', 'Net Virtua','net virtua',
         'desligada @clarotvoficial','Crédito Pré-Pago', 'Atendimento', 'Instalação',
         'Ativação', 'Habilitação', 'Qualidade', 'Qualidade do Serviço', 'funcionamento do Serviço'
         ,]


# Twitter Setup
auth = OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_secret)
# API instance
api = tweepy.API(auth)

class Ouvinte(StreamListener):
    def on_data(self, data):
        parsed_data=json.loads(data)
        try:
            parsed_data['created_at_datetime'] = dateutil.parser.parse(parsed_data['created_at'])
            with open('carga.json', 'a') as f:
                f.write(data)
                f.write('\n')

                return True
        except BaseException as e:
            logging.warn("Tweet without 'created_at': %s", parsed_data, exc_info=e)
            print("Error on_data: %s" % str(e))
        return True

    def on_error(self, status):
        logging.error("Invalid response from twitter api: %s" % status)


if __name__ == '__main__':

    ouvinte = Ouvinte()
    twitter_stream = Stream(auth, ouvinte)
    logging.info('... conectado')
    
    
    try:
        twitter_stream.filter(track=TRACK, languages=['pt'])
    except Exception as error:
        logging.exception('Error during stream capture: %s', error)

