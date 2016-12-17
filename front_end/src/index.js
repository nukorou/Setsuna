require('./setsuna-form.tag');
require('./setsuna-list2.tag');

require("bootstrap-webpack");

require('bootstrap-material-design/dist/css/bootstrap-material-design.css');
require('bootstrap-material-design/dist/css/ripples.css');
require('bootstrap-material-design/dist/js/material.js');
require('bootstrap-material-design/dist/js/ripples.js');

require('./snackbar.css');

riot.mount('*');

$.material.init();