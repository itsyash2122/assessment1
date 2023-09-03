const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');

const app = express();
const port = 3000;

app.use(bodyParser.json());

const db = mysql.createConnection({
  host: 'notes-rds.ctxrurqykinl.us-east-1.rds.amazonaws.com',
  user: 'notes_user',
  password: 'YSHDNAJDAdha',
  database: 'notesdb',
});

db.connect(err => {
  if (err) {
    console.error('Error connecting to MySQL:', err);
    return;
  }
  console.log('Connected to MySQL database');
});

app.get('/notes', (req, res) => {
  db.query('SELECT * FROM notes', (err, results) => {
    if (err) {
      res.status(500).json({ error: 'Error retrieving notes' });
      return;
    }
    res.json(results);
  });
});

app.post('/notes', (req, res) => {
  const { title, content } = req.body;
  if (!title) {
    res.status(400).json({ error: 'Title field is required' });
    return;
  }
  db.query('INSERT INTO notes (title, content) VALUES (?, ?)', [title, content], (err, result) => {
    if (err) {
      res.status(500).json({ error: 'Error creating note' });
      return;
    }
    res.json({ id: result.insertId, title, content });
  });
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});

