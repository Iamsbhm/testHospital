const mongoose = require('mongoose');

const reportSchema = new mongoose.Schema({
  imageUrl: {
    type: String,
    required: true
  },
  date: {
    type: Date,
    default: Date.now
  },
  patientId: {
    type: String,
    required: false
  },
  description: {
    type: String,
    required: false
  }
}, { timestamps: true });

module.exports = mongoose.model('Report', reportSchema);