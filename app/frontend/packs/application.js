// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import '../styles/application.scss'
// const images = require.context('../images', true)
const images = require.context('../../frontend/images', true)
const imagePath = (name) => images(name, true)

import 'bootstrap/dist/js/bootstrap'
import "@fortawesome/fontawesome-free/css/all"
import "lightbox2/dist/js/lightbox-plus-jquery"

let lightbox2 = function () {
    $(".lightbox2").lightbox2();
};
$(document).on("page:load ready", lightbox2);

Rails.start()
Turbolinks.start()
ActiveStorage.start()
