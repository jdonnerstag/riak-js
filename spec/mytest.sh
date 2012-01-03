#!/bin/bash

server=http://localhost:8091/mapred
curl -X POST -H "content-type: application/json" $server --data @-<<EOF
{inputs:'riakjs_airlines',
  query:[{map:{name: 'Riak.mapValuesJson',
      keep: true,
      language: 'javascript' } } ] }
EOF

