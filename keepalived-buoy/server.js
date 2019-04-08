const express = require('express');
const os = require('os');
const app = express();

const port  = 3000;

const toHHMMSS = (value) => {
  let totalSeconds = value;
  hours = Math.floor(totalSeconds / 3600);
  totalSeconds %= 3600;
  minutes = Math.floor(totalSeconds / 60);
  seconds = Math.floor(totalSeconds % 60);
  const padZero = v => String(v).padStart(2, "0");
  const time = `${padZero(hours)}:${padZero(minutes)}:${padZero(seconds)}`;
  return time;
};

app.get('/', (req, res) => res.send({
  "hostname": process.env.DOCKER_NODE_HOSTNAME,
  "containerId": os.hostname(),
  "containerUptime": toHHMMSS(process.uptime())
}));

app.get('/health', (req, res) => res.send('Ok'));

app.listen(port, () => console.log(`keepalived-buoy listening on port ${port}`));