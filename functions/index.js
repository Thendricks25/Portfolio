const functions = require('firebase-functions');
const admin = require("firebase-admin")
const nodemailer = require('nodemailer');

const gmailEmail = functions.config().gmail.login;
const gmailPassword = functions.config().gmail.pass;

admin.initializeApp()


var transporter = nodemailer.createTransport({
host:'smtp.gmail.com',
port: 465,
secure: true,
auth: {
user:gmailEmail,
pass:gmailPassword
}
});


exports.sendEmail = functions.firestore
.document('contact/{contactId}')
.onCreate((snap,context)=>{
const mailOptions = {

                          from: gmailEmail,
                           to: 'Thendricks25@gmail.com',
                           subject: 'Contact Form Message',
                           html:`<p> <br> ${snap.data().Name} </br> <br> ${snap.data().Email} </br> <br>${snap.data().Message}</br> </p>`,
                           };
return transporter.sendMail(mailOptions, (error,data)=>{
if (error) {
console.log(error)
return
}
console.log("Sent!")
});
});
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
