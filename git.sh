export commit = $(git log -1 | grep "commit" | cut -d " " -f 2)
export author = $(git log -1 | grep "Author" | cut -d " " -f 2)
export date = $(git log -1 | grep "Date") 
export message = $(git log -1 | awk 'NR==1{next}NR==2{next}NR==3{next}NR==4{next}1')    

curl -X POST 'https://api.newrelic.com/v2/applications/108424649/deployments.json' \
     -H 'X-Api-Key:a072c0beaab9c91f77820ceaec726562' -i \
     -H 'Content-Type: application/json' \
     -d \
'{
  "deployment": {
    "revision": "'"$commit"'",
    "changelog": ""'"$message"'"" ,
    "description": ""'"$date"'"",
    "user": ""'"$author"'""
  }
}' 
