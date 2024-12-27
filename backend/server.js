const express = require('express');
const cors = require('cors');
const path = require('path');
const connectDB = require('./config/database');
const reportsRouter = require('./routes/reports');

const app = express();
const PORT = process.env.PORT || 3000;

connectDB();

app.use(cors());
app.use(express.json());
app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use('/api/reports', reportsRouter);

app.use((err, req, res, next) => {
  res.status(500).json({ message: err.message });
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

// backend/package.json
{
  "name": "xray-report-backend",
  "version": "1.0.0",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js"
  },
  "dependencies": {
    "cors": "^2.8.5",
    "express": "^4.17.1",
    "mongoose": "^6.0.12",
    "multer": "^1.4.3"
  },
  "devDependencies": {
    "nodemon": "^2.0.14"
  }
}