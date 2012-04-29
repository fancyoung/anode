// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-modal
//= require bootstrap-dropdown
//= require_tree .

$(function(){
  $('#node_form').on({
    'ajax:beforeSend': function(event, xhr, settings){
      var c = $(this).find('[name="node[content]"]')
      if(c.attr('value').trim()==''){
        c.focus()
        return false
      }
      $(this).attr("disabled", "true") //bug: why not working?
      c.attr("disabled", "disabled")
      $(this).find('[type=submit]').addClass('disabled')
    }
    ,'ajax:success': function(event, text, status){
      var c = $(this).find('[name="node[content]"]')
      $(text).prependTo($('#nodes'))
      $(this).removeAttr("disabled")
      c.attr('value', '').removeAttr("disabled")
      $(this).find('[type=submit]').removeClass('disabled')
    }
  })
  $('[name="node[content]"]') && $('[name="node[content]"]').focus()
})
