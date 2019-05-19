# Dog API 
If you do not have ruby and rails installed, install those. This project uses ruby 2.4.3.

Clone the project and then start the rails server locally.

# Curl request examples

Add a new dog to the json file
* curl -X POST -v -i 'http://localhost:3000/api/dogs?owner_name=Erin&name=Rory&notes=first%20dog'

Update a dog already in the json file
* curl -X PUT -v -i 'http://localhost:3000/api/dogs/40?name=Harry'

Delete a dog from the json file
* curl -X DELETE -v -i 'http://localhost:3000/api/dogs/5'

Get a dog from the json file
* curl 'http://localhost:3000/api/dogs/2’

Get all dogs from the json file
* curl 'http://localhost:3000/api/dogs’

I did end up running out of time to finish this how I would probably have liked to. I would have continued by locking it down a bit for weird inputs and better error handling and testing it a little bit more for weird cases.
