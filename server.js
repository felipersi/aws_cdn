const http = require("http");
const fs = require("fs");

const server = http.createServer((req, res) => {
  const urlPath = req.url;

  if (urlPath === "/overview") {
    res.end('Welcome to the "overview page" of the nginX project');
  } else if (urlPath === "/api") {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(
      JSON.stringify({
        product_id: "xyz12u3",
        product_name: "NginX injector",
      })
    );
  } else if (urlPath === "/") {
    fs.readFile("index.html", "utf8", (err, data) => {
      if (err) {
        res.writeHead(500, { "Content-Type": "text/plain" });
        res.end("Internal Server Error");
      } else {
        res.writeHead(200, { "Content-Type": "text/html" });
        res.end(data);
      }
    });
  } else {
    res.end("Successfully started a server");
  }
});

server.listen(3000, "172.31.1.200", () => {
  console.log("Listening for request");
});
