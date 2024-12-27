const express = require('express');
const router = express.Router();
const Report = require('../models/Report');
const upload = require('../middleware/upload');

router.get('/', async (req, res) => {
  try {
    const reports = await Report.find().sort({ date: -1 });
    res.json(reports);
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

router.post('/upload', upload.single('image'), async (req, res) => {
  try {
    const imageUrl = `${req.protocol}://${req.get('host')}/uploads/${req.file.filename}`;
    const report = new Report({
      imageUrl,
      date: req.body.date || new Date(),
      patientId: req.body.patientId,
      description: req.body.description
    });
    const newReport = await report.save();
    res.status(201).json(newReport);
  } catch (err) {
    res.status(400).json({ message: err.message });
  }
});

router.delete('/:id', async (req, res) => {
  try {
    await Report.findByIdAndDelete(req.params.id);
    res.json({ message: 'Report deleted' });
  } catch (err) {
    res.status(500).json({ message: err.message });
  }
});

module.exports = router;