from bs4 import BeautifulSoup
import requests
import re

def savefile(fac_url):
  #baseurl = "http://iitkgp.ac.in"
  #fac_url = baseurl+url
  semicolon = fac_url.find(';')
  r = requests.get(fac_url[:semicolon])
  print(fac_url)
  data = r.text
  fname = fac_url[45:semicolon]
  f = open("./htmpages/"+fname+".html", 'w')
  cleaned = re.sub('data:image/jpeg;base64.*>', "searchforme>", data)
  cleaned = re.sub('[ \r\t]{2,3}', ' ', cleaned)
  cleaned = re.sub('[\n]{2,3}', '\n', cleaned) 
  f.write(cleaned)
  f.close()

def crawl():
  url = "http://iitkgp.ac.in/department/CS"
  base = "http://iitkgp.ac.in"
  r  = requests.get(url)
  data = r.text
  soup = BeautifulSoup(data, "html.parser")
  for link in soup.find_all('a'):
      fac_url = link.get('href')
      if(fac_url is not None):
        if(fac_url[:25] == "/department/CS/faculty/cs"):
          savefile(base+fac_url)
          r = requests.get(base+fac_url)


def main():
  crawl()

if __name__=='__main__':
  main()