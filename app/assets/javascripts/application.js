// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui

//= require jquery.pickachoose
//= require fancybox
//= require_tree .
/*
var album = { 
  startup: function() { 
    new PeriodicalExecuter(album.cycle, 12) // change image every 5 seconds 
  }, 
  cycle: function() { 
    new Effect.Fade('header-image', { // the id of the <DIV> containing the photos 
      duration: 4, 
      fps: 50, 
      afterFinish: function() { 
        new Ajax.Updater('header-image','/image_cycle/image', { // URL for next <IMG> tag 
          asynchronous: true, 
          onSuccess: function() { 
            new Effect.Appear('header-image', {
              duration: 4,
              fps: 50,
              queue:'end'
            })
          } 
        }) 
      } 
    }) 
  } 
} 
 
window.onload = album.startup
*/