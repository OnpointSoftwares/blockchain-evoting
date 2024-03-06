var express = require('express');
var router = express.Router();
var db = require('../database');
var app = express();

app.use(express.urlencoded());
app.set('view engine', 'ejs');
app.use(express.static('public'));
app.use('/css', express.static(__dirname + 'public/css'));

// Display registration form
router.get('/register', function(req, res, next) {
  res.render('registration-form.ejs');
});

// Handle registration form submission
router.post('/register', function(req, res, next) {
  var inputData = {
    first_name: req.body.first_name,
    email_address: req.body.email_address,
    password: req.body.password,
    confirm_password: req.body.confirm_password
  };
  var randoNumber=Math.floor((Math.random() * 10000) + 54);
  // Check unique email address
  var sqlCheckEmail = 'SELECT * FROM registration WHERE email_address = ?';
  db.query(sqlCheckEmail, [inputData.email_address], function(err, data, fields) {
    if (err) throw err;

    if (data.length > 0) {
      var msg = inputData.email_address + ' already exists';
      res.render('registration-form.ejs', { alertMsg: msg });
    } else if (inputData.confirm_password !== inputData.password) {
      var msg = 'Password & Confirm Password do not match';
      res.render('registration-form.ejs', { alertMsg: msg });
    } else {
      // Save user's data into the registration table
      var sqlInsertRegistration = 'INSERT INTO registration SET ?';
      db.query(sqlInsertRegistration, inputData, function(err, data) {
        if (err) throw err;
        // Now, insert data into aadhar_info table
        var aadharInfoData = {
          Aadharno: randoNumber,
          Name: inputData.first_name + ' ' + inputData.last_name,
          Dob: inputData.dob,
          Email: inputData.email_address,
          Is_registered: true
        };

        var sqlInsertAadharInfo = 'INSERT INTO aadhar_info SET ?';
        db.query(sqlInsertAadharInfo, aadharInfoData, function(err, data) {
          if (err) throw err;

          var msg = 'You are successfully registered';
          res.render('registration-form.ejs', { alertMsg: msg });
        });
      });
    }
  });
});

module.exports = router;
