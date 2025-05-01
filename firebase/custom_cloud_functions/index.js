const admin = require("firebase-admin/app");
admin.initializeApp();

const locationReport = require("./location_report.js");
exports.locationReport = locationReport.locationReport;
const getLocationData = require("./get_location_data.js");
exports.getLocationData = getLocationData.getLocationData;
const getLoopnetProperty = require("./get_loopnet_property.js");
exports.getLoopnetProperty = getLoopnetProperty.getLoopnetProperty;
const changeUserPassword = require("./change_user_password.js");
exports.changeUserPassword = changeUserPassword.changeUserPassword;
