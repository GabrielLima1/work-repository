// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require_tree .

// function removeField(link) {
//   $(link).prev("input[type=hidden]").val("1");
//   $(link).closest(".fields").hide();
//
//   // console.log(link);
// }
// function menu(link) {
//   url = link.attributes.href.value
//   console.log(url);
//   if (url == '/lists') {
//     setInterval(function(){
//       $("#body").css("backgroundColor","rgb(92, 184, 92) ");
//     },100)
//     console.log("ad");
//   }else if (url=='/favorites') {
//     setInterval(function(){
//       $("#body").css("backgroundColor","rgb(255,255,0)");
//     },100)
//   }
//   setInterval(function(){
//     $("#body").css("backgroundColor","rgb(92, 184, 92) ");
//   },100)
// }

function removeFields(link) {
  // $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".work-fields").hide();
  if ($(".apagar:visible").length==1) {
    $(".apagar").hide();
  }
  // console.log(link);
}
