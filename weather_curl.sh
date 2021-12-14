API_KEY=$(cat apikey.txt)
WEATHER=$(curl -XGET "http://api.openweathermap.org/data/2.5/weather?q=chicago&units=imperial&appid=${API_KEY}")
echo $WEATHER

CONDITION_ID=$(echo $WEATHER|sed -r 's/.*"weather":\[\{"id":([0-9]*),.*/\1/')
CONDITION=$(echo $WEATHER|sed -r 's/.*"main":"(\w*)".*/\1/')
TEMP=$(echo $WEATHER|sed -r 's/.*"temp":([0-9]*).*/\1/')

echo $CONDITION_ID
echo $CONDITION
echo $TEMP


# {"coord":{"lon":-87.65,"lat":41.85},"weather":[{"id":801,"main":"Clouds","description":"few clouds","icon":"02n"}],"base":"stations","main":{"temp":276.85,"feels_like":275.56,"temp_min":272.39,"temp_max":279.27,"pressure":1027,"humidity":73},"visibility":10000,"wind":{"speed":1.54,"deg":130},"clouds":{"all":20},"dt":1639451616,"sys":{"type":2,"id":2005153,"country":"US","sunrise":1639401000,"sunset":1639434005},"timezone":-21600,"id":4887398,"name":"Chicago","cod":200}
