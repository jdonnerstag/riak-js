#!/usr/bin/env node

data = { inputs: 'riakjs_airlines',
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

