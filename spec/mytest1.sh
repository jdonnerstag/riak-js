#!/bin/bash

server=http://localhost:8091/mapred
curl -X POST -H "content-type: application/json" $server --data @-<<\EOF
{ inputs: 'riakjs_airlines',
  query: [ { 
    map: { 
      name: 'Riak.mapValuesJson',
      keep: true,
      language: 'javascript' 
    } },
    { reduce: { 
      source: 'function (values) { return [values.reduce( function(acc, value) { return acc + (value.fleet || value || 0); }, 0) ]; }',
      arg: undefined,
      language: 'javascript' 
    } } 
  ] };
EOF

