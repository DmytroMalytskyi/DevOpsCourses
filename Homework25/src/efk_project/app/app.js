const express = require("express");
const fluent = require("fluent-logger");

fluent.configure("app.logs", { host: "fluentd", port: 24224 });

const app = express();
const port = 3000;

function log(message) {
  fluent.emit("info", { message, ts: new Date().toISOString() });
}

app.get("/", (req, res) => {
  log("Root endpoint called");
  res.send("Hello from Node.js with Fluentd logging!");
});

app.listen(port, () => {
  log(`App started on port ${port}`);
  console.log("App listening on port 3000");
});
