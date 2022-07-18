const express = require('express');
const bodyParser = require('body-parser');

const { Console } = require("console");

const fs = require("fs");

const myLogger = new Console({
  stdout: fs.createWriteStream("logging.txt")
});

const app = express();

let userGoal = 'Versi baru nich';

app.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

app.use(express.static('public'));

app.get('/', (req, res) => {
  res.send(`
    <html>
      <head>
        <link rel="stylesheet" href="styles.css">
      </head>
      <body>
        <section>
          <h2>My Course Goal</h2>
          <h3>${userGoal}</h3>
        </section>
        <form action="/store-goal" method="POST">
          <div class="form-control">
            <label>Course Goal</label>
            <input type="text" name="goal">
          </div>
          <button>Set Course Goal</button>
        </form>
      </body>
    </html>
  `);
});

app.post('/store-goal', (req, res) => {
  const enteredGoal = req.body.goal;
  myLogger.log(enteredGoal);
  userGoal = enteredGoal;
  res.redirect('/');
});

app.get('/ping',(req, res) => 
{
   res.send({
    status: 'success',
    message: 'ping',
 
  })});


app.listen(9876);
