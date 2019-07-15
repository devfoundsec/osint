import requests
from bs4 import BeautifulSoup

url = "https://globo.com"
ip = "10.10.10.10"
rec_site = requests.get('http://sharingmyip.com/?site='+url)
#print(rec_site.text)

soup = BeautifulSoup(rec_site.text,'html.parser')
#print("Sites para o IP:\n"+soup.textarea.string)

'''
for i in range(len(soup.textarea)):
    print(soup.textarea.string)
'''
qt_textarea = len(soup('textarea'))
msg_list = ['Site (s) neste endereço','DNS para ','Entradas de DNS relacionadas para']
#for msg in range(msg_list):
for i in range(qt_textarea):
    if (i == 0):
        print(msg_list[0]+" "+ip)
        print(soup('textarea')[i].string)
    elif i == 1:
        print(msg_list[1]+" "+url)
        print(soup('textarea')[i].string)
    elif i == 2:
        print(msg_list[2]+" "+url)
        print(soup('textarea')[i].string)
    else:
        print("Aconteceu algo errado :D")
