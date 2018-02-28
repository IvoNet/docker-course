/*
 * DON'T BE A DICK PUBLIC LICENSE
 *
 * Version 1, December 2009
 *
 * Copyright (C) 2018 IvoNet.nl <WebMaster@ivonet.nl>
 *
 *  Everyone is permitted to copy and distribute verbatim or modified
 *  copies of this license document, and changing it is allowed as long
 *  as the name is changed.
 *
 * > DON'T BE A DICK PUBLIC LICENSE
 * > TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 *
 *  1. Do whatever you like with the original work, just don't be a dick.
 *
 *      Being a dick includes - but is not limited to - the following instances:
 *
 * 	 1a. Outright copyright infringement - Don't just copy this and change the name.
 * 	 1b. Selling the unmodified original with no work done what-so-ever, that's REALLY being a dick.
 * 	 1c. Modifying the original work to contain hidden harmful content. That would make you a PROPER dick.
 *
 *  2. If you become rich through modifications, related works/services, or supporting the original work,
 *  share the love. Only a dick would make loads off this work and not buy the original work's
 *  creator(s) a pint.
 *
 *  3. Code is provided with no warranty. Using somebody else's code and bitching when it goes wrong makes
 *  you a DONKEY dick. Fix the problem yourself. A non-dick would submit the fix back.
 */

"use strict";
/**
 * Server static content.
 */
var http = require("http"),
    url = require("url"),
    path = require("path"),
    fs = require("fs"),
    walk = require('fs-walk'),
    port = process.argv[2] || 3000;

function headerContentTypeByExtension(key) {
    var types = {
        '.html': "text/html",
        '.css': "text/css",
        '.js': "text/javascript",
        '.json': "application/json",
        '.svg': "image/svg+xml"
    };

    if (key in types) {
        return {"Content-Type": types[key]};
    }

    return {"Content-Type": "text/plain"};
}

function endsWith(str, suffix) {
    return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function startsWith(str, postfix) {
    return str.indexOf(postfix, 0) === 0;
}

function sendContentNotFound(filename, response) {
    console.log(filename + " resource not found.");
    response.writeHead(404, headerContentTypeByExtension(""));
    response.write("404 Not Found\n");
    response.end();
}

function sendInternalServerError(reason, response) {
    response.writeHead(500, headerContentTypeByExtension('.html'));
    response.write("<html><body><pre>" + reason + "</pre></body></html>", "binary");
    response.end();
}

/**
 * Serve all static content.
 *
 * @param {type} filename requested resource
 * @param {type} response write response to
 */
function serveStatic(filename, response) {
    console.log(filename);
    fs.exists(filename, function (exists) {

        if (!exists) {
            return sendContentNotFound(filename, response);
        }

        function readStaticFile(filename, response) {

            fs.readFile(filename, "binary", function (err, file) {
                if (err) {
                    console.log("An error occured reading file " + filename);
                    return sendInternalServerError("An error occured reading file " + filename, response);
                }
                response.writeHead(200, headerContentTypeByExtension(path.extname(filename)));
                response.write(file, "binary");
                response.end();
            });
        }

        fs.stat(filename, function (err, stat) {
            readStaticFile(stat.isDirectory() ? filename + '/index.html' : filename, response);
        });
    });
}

http.createServer(function (request, response) {
    var uri = url.parse(request.url).pathname,
        filename = path.join(process.cwd(), decodeURI(uri)).replace(/\\/g, "/");


    if (endsWith(filename, 'quote')) {
        serveStatic(filename + ".json", response)
    } else {
        if (!startsWith(path.normalize(filename), process.cwd())) {
            sendContentNotFound(filename, response);
        }
        serveStatic(filename, response);
    }
}).listen(parseInt(port, 10));

console.log("Static file server running at => http://localhost:" + port);