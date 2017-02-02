from bs4 import BeautifulSoup
import requests

def savefile(fac_url):
  #baseurl = "http://iitkgp.ac.in"
  #fac_url = baseurl+url
  semicolon = fac_url.find(';')
  r = requests.get(fac_url[:semicolon])
  print(fac_url)
  data = r.text
  print(data)
  fname = fac_url[45:semicolon]
  f = open("./htmpages/"+fname+".html", 'w')
  f.write(data)
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