#!/bin/bash

# Mobile.getIdentity, username/password: more/more (DUMMY adapter)
curl -i -H "Accept: application/json" -H "Authorization: Basic bW9yZTptb3JlCg==" http://localhost:9090/admission/services/mobile/identity

# Mobile.getPerson, valid session required as HTTP header
curl -i -H "Accept: application/json" -H "X-CTU-FIT-Admission-Session: [session identifier from Mobile.getIdentity]" http://localhost:9090/admission/services/mobile/person/{admissionCode}

# Processing.admission, uses example admission from XML file and PUT request to add it 
cat example_admission.xml | curl -i -H "Accept: application/json" -H "Content-type: application/xml" -X PUT -d @- http://localhost:9090/admission/services/processing/admission

