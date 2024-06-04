

## endpoints: 

"/city/collect"

post: takes json
example body: 
{
    "city": "Büdingen",
    "type": 0 
}

city is city to collect

type is what is to be collected



"/city/stop"
stops collection process that matches city and type
example body: 
{
    "city": "Büdingen",
    "type": 0 
}


"/location/collect"
takes location id and type
example body: 
{
    "id": "ybnehrqj5qnqfu2",
    "type":0
}
## id needs to be in pocketbase


"/location/stop" works analog to city


"/killAll" kills all collections

"/updateAll" starts collector for all Locations in pocketbase

