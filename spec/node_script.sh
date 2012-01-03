#!/usr/bin/env node

var stdin = process.openStdin( );
stdin.setEncoding( 'utf8' );
var chunks = '';
stdin.on( 'data', function ( chunk ) {
    chunks += chunk.toString( 'utf8' );
} );
stdin.on('end', function () {
    var body = JSON.parse( chunks );
    eval( process.argv[ 2 ] );
} );

